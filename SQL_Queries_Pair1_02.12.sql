-- Sepetinde o an en az 5 ürün olan customerları listeleyiniz.
select cs.username, sum(bp.quantity) from basket_products bp
inner join baskets b
on bp.basket_id = b.id
inner join customers cs
on b.customer_id = cs.id
group by cs.username
having sum(bp.quantity) >= 5
order by sum(bp.quantity) desc


-- Bugüne kadar verdiği sipariş toplamı 87.5£ 'yi geçen customerları listeleyiniz.
select cs.username, sum(od.total_price) "Toplam Sipariş Tutarı" from order_details od
inner join customers cs
on od.customer_id = cs.id
group by cs.username
having sum(od.total_price) >= 87.5
order by sum(od.total_price) desc

-- Bugüne kadar en az 10.000₺ satış yapmış satıcıları listeleyiniz.
select sl.name, sum(op.total_price) "Toplam Satış Tutarı" from sellers sl
inner join products_sellers ps
on sl.id = ps.seller_id
inner join products pr
on ps.product_id = pr.id
inner join order_products op
on pr.id = op.product_id
group by sl.name
having sum(op.total_price) >= 10000

-- Her kategoride en çok kazandıran ürünü (price * quantity değeri ele alınmalıdır) listeleyiniz.
select ct.type, max(pr.name), max((op.quantity)*(pr.unit_price)) from categories ct
inner join products pr
on ct.id = pr.category_id
inner join order_products op
on pr.id = op.product_id
group by ct.type
order by max((op.quantity)*(pr.unit_price)) desc


-- Satıcıları sattığı ürün adedine göre büyükten küçüğe sıralayınız.
select sl.name, sum(op.quantity) "Toplam Satılan Adet" from sellers sl
inner join products_sellers ps
on sl.id = ps.seller_id
inner join products pr
on ps.product_id = pr.id
inner join order_products op
on pr.id = op.product_id
group by sl.name
order by sum(op.quantity) desc


-- Siparişleri içerdiği ürün adedine göre listeleyiniz.
select od.id "Sipariş Numarası", sum(op.quantity) "Siparişteki Toplam Ürün Adedi" from order_details od
inner join order_products op
on od.id = op.order_id
group by od.id
order by sum(op.quantity) desc


-- En çok kullanılan kargo şirketlerini kullanıldığı sipariş veya sipariş ürünü adedi ile birlikte listeleyiniz.
select sh.name "Kargo şirketi ismi", count(od.id) "Sipariş Adedi" from shipments sh
inner join order_shipments os
on sh.id = os.shipment_id
inner join order_details od
on os.order_id = od.id
group by sh.name
order by count(od.id) desc
limit 10

-- Ürün bilgilerini içerisinde kategori,renk,beden,satıcı,kaç adet satıldı, kaç para kazandırdı bilgileri ile listeleyiniz.
select pr.name "Ürün İsmi", ct.type "Kategori", c.name "Renk", s.name "Beden",  sum(op.quantity) "Total Satılan Adet", sum(op.total_price) "Total Kazanılan Para" from products pr
inner join categories ct
on pr.category_id = ct.id
inner join color_products cp
on pr.id = cp.product_id
inner join colors c
on cp.color_id = c.id
inner join size_products sp
on pr.id = sp.product_id
inner join sizes s
on sp.size_id = s.id
inner join order_products op
on pr.id = op.product_id
group by pr.name, ct.type, c.name, s.name
order by sum(op.total_price), sum(op.quantity)

-- Girilen Ülke için kaç adet şehir olduğunu,
select ct.name, count(distinct(c.name)) "Sistemdeki Şehir Sayısı"  from countries ct
inner join cities c
on ct.id = c.country_id
group by ct.name
order by count(distinct(c.name)) desc

-- Girilen şehir için kaç adet ilçe olduğunu,
select c.name, count(distinct(t.name)) "Sistemdeki İlçe Sayısı"  from cities c
inner join towns t
on c.id = t.city_id
group by c.name
order by count(distinct(t.name)) desc

-- Girilen ilçe için kaç adet Sokak olduğunu listeleyiniz.
select t.name, count(distinct(s.name)) "Sistemdeki İlçe Sayısı"  from towns t
inner join streets s
on t.id = s.town_id
group by t.name
order by count(distinct(s.name)) desc

--1. Tablo ekleme
CREATE TABLE deneme (
    id int NOT NULL,
    name character varying NOT NULL,
    category_id int not NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

--2. Kolon Ekleme
Alter Table deneme
add column deneme int

--3. kolona Veri ekleme
insert into deneme (
name, category_id, deneme)
values (
'isim', 2, 88)

--4. veri değiştirme
update deneme
set deneme = 5
where id = 1

--5. Like kullanımı
select * from deneme
where name not like '[!abc%]'

--6. In kullanımı
select * from deneme
where name in ('isim','name')

--7. Tablo içinden kolon silme
alter table deneme
add column silinecek int;
alter table deneme
drop column silinecek;

--8. Tabloyu boşaltma
truncate deneme

--9. Tablo silme
drop table deneme
