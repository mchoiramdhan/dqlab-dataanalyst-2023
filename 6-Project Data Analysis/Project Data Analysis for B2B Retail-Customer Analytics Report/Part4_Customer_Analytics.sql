
--APAKAH JUMLAH CUSTOMERS XYZ.COM SEMAKIN BERTAMBAH?--
--Penambahan jumlah customers dapat diukur dengan membandingkan total jumlah customers yang registrasi di periode saat ini dengan total jumlah customers yang registrasi diakhir periode sebelumnya.

--#1.Dari tabel customer, pilihlah kolom customerID, createDate dan tambahkan kolom baru dengan menggunakan fungsi QUARTER(…) untuk mengekstrak nilai quarter dari CreateDate dan beri nama “quarter”
--#2.Filter kolom “createDate” sehingga hanya menampilkan baris dengan createDate antara 1 Januari 2004 dan 30Juni 2004
--#3.Gunakan statement Langkah 1 & 2 sebagai subquery dengan alias tabel_b
--#4.Hitunglah jumlah unik customers à tidak ada duplikasi customers dan beri nama “total_customers”
--#5.Kelompokkan total_customer berdasarkan kolom “quarter”, dan jangan lupa menambahkan kolom ini pada bagian select

SELECT quarter, COUNT(DISTINCT customerID) as total_customers
FROM
(SELECT 
	customerID, createDate, quarter(createdate) as quarter
	FROM customer
	WHERE createdate between' 2004-01-01' and '2004-06-30') as tabel_b
GROUP BY quarter;

-------------------------###----------------------------

---SEBERAPA BANYAK CUSTOMERS TERSEBUT YANG SUDAH MELAKUKAN TRANSAKI--
--Problem ini merupakan kelanjutan dari problem sebelumnya yaitu dari sejumlah customer yang registrasi di periode quarter-1 dan quarter-2, berapa banyak yang sudah melakukan transaksi

--#1.Dari tabel customer, pilihlah kolom customerID, createDate dan tambahkan kolom baru dengan menggunakan fungsi QUARTER(…) untuk mengekstrak nilai quarter dari CreateDate dan beri nama “quarter”
--#2.Filter kolom “createDate” sehingga hanya menampilkan baris dengan createDate antara 1 Januari 2004 dan 30 Juni 2004
--#3.Gunakan statement Langkah A&B sebagai subquery dengan alias tabel_b
--#4.Dari tabel orders_1 dan orders_2, pilihlah kolom customerID, gunakan DISTINCT untuk menghilangkan duplikasi, kemudian gabungkan dengan kedua tabel tersebut dengan UNION.
--#5.Filter tabel_b dengan operator IN() menggunakan 'Select statement langkah 4' , sehingga hanya customerID yang pernah bertransaksi (customerID tercatat di tabel orders) yang diperhitungkan.
--#6.Hitunglah jumlah unik customers (tidak ada duplikasi customers) di statement SELECT dan beri nama “total_customers”
--#7.Kelompokkan total_customer berdasarkan kolom “quarter”, dan jangan lupa menambahkan kolom ini pada bagian select

SELECT quarter, count(customerID) total_customers
FROM
	(SELECT
	customerID,
	createDate,
	QUARTER(createDate) as quarter
	FROM customer
	WHERE createDate between '2004-01-01' and '2004-06-30') as tabel_b
WHERE customerID IN
				(SELECT DISTINCT customerID from orders_1
				UNION
				SELECT DISTINCT customerID from orders_2)
GROUP BY quarter;





-------------------------###----------------------------


---CATEGORY PRODUK APA SAJA YANG PALING BANYAN DI ORDER OLEH CUSTOMERS DI QUARTER-2?

--#Untuk mengetahui kategori produk yang paling banyak dibeli, maka dapat dilakukan dengan menghitung total order dan jumlah penjualan dari setiap kategori produk.

---#1.Dari kolom orders_2, pilih productCode, orderNumber, quantity, status
--#2.Tambahkan kolom baru dengan mengekstrak 3 karakter awal dari productCode yang merupakan ID untuk kategori produk; dan beri nama categoryID
--#3.Filter kolom “status” sehingga hanya produk dengan status “Shipped” yang diperhitungkan
--#4.Gunakan statement Langkah 1, 2, dan 3 sebagai subquery dengan alias tabel_c
--#5.Hitunglah total order dari kolom “orderNumber” dan beri nama “total_order”, dan jumlah penjualan dari kolom “quantity” dan beri nama “total_penjualan”
--#6.Kelompokkan berdasarkan categoryID, dan jangan lupa menambahkan kolom ini pada bagian select.
--#7.Urutkan berdasarkan “total_order” dari terbesar ke terkecil

SELECT * FROM 
(SELECT categoryID ,COUNT(DISTINCT orderNumber) as total_order, sum(quantity) as total_penjualan
FROM
	(SELECT productCode, orderNumber, quantity, status, LEFT(productCode,3) as categoryID 
	FROM orders_2
	WHERE status = 'Shipped') as tabel_c
GROUP BY categoryID) AS A
ORDER BY total_order desc;




-------------------------###----------------------------

--SEBARAPA BANYAK CUSRTOMERS YANG TETAP AKTIF BERTRANSAKSI SETELAH TRANSAKSI PERTAMANYA?
--##Mengetahui seberapa banyak customers yang tetap aktif menunjukkan apakah xyz.com tetap digemari oleh customers untuk memesan kebutuhan bisnis mereka. 
--Hal ini juga dapat menjadi dasar bagi tim product dan business untuk pengembangan product dan business kedepannya.
--Adapun metrik yang digunakan disebut retention cohort. 
--Untuk project ini, kita akan menghitung retention dengan query SQL sederhana, sedangkan cara lain yaitu JOIN dan SELF JOIN akan dibahas dimateri selanjutnya :

 

--Oleh karena baru terdapat 2 periode yang Quarter 1 dan Quarter 2, maka retention yang dapat dihitung adalah retention dari customers yang berbelanja di Quarter 1 dan kembali berbelanja di Quarter 2, sedangkan untuk customers yang berbelanja di Quarter 2 baru bisa dihitung retentionnya di Quarter 3.

--#1.Dari tabel orders_1, tambahkan kolom baru dengan value “1” dan beri nama “quarter”
--#2.Dari tabel orders_2, pilihlah kolom customerID, gunakan distinct untuk menghilangkan duplikasi
--#3.Filter tabel orders_1 dengan operator IN() menggunakan 'Select statement langkah 2', sehingga hanya customerID yang pernah bertransaksi di quarter 2 (customerID tercatat di tabel orders_2) yang diperhitungkan.
--#4.Hitunglah jumlah unik customers (tidak ada duplikasi customers) dibagi dengan total_ customers dalam percentage, pada Select statement dan beri nama “Q2”

#Menghitung total unik customers yang transaksi di quarter_1
SELECT COUNT(DISTINCT customerID) as total_customers FROM orders_1;
#output = 25

SELECT 1 as quarter,
        (COUNT(DISTINCT a.customerID)/COUNT(DISTINCT b.customerID))*100 as Q2 
FROM orders_1 as a, orders_2 as b
WHERE a.customerID IN (
                        SELECT DISTINCT customerID from orders_2);

