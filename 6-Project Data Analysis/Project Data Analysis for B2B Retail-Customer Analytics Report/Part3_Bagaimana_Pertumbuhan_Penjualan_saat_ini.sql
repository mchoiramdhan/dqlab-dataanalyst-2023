--Total Penjualan dan Revenue pada Quarter-1 (Jan, Feb, Mar) dan Quarter-2 (Apr,Mei,Jun)

--#1.Dari tabel orders_1 lakukan penjumlahan pada kolom quantity dengan fungsi aggregate sum() dan beri nama “total_penjualan”, kalikan kolom quantity dengan kolom priceEach kemudian jumlahkan hasil perkalian kedua kolom tersebut dan beri nama “revenue”
--#2.Perusahaan hanya ingin menghitung penjualan dari produk yang terkirim saja, jadi kita perlu mem-filter kolom ‘status’ sehingga hanya menampilkan order dengan status “Shipped”.
--#3.Lakukan Langkah 1 & 2, untuk tabel orders_2.

select sum(quantity) as total_penjualan,
		sum(quantity * priceEach) as revenue
from orders_1;

select sum(quantity) as total_penjualan,
		sum(quantity * priceEach) as revenue
from orders_2
where status = 'Shipped';



--################################################################---

--#Menghitung persentasi keseluruhan penjualan
--#Kedua tabel orders_1 dan orders_2 masih terpisah, untuk menghitung persentasi keseluruhan penjualan dari kedua tabel tersebut perlu digabungkan :

--#1.Pilihlah kolom “orderNumber”, “status”, “quantity”, “priceEach” pada tabel orders_1, dan tambahkan kolom baru dengan nama “quarter” dan isi dengan value “1”.
--#Lakukan yang sama dengan tabel orders_2, dan isi dengan value “2”, kemudian gabungkan kedua tabel tersebut.
--#2.Gunakan statement dari Langkah 1 sebagai subquery dan beri alias “tabel_a”.
--#3.Dari “tabel_a”, lakukan penjumlahan pada kolom “quantity” dengan fungsi aggregate sum() dan beri nama “total_penjualan”, dan kalikan kolom quantity dengan kolom priceEach kemudian jumlahkan hasil perkalian kedua kolom tersebut dan beri nama “revenue”
--#4.Filter kolom ‘status’ sehingga hanya menampilkan order dengan status “Shipped”.
--#5.Kelompokkan total_penjualan berdasarkan kolom “quarter”, dan jangan lupa menambahkan kolom ini pada bagian select.


SELECT quarter,
	sum(quantity) as total_penjualan,
	sum(quantity*priceeach) as revenue
FROM (
	SELECT orderNumber, status, quantity , priceeach, '1' as quarter FROM orders_1 
	UNION
	SELECT orderNumber, status, quantity , priceeach, '2' as quarter FROM orders_2)
as tabel_a
WHERE status = 'Shipped'
GROUP BY quarter;






