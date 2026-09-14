CREATE OR REPLACE TABLE
  `rakamin-kf-analytics-508501.kimia_farma.kf_analysis_table` AS

-- Memilih data yang diperlukan untuk membentuk tabel analisis
SELECT 
  ft.transaction_id, -- Kode ID Transaksi
  ft.date, -- Tanggal transaksi dilakukan
  ft.branch_id, -- Kode ID cabang Kimia Farma
  kc.branch_name, -- Nama cabang Kimia Farma
  kc.kota, -- Kota cabang Kimia Farma
  kc.provinsi, -- Provinsi cabang Kimia Farma
  kc.rating AS rating_cabang, -- Rating terhadap cabang
  ft.customer_name, -- Nama customer
  ft.product_id, -- Kode produk obat
  p.product_name, -- Nama obat
  p.price AS actual_price, -- Harga obat
  ft.discount_percentage, -- Persentase diskon

-- Menentukan persentase gross laba berdasarkan harga produk
  CASE
    WHEN p.price <= 50000 THEN 0.10
    WHEN p.price > 50000 AND p.price <= 100000 THEN 0.15
    WHEN p.price > 100000 AND p.price <= 300000 THEN 0.20
    WHEN p.price > 300000 AND p.price <= 500000 THEN 0.25
    ELSE 0.30
  END AS persentase_gross_laba,

-- Menghitung nett sales setelah diskon
  ROUND(p.price * (1 - ft.discount_percentage)) AS nett_sales,

 -- Menghitung nett profit berdasarkan nett sales dan persentase gross laba
  ROUND(p.price * (1 - ft.discount_percentage)) *
    CASE
      WHEN p.price <= 50000 THEN 0.10
      WHEN p.price > 50000 AND p.price <= 100000 THEN 0.15
      WHEN p.price > 100000 AND p.price <= 300000 THEN 0.20
      WHEN p.price > 300000 AND p.price <= 500000 THEN 0.25
      ELSE 0.30
    END AS nett_profit,

  ft.rating AS rating_transaksi

-- Menggunakan kf_final_transaction sebagai tabel utama
FROM
  `rakamin-kf-analytics-508501.kimia_farma.kf_final_transaction` AS ft
-- Menggabungkan informasi cabang berdasarkan branch_id
LEFT JOIN
  `rakamin-kf-analytics-508501.kimia_farma.kf_kantor_cabang` AS kc
ON
  ft.branch_id = kc.branch_id
-- Menggabungkan informasi produk berdasarkan product_id  
LEFT JOIN
  `rakamin-kf-analytics-508501.kimia_farma.kf_product` AS p
ON
  ft.product_id = p.product_id;
