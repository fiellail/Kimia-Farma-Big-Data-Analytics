# Kimia-Farma-Big-Data-Analytics
Kimia Farma Performance Analysis 2020-2023

# Deskripsi Proyek
Proyek ini merupakan analisis data transaksi Kimia Farma yang bertujuan untuk mengetahui kinerja penjualan, performa cabang, dan keuntungan berdasarkan data transaksi yang tersedia. Pengolahan dan analisis data dilakukan menggunakan Google BigQuery dengan bahasa SQL, sedangkan hasil analisis divisualisasikan menggunakan Google Studio.
# Dataset
Analisis menggunakan beberapa dataset yang berkaitan dengan transaksi, cabang, dan produk Kimia Farma, yaitu:
- `kf_final_transaction` — berisi data transaksi
- `kf_kantor_cabang` — berisi informasi cabang
- `kf_product` — berisi informasi produk

# Proses Analisis
Data transaksi, data cabang, dan data produk digabungkan untuk membentuk tabel analisis `kf_analysis_table`.
Tabel analisis tersebut digunakan untuk memperoleh informasi mengenai:
- Total penjualan
- Total transaksi
- Total keuntungan
- Penjualan berdasarkan provinsi
- Performa cabang
- Top 10 cabang berdasarkan total transaksi
- Top 10 cabang berdasarkan net sales
- Rating cabang
- Rating transaksi

# Perhitungan
Beberapa variabel yang dihitung dalam proses analisis meliputi:
- Persentase gross laba
- Nett sales setelah diskon
- Nett profit
- Rating cabang
- Rating transaksi

# Struktur Repository
Kimia-Farma-Big-Data-Analytics/
│
├── README.md
│
└── sql/
    └── Query_Table_Analysis.sql
