-- Veri seçme, listeleme
-- syntax => yazım kuralları
-- case sensitive değil!
select id, name from categories;

-- tüm alanları seçmek için => *
select * from categories;

-- sıralama
-- ürünleri stock adetine göre büyükten küçüğe göre sırala.
--Order By Default olarak küçükten büyüğe doğru sıralar
-- büyükten küçüğe sıralamak için Descending DESC kullanılmalı
select * from products
order by stock DESC

--Order By sadece matematiksel değil alfabetik sıralama da yapar.
select * from products
order by name desc


-- Filter
-- stock adeti en az 60 olan verileri göster
select * from products
where stock >= 60


-- Birden fazla filtre birleştirme
--AND , OR
-- Stock adeti en az 60 olan ve category ID 10 olan verileri getir
select * from products
where stock >= 60 and category_id = 10;

-- Stock adeti en az 60 olan veya category ID 8 olan verileri getir
select * from products
where stock >= 60 or category_id = 10


-- iki farklı isimdekileri getir
select * from products
where name = 'Çelik Halka Küpe' or name = 'Technic Yarış Uçağı 42117 Model Uçak'

--IN() fonksiyonu
-- içerisine parametre olarak verilen n kadar veri ile ilgili alanın uyuşmasını bekler. 
select * from products
where name IN('Technic Yarış Uçağı 42117 Model Uçak','Çelik Halka Küpe','Ayakkabı')


select * from products
where stock IN(30,40,100,150)

--Between keywordu
select * from products
where stock between 40 and 150


--LIKE keywordu
-- isminin içinde 't' geçen tüm ürünleri getir. 
-- pattern => kalıp
-- % => ilgili harfin sol yada sağına eklendiğinde metinden sonra gelecek metini önemsemediğimi belirtiyor
select * from products
where name LIKE '%t%'

-- tolower = lower =>  tüm harfleri küçük hale getirir. 
select * from products
where Lower(name) LIKE 't%'

-- _ => Karakter atlama 
-- 3. hafta 'c' olan tüm ürünleri getir.
Select * from products
where Lower(name) LIKE '__c%'


select * from products
where lower(name) like '%a_%'


--en az 3 örnek olacak şekilde (istanbul bölgesine giden siparişler)
--Hangi müşteri hangi ürünleri iade etmiş X
--Ankaraya kaç ürün gitmiş X
--Onur kaç ürün satın almış X
--Satıcılar kaç ürün satmış 
