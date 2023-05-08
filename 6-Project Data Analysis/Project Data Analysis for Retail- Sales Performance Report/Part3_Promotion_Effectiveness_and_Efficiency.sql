# Promotion Effectiveness and Efficiency by Years
# Pada bagian ini kita akan melakukan analisa terhadap efektifitas dan efisiensi dari promosi yang sudah dilakukan selama ini

# Efektifitas dan efisiensi dari promosi yang dilakukan akan dianalisa berdasarkan Burn Rate yaitu 
# dengan membandigkan total value promosi yang dikeluarkan terhadap total sales yang diperoleh

# DQLab berharap bahwa burn rate tetap berada diangka maskimum 4.5%

# Formula untuk burn rate : (total discount / total sales) * 100

# Buatkan Derived Tables untuk menghitung total sales (sales) dan total discount (promotion_value) 
# berdasarkan tahun(years) dan formulasikan persentase burn rate nya (burn_rate_percentage).

SELECT
 YEAR(order_date) AS years, 
 SUM(sales) as sales, 
 SUM(discount_value) AS promotion_value,
 ROUND((SUM(discount_value)/SUM(sales))*100,2) AS burn_rate_percentage
FROM dqlab_sales_store
WHERE order_status = "Order Finished"
GROUP BY years
ORDER BY years ASC;

# Promotion Effectiveness and Efficiency by Product Sub Category
# Pada bagian ini kita akan melakukan analisa terhadap efektifitas dan efisiensi dari promosi yang sudah dilakukan selama ini seperti pada bagian sebelumnya. 

# Akan tetapi, ada kolom yang harus ditambahkan, yaitu : product_sub_category dan product_category

# Adapun output yang seharusnya dihasilkan adalah sebagai berikut:

# Notes :

# Data yang ditampilkan hanya untuk tahun 2012
# Contoh output di atas hanya 5 baris pertama dari output yang diharapkan

SELECT YEAR(order_date) as years, 
	product_sub_category, 
	product_category, 
 	SUM(sales) AS sales, 
 	SUM(discount_value) AS promotion_value, 
 	ROUND((SUM(discount_value)/SUM(sales))*100,2) AS burn_rate_percentage
FROM dqlab_sales_store
WHERE order_status = "Order Finished"
 	AND YEAR(order_date) = 2012
group by years, 
 	product_sub_category, 
 	product_category
ORDER BY sales DESC;