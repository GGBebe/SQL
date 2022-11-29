-- Onur hangi üründen kaç tane satın aldı.
select cs.name, op.product_id, op.quantity, pr.name from orders as o
inner join order_products as op
on op.order_id = o.id
inner join customers as cs
on o.customer_id = cs.id
inner join products as pr
on op.product_id = pr.id
where cs.name = 'Onur'

-- kim kaç tane ürün satın aldı.
select distinct(cs.name), sum(op.quantity) from orders as o
inner join order_products as op
on op.order_id = o.id
inner join customers as cs
on o.customer_id = cs.id
group by cs.name

-- Hangi müşteri kaç ürün iade etmiş.
select cs.name, cs.surname, rfp.quantity iade_edilen_ürün_sayisi, rf.refund_reason from refunds as rf
inner join refund_products as rfp
on rf.id = rfp.refund_id
inner join orders as o
on o.id = rf.order_id
inner join customers as cs
on o.customer_id = cs.id

--Ankaraya kaç ürün gitmiş 
select ct.city_name, sum(op.quantity), o.order_status from orders as o
inner join addresses as ad
on o.shipment_address_id = ad.id
inner join districts as ds
on ad.district_id = ds.id
inner join cities as ct
on ds.city_id = ct.id
inner join order_products as op
on o.id = op.order_id
where ct.city_name = 'Ankara'
Group By o.order_status, ct.city_name, op.quantity


--Satıcılar kaç farklı üründen kaç adet satmış
select sl.name as Satıcı, count(op.quantity) as Satılan_Ürün_Sayısı, count(distinct(op.quantity)) as Satılan_farklı_ürün_sayısı from order_products as op
inner join products as pr
on op.product_id = pr.id
inner join product_sellers as prs
on pr.id = prs.product_id
inner join sellers as sl
on prs.seller_id = sl.id
group by sl.name


--Son Hafta siparişi verilen ürünler
select o.order_date, o.total_cost, pr.name, pr.unit_price, op.quantity from orders as o
inner join order_products as op
on o.id = op.order_id
inner join products as pr
on op.product_id = pr.id
where o.order_date between current_date - 7 and now()

--Hangi renkten kaç adet sipariş verilmiş
select co.color_name, sum(op.quantity) from order_products as op
inner join products as pr
on op.product_id = pr.id
inner join product_colors as pc
on pr.id = pc.product_id
inner join colors as co
on pc.color_id = co.id
group by co.color_name

--Kredi Kartı ile ödenenler
select pa.payment_type as ödeme_tipi, o.order_date as sipariş_tarihi, pr.name as ürün_adı, op.quantity as adet from orders as o 
inner join payments as pa
on o.payment_id = pa.id
inner join order_products as op
on o.id = op.order_id
inner join products as pr
on op.product_id = pr.id
where pa.payment_type = 'Kredi Kartı'

--Hangi Markalar Satıldı
select br.brand_name, sum(op.quantity) from order_products as op
inner join products as pr
on op.product_id = pr.id
inner join product_sellers as prs
on pr.id = prs.product_id
inner join sellers as sl
on prs.seller_id = sl.id
inner join brand_sellers as bs
on sl.id = bs.seller_id
inner join brands as br
on bs.brand_id = br.id
group by br.brand_name
order by sum(op.quantity) desc

--Hangi kategoriden kaç sipariş verildi.
select ct.name, sum(op.quantity) from order_products as op
inner join products as pr
on op.product_id = pr.id
inner join categories as ct
on pr.category_id = ct.id
group by ct.name


--Left join Color (Herhangi bir ürün barındırmayan renkler)
select co.color_name, co.color_code, pr.name, pr.unit_price from colors as co
left join product_colors pc
on co.id = pc.color_id
left join products pr
on pc.product_id = pr.id


--left join Brand (Türkiyede Satıcı olmayan Markalar)
select br.brand_name, bs.seller_id, sl.name from brands br
full outer join brand_sellers bs
on br.id = bs.brand_id
left join sellers sl
on bs.seller_id = sl.id
where br.service_region_id = 1 

--Right join Brand (Herhangi bir markanın ürününü satmayan satıcılar)
select sl.*, br.brand_name from brands br
right join brand_sellers bs
on br.id = bs.brand_id
right join sellers sl
on bs.seller_id = sl.id

--Right Join Product (Hiç satılmamış ürünler)
select * from order_products op
right join products pr
on op.product_id = pr.id
where op.order_id is null

--Right Join Sipariş gitmeyen adres
select o.id as "Sipariş Numarası", o.customer_id, o.total_cost, o.shipment_address_id, ad.id as "Adres Numarası", ad.title, ad.street, ad.building_name from orders o 
right join addresses ad
on o.shipment_address_id = ad.id

--Outer Join Brand ve Satıcı (Ekstra Örnek. Ürün satmayan satıcılar ve satılmayan markalar)
select * from brands br
full outer join brand_sellers bs
on br.id = bs.brand_id
full outer join sellers sl
on bs.seller_id = sl.id
where bs.id is null
