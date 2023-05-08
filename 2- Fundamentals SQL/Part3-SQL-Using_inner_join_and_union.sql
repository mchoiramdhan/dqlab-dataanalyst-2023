##################################
# Chapter 1 : Penggabungan Tabel dari Relasi Kolom
# Cobalah ketik query pada code editor untuk melihat keseluruhan isi dari kolom tabel ms_item_kategori dan ms_item_warna.
##################################

select * from ms_item_kategori;

select * from ms_item_warna;

##################################
# Chapter 1 : Penggabungan Tabel dari Relasi Kolom
# Menggabungkan Tabel dengan Key Columns
##################################

SELECT * FROM ms_item_kategori, ms_item_warna
WHERE nama_barang = nama_item;

##################################
# Chapter 1 : Penggabungan Tabel dari Relasi Kolom
# Dimana dua kolom pertama adalah dari tabel ms_item_warna, dan dua kolom berikutnya dari tabel ms_item_kategori. Hal ini sesuai dengan urutan nama tabel yang diketikkan setelah FROM.
##################################

SELECT * FROM ms_item_kategori, ms_item_warna
WHERE nama_barang = nama_item

##################################
# Chapter 1 : Penggabungan Tabel dari Relasi Kolom
# Menggunakan Prefix Nama Tabel
##################################

SELECT ms_item_kategori.*, ms_item_warna.*
FROM ms_item_warna, ms_item_kategori
WHERE nama_barang = nama_item

##################################
# Chapter 1 : Penggabungan Tabel dari Relasi Kolom
# Penggabungan Tanpa Kondisi
##################################

SELECT * FROM ms_item_kategori, ms_item_warna;

##################################
# Chapter 2 : INNERJOIN
# Hasil yang diperoleh dengan penggunaan SELECT … FROM … INNER JOIN … ON …; adalah sama dengan penerapan SELECT … FROM … WHERE …;.
##################################

SELECT * FROM ms_item_warna
INNER JOIN ms_item_kategori
ON ms_item_kategori.nama_item = ms_item_warna.nama_barang

##################################
# Chapter 2 : INNERJOIN
# gunakan tabel tr_penjualan dan tabel ms_produk yang ada di-database, sehingga kita bisa lebih paham mengenai penerapan konsep JOIN di real case,
##################################

SELECT * FROM tr_penjualan; 

SELECT * FROM ms_produk;

##################################
# Chapter 2 : INNERJOIN
# menggabungkan tabel tr_penjualan dan ms_produk dan menampilkan seluruh kolom dari kedua tabel
##################################

SELECT * FROM tr_penjualan
INNER JOIN ms_produk
ON tr_penjualan.kode_produk = ms_produk.kode_produk; 

##################################
# Chapter 2 : INNERJOIN
# untuk menggabungkan tabel tr_penjualan dan ms_produk dengan kolom yang ditampilkan dari tabel tr_penjualan adalah kode_transaksi, kode_pelanggan, kode_produk, qty. Untuk tabel ms_produk tampilkan kolom nama_produk dan harga
# Kemudian aku membentuk kolom total yang merupakan hasil perkalian setiap baris pada kolom harga di tabel ms_produk dengan kolom qty di tabel tr_penjualan
# Tabel hasil penggabungan haruslah membentuk kolom-kolom dengan urutannya adalah kode_transaksi, kode_pelanggan, kode_produk, nama_produk, harga, qty, dan total
##################################

select tr_penjualan.kode_transaksi, 
		tr_penjualan.kode_pelanggan, 
		tr_penjualan.kode_produk, 
		ms_produk.nama_produk, 
		ms_produk.harga, 
		tr_penjualan.qty, 
		ms_produk.harga * tr_penjualan.qty as total 
from tr_penjualan 
inner join ms_produk 
on tr_penjualan.kode_produk = ms_produk.kode_produk;


##################################
# Chapter 3 : UNION
# Tabel yang Akan Digabungkan
##################################

SELECT * FROM tabel_A;
SELECT * FROM tabel_B;

##################################
# Chapter 3 : UNION
# Kedua tabel_A dan tabel_B sudah memiliki jumlah kolom yang sama, dan juga urutan posisi kolom juga sama, jadi bisa langsung menggabungkan kedua kolom tersebut dengan menambahkan UNION
##################################

SELECT * FROM tabel_A
UNION
SELECT * FROM tabel_B;

##################################
# Chapter 3 : UNION
# Menggunakan UNION dengan Klausa WHERE
##################################

SELECT * FROM tabel_A 
WHERE kode_pelanggan = 'dqlabcust03' 
UNION 
SELECT * FROM tabel_B 
WHERE kode_pelanggan = 'dqlabcust03';

##################################
# Chapter 3 : UNION
# Menggunakan UNION dan Menyelaraskan Kolom-Kolomnya.
##################################

SELECT CustomerName, ContactName, City, PostalCode
FROM Customers
UNION
SELECT SupplierName, ContactName, City, PostalCode
FROM Suppliers;

##################################
# Chapter 4 : Mini Project
# Dalam database, terdapat tabel ms_pelanggan yang berisi data - data pelanggan yang membeli produk dan tabel tr_penjualan yang berisi data transaksi pembelian di suatu store.
# Suatu hari, departemen marketing & promotion meminta bantuan untuk meng-query data-data pelanggan yang membeli produk Kotak Pensil DQLab, Flashdisk DQLab 32 GB, dan Sticky Notes DQLab 500 sheets.
# Buatlah query menggunakan tabel ms_pelanggan dan tr_penjualan untuk mendapatkan data - data yang diminta oleh marketing yaitu kode_pelanggan, nama_customer, alamat.
# NB: Gunakan SELECT DISTINCT untuk menghilangkan duplikasi, jika diperlukan.
##################################

SELECT DISTINCT ms_pelanggan.kode_pelanggan, ms_pelanggan.nama_customer, ms_pelanggan.alamat 
FROM ms_pelanggan INNER JOIN tr_penjualan 
ON ms_pelanggan.kode_pelanggan = tr_penjualan.kode_pelanggan WHERE tr_penjualan.nama_produk='Kotak Pensil DQLab' OR tr_penjualan.nama_produk='Flashdisk DQLab 32 GB' OR tr_penjualan.nama_produk='Sticky Notes DQLab 500 sheets';

##################################
# Chapter 4 : Mini Project
# UNION
##################################

SELECT kode_produk, nama_produk, harga FROM ms_produk_1 WHERE harga <100000 
UNION
SELECT kode_produk, nama_produk, harga FROM ms_produk_2 WHERE harga <50000;
