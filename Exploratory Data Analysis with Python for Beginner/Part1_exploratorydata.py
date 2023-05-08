##############################
# Chapter 1 : Pengenalan Library dalam Python
# Memanggil library di Python
##############################

import numpy as np
import pandas as pd

##############################
# Chapter 2 : Exploratory Data Analysis dengan Pandas - Part 1
# Cobalah untuk mengimport dataset marketplace ABC dari order.csv dan disimpan ke dalam dataframe bernama order_df.
##############################

import pandas as pd
order_df = pd.read_csv("https://storage.googleapis.com/dqlab-dataset/order.csv")

##############################
# Chapter 2 : Exploratory Data Analysis dengan Pandas - Part 1
# Cobalah untuk order dataframe dengan menuliskan syntax Python untuk melihat struktur dari order_df dengan menggunakan fungsi shape!
##############################

import pandas as pd
order_df = pd.read_csv("https://storage.googleapis.com/dqlab-dataset/order.csv")
print(order_df.shape

##############################
# Chapter 2 : Exploratory Data Analysis dengan Pandas - Part 1
# Cobalah untuk check bagaimana contoh data dari dataframe tersebut dengan fungsi head dengan limit 10 baris!
##############################

import pandas as pd
order_df = pd.read_csv("https://storage.googleapis.com/dqlab-dataset/order.csv")
print(order_df.head(10))

##############################
# Chapter 2 : Exploratory Data Analysis dengan Pandas - Part 1
# Tugas Praktek
##############################

import pandas as pd
order_df = pd.read_csv("https://storage.googleapis.com/dqlab-dataset/order.csv")
# Quick summary  dari segi kuantitas, harga, freight value, dan weight
print(order_df.describe())
# Median dari total pembelian konsumen per transaksi kolom price
print(order_df.loc[:, "price"].median())

##############################
# Chapter 3 : Exploratory Data Analysis dengan Pandas - Part 2
# Tugas Praktek : Aku pun kembali merebahkan diri di bangku dan mengutak-atik dataset order_df dengan jumlah bins=10: & Bikin saja dalam bentuk histogram price
##############################
      
import pandas as pd
import matplotlib.pyplot as plt
order_df = pd.read_csv("https://storage.googleapis.com/dqlab-dataset/order.csv")

# plot histogram kolom: price
order_df[["price"]].hist(figsize=(4, 5), bins=10, xlabelsize=8, ylabelsize=8)

plt.show()  # Untuk menampilkan histogram plot
      
      
##############################
# Chapter 3 : Exploratory Data Analysis dengan Pandas - Part 2
# menggunakan standar deviasi dan variance untuk menganalisis lebar persebaran distribusi tersebut
##############################

import pandas as pd
order_df = pd.read_csv("https://storage.googleapis.com/dqlab-dataset/order.csv")
# Standar variasi kolom product_weight_gram
order_df.loc[:, "product_weight_gram"].std()
# Varians kolom product_weight_gram
order_df.loc[:, "product_weight_gram"].var()

##############################
# Chapter 3 : Exploratory Data Analysis dengan Pandas - Part 2
# Sepertinya aku perlu  menemukan batas IQR agar bisa menentukan outliers bagi kolom product_weight_gram
##############################

import pandas as pd
order_df = pd.read_csv("https://storage.googleapis.com/dqlab-dataset/order.csv")
# Hitung quartile 1
Q1 = order_df[["product_weight_gram"]].quantile(0.25)
# Hitung quartile 3
Q3 = order_df[["product_weight_gram"]].quantile(0.75)
# Hitung inter quartile range dan cetak ke console
IQR = Q3 - Q1
print(IQR)

##############################
# Chapter 3 : Exploratory Data Analysis dengan Pandas - Part 2
# Cobalah untuk mengubah kolom freight_value menjadi shipping_cost dalam data frame order_df, dengan menggunakan fungsi rename().
##############################

import pandas as pd
order_df = pd.read_csv("https://storage.googleapis.com/dqlab-dataset/order.csv")
# Ganti nama kolom freight_value menjadi shipping_cost
order_df.rename(columns={"freight_value": "shipping_cost"}, inplace=True)
print(order_df)

##############################
# Chapter 3 : Exploratory Data Analysis dengan Pandas - Part 2
# Cobalah untuk mencari rata rata dari price per payment_type dari dataset order_df ("https://storage.googleapis.com/dqlab-dataset/order.csv")!
##############################

import pandas as pd
order_df = pd.read_csv("https://storage.googleapis.com/dqlab-dataset/order.csv")
# Hitung rata rata dari price per payment_type
rata_rata = order_df["price"].groupby(order_df["payment_type"]).mean()
print(rata_rata)

##############################
# Chapter 3 : Exploratory Data Analysis dengan Pandas - Part 2
# cari berapa harga maksimum pembelian customer di dataset order_df
##############################

import pandas as pd
order_df = pd.read_csv("https://storage.googleapis.com/dqlab-dataset/order.csv")
# Hitung harga maksimum pembelian customer
sort_harga = order_df.sort_values(by="price", ascending=True)
print(sort_harga)

##############################
# Chapter 4 : Mini Project
# 1. Median price yang dibayar customer dari masing-masing metode pembayaran.
# 2. Tentukan metode pembayaran yang memiliki basket size (rataan median price) terbesar.
# 3. Ubah freight_value menjadi shipping_cost dan cari shipping_cost termahal dari data penjualan tersebut menggunakan sort.
# 4. Untuk setiap product_category_name, berapa rata-rata weight produk tersebut dan standar deviasi mana yang terkecil dari weight tersebut,
# 5. Buat histogram quantity penjualan dari dataset tersebut untuk melihat persebaran quantity penjualan tersebut dengan bins = 5 dan figsize= (4,5)
# Khusus poin 4, tolong diperhatikan lebih ya, Aksara karena hasil analisisnya akan digunakan kepala cabang dalam menyusun strategi free ongkir.
# ##############################

import pandas as pd
import matplotlib.pyplot as plt
order_df = pd.read_csv("https://storage.googleapis.com/dqlab-dataset/order.csv")
# Median price yang dibayar customer dari masing-masing metode pembayaran. 
median_price = order_df["price"].groupby(order_df["payment_type"]).median()
print(median_price)

# Ubah freight_value menjadi shipping_cost dan cari shipping_cost 
# termahal dari data penjualan tersebut menggunakan sort.
order_df.rename(columns={"freight_value": "shipping_cost"}, inplace=True)
sort_value = order_df.sort_values(by="shipping_cost", ascending=0)
print(sort_value)

# Untuk product_category_name, berapa  rata-rata weight produk tersebut 
# dan standar deviasi mana yang terkecil dari weight tersebut, 
mean_value = order_df["product_weight_gram"].groupby(order_df["product_category_name"]).mean()
print(mean_value.sort_values())
std_value = order_df["product_weight_gram"].groupby(order_df["product_category_name"]).std()
print(std_value.sort_values())

# Buat histogram quantity penjualan dari dataset tersebutuntuk melihat persebaran quantity 
# penjualan tersebut dengan bins = 5 dan figsize= (4,5)
order_df[["quantity"]].hist(figsize=(4, 5), bins=5)
plt.show()
