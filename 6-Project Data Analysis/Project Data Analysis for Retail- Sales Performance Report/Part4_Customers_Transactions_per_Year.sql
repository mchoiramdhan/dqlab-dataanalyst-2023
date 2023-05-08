# Customers Transactions per Year
# DQLab Store ingin mengetahui jumlah customer (number_of_customer) yang bertransaksi setiap tahun dari 2009 sampai 2012 (years).

# Adapun output yang seharusnya dihasilkan adalah sebagai berikut.

SELECT YEAR(order_date) AS years,
		COUNT(DISTINCT customer) AS number_of_customer
FROM dqlab_sales_store
WHERE order_status = "Order Finished"
GROUP BY years
ORDER BY years