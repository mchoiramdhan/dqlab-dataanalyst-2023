# Overall Performance by Year
# Buatlah Query dengan menggunakan SQL untuk mendapatkan total penjualan (sales) dan jumlah order (number_of_order) dari tahun 2009 sampai 2012 (years). 

SELECT YEAR(order_date) AS years,
 SUM(sales) AS sales, 
 COUNT(order_status) AS number_of_order
FROM dqlab_sales_store
WHERE order_status = "order finished"
GROUP BY years
ORDER BY years ASC;

# Overall Performance by Product Sub Category
# Buatlah Query dengan menggunakan SQL untuk mendapatkan total penjualan (sales) 
# berdasarkan sub category dari produk (product_sub_category) pada tahun 2011 dan 2012 saja (years) 

SELECT YEAR(order_date) AS years,
		product_sub_category, 
		SUM(sales) AS sales
FROM dqlab_sales_store
WHERE order_status = 'order finished' AND (YEAR(order_date) BETWEEN 2011 AND 2012)
GROUP BY years, product_sub_category
ORDER BY years ASC, sales DESC;
