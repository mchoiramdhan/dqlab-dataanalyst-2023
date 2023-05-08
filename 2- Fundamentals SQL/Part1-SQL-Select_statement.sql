##############################
# Chapter 3 : Penggunaan Perintah SELECT… FROM #
# Mengambil Seluruh Kolom dalam suatu Tabel #
##############################

SELECT * FROM ms_produk;

##############################
# Chapter 3 : Penggunaan Perintah SELECT… FROM #
# Mengambil Satu Kolom dari Tabel #
##############################

SELECT nama_produk FROM ms_produk;

##############################
# Chapter 3 : Penggunaan Perintah SELECT… FROM #
# Mengambil Lebih dari Satu Kolom dari Tabel #
##############################

SELECT nama_produk, harga FROM ms_produk;

##############################
# Chapter 3 : Penggunaan Perintah SELECT… FROM #
# Membatasi Pengambilan Jumlah Row Data
##############################

SELECT nama_produk, harga
from ms_produk
limit 5;

##############################
# Chapter 3 : Penggunaan Perintah SELECT… FROM #
# Penggunaan SELECT DISTINCT statement
##############################

select distinct nama_customer, alamat
from ms_pelanggan;

##############################
# Chapter 4 : Prefix dan Alias
# Menggunakan Prefix pada Nama Kolom
##############################

select ms_produk.kode_produk from ms_produk; 

##############################
# Chapter 4 : Prefix dan Alias
# Menggunakan Alias pada Kolom
##############################

select no_urut AS nomor, nama_produk AS nama FROM ms_produk;

##############################
# Chapter 4 : Prefix dan Alias
# Menghilangkan Keyword 'AS'
##############################

SELECT no_urut nomor, nama_produk nama FROM ms_produk;

##############################
# Chapter 4 : Prefix dan Alias
# Menggabungkan Prefix dan Alias
##############################

SELECT ms_produk.harga AS harga_jual FROM ms_produk; 

##############################
# Chapter 4 : Prefix dan Alias
# Menggunakan Alias pada Tabel
##############################

SELECT * FROM ms_produk t2;

##############################
# Chapter 4 : Prefix dan Alias
# Prefix dengan Alias Tabel
##############################

select t2.nama_produk, t2.harga from ms_produk t2;

##############################
# Chapter 5 : Menggunakan Filter
# Menggunakan WHERE
##############################

SELECT * FROM ms_produk WHERE nama_produk = 'Tas Travel Organizer DQLab';

##############################
# Chapter 5 : Menggunakan Filter
# Menggunakan Operand OR
##############################

SELECT * FROM ms_produk
WHERE nama_produk = 'Gantungan Kunci DQLab' 
OR nama_produk = 'Tas Travel Organizer DQLab'
OR nama_produk = 'Flashdisk DQLab 64 GB';

##############################
# Chapter 5 : Menggunakan Filter
# Filter untuk Angka
##############################

select * from ms_produk 
where harga > 50000;

##############################
# Chapter 5 : Menggunakan Filter
# Menggunakan Operand AND
##############################

select * from ms_produk
where nama_produk = 'Gantungan Kunci DQLab'
and harga  < 50000;

##############################
# Chapter 6 : Mini Project
# Proyek dari Cabang A
##############################

SELECT kode_pelanggan, nama_produk, qty, harga, qty*harga AS total 
FROM tr_penjualan 
WHERE qty*harga >= 100000 
ORDER BY total DESC;