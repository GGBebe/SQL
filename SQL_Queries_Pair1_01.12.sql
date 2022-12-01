--1. Gülbahar toplam kaç ürün almış?
select ct.first_name, ct.surname, sum(op.quantity) "Alınan Ürün Sayısı" from order_products op
inner join order_details od
on op.order_id = od.id
inner join customers ct
on od.customer_id = ct.id
group by ct.first_name, ct.surname

--2. Gülbahar kaç kere iade işlemi gerçekleştirmiş?
select ct.first_name, ct.surname, count(rp.id) "Yapılan İade İşlem Sayısı" from return_products rp
inner join order_products op
on rp.order_product_id = op.id
inner join order_details od
on op.order_id = od.id
inner join customers ct
on od.customer_id = ct.id
group by ct.first_name, ct.surname

--3. Ankara ve İstanbuldan kaç ürün sipariş edilmiş?
select ct.name, count(op.id) "Verilen Sipariş Sayısı" from order_products op
inner join order_details od
on op.order_id = od.id
inner join adresses ad
on od.shipment_address_id = ad.id
inner join streets st
on ad.street_id = st.id
inner join towns t
on st.town_id = t.id
inner join cities ct
on t.city_id = ct.id
group by ct.name
Having ct.name in ('Ankara','İstanbul')
order by count(op.id) desc

--4. En pahalı ürün hangi satıcı tarafındna satılıyor
select pr.name, max(pr.unit_price) "Ürün Fiyatı", sl.name  from products pr
inner join products_sellers ps
on pr.id = ps.product_id
inner join sellers sl
on ps.seller_id = sl.id
group by pr.name, sl.name 


--5. Gülbahar'ın yaptığı alışverişlerin ortalama fiyat tutarı nedir?
select ct.first_name, ct.surname, avg(od.total_price) "Yapılan Alışverişlerin Ortalaması" from order_details od
inner join customers ct
on od.customer_id = ct.id
Group by ct.first_name, ct.surname, od.customer_id
HAVING od.customer_id = 101

--6. Gülbahar'ın yaptığı en pahalı alışveriş ve en ucuz arasındaki fiyat farkı nedir?
select ct.first_name, ct.surname, (max(od.total_price)-min(od.total_price)) "En Pahalı ve Ucuz Sipariş Arasındaki Fiyat Farkı" from order_details od
inner join customers ct
on od.customer_id = ct.id
Group by ct.first_name, ct.surname, od.customer_id
HAVING od.customer_id = 101

--7. En çok sipariş hangi şehirden verilmiştir? SUM 
select ct.name, count(od.id) "Verilen Sipariş Sayısı" from order_details od
inner join adresses ad
on od.shipment_address_id = ad.id
inner join streets st
on ad.street_id = st.id
inner join towns t
on st.town_id = t.id
inner join cities ct
on t.city_id = ct.id
group by ct.name
order by count(od.id) desc
limit 1

--8. Payment Tipine Kaç Farklı Ödeme Yapılmıştır
select count(o.id) "Sipariş Sayısı", sum(o.total_price) "Siparişlerin Toplam Tutarı", count(distinct(py.payment_type)) "Yapılan Farklı Ödeme Tip Sayısı" from order_details o
inner join payment_details pd
on o.payment_id = pd.id


--9. Sepetinde ürün bulunan müşteriler ve fiyat sıralaması
select cs.first_name, cs.surname, count(pr.name) "Ürün Sayısı", b.total_cost from customers cs
inner join baskets b
on cs.id = b.customer_id
inner join basket_products bp
on b.id = bp.basket_id
inner join products pr
on bp.product_id = pr.id
Group by cs.first_name, cs.surname, b.total_cost
order by b.total_cost desc


--10. Birden fazla ürün barındıran markalar
select count(pr.name) "Ürün Sayısı", br.name from products pr
inner join brand_products bp
on pr.id = bp.product_id
inner join brands br
on bp.brand_id = br.id
group by br.name
order by br.name


--11. Birden fazla ürün barındıran satıcılar
select count(pr.name) "Ürün Sayısı", sl.name from products pr
inner join products_sellers ps
on pr.id = ps.product_id
inner join sellers sl
on ps.seller_id = sl.id
group by sl.name
order by sl.name


--12. Geçen aydan ürünlerinin toplam  tutarı
select o.order_date, sum(o.total_price) from order_details as o
inner join order_products as op
on o.id = op.order_id
inner join products as pr
on op.product_id = pr.id
where o.order_date between date_trunc('month', current_date - interval '1' month) and now()
group by o.order_date


--13. En çok satılan ürünler
select sum(op.quantity) "Satılan Ürün Sayısı", pr.name "Ürün Adı", sum(op.total_price) "Üründen Elde Edilen Toplam Para" from order_products op
inner join products pr
on op.product_id = pr.id
Group by pr.name
having sum(op.quantity) > 1
order by sum(op.quantity) desc


--14. En çok iade yapan müşteri
select cs.first_name, cs.surname, sum(rp.quantity) "İade Edilen Ürün Sayısı", sum(rp.total_price) "Toplam İade Tutarı" from customers cs
inner join order_details o
on cs.id = o.customer_id
inner join returns r
on o.id = r.order_id
inner join return_products rp
on r.id = rp.return_id
group by cs.first_name, cs.surname
order by sum(rp.quantity) desc
limit 1


--15. Satıcıların Puana, takipçiye ve ürün sayısına göre sıralanması
select sl.name, sl.rating, sl.follower_count,count(ps.product_id) "Satışa Konulan Ürün Sayısı" from sellers sl
inner join products_sellers ps
on sl.id = ps.seller_id
inner join products pr
on ps.product_id = pr.id
group by sl.name, sl.rating, sl.follower_count
order by (count(ps.product_id), sl.rating, sl.follower_count) desc

