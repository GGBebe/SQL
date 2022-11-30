--1. Payment Tipine göre kaç farklı ödeme yapılmıştır.
select count(o.id) "Sipariş Sayısı", sum(o.total_cost) "Siparişlerin Toplam Tutarı", count(distinct(py.payment_type)) "Yapılan Farklı Ödeme Tip Sayısı" from orders o
inner join payments py
on o.payment_id = py.id
left join installments i
on py.installment_id = i.id

--2. Satıcı başına satılan toplam ürün sayısı
select sl.name "Satıcı Adı", sum(op.quantity) "Satılan Ürün Sayısı" from sellers sl
inner join product_sellers ps
on sl.id = ps.seller_id
inner join products pr
on ps.product_id = pr.id
inner join order_products op
on pr.id = op.product_id
group by sl.name
order by sum(op.quantity) desc

--3. Çankayaya ve  teslim edilmiş olan kargolar
select ds.district_name, sum(op.quantity), o.order_status from orders as o
inner join addresses as ad
on o.shipment_address_id = ad.id
inner join districts as ds
on ad.district_id = ds.id
inner join order_products as op
on o.id = op.order_id
where (ds.id = 1 or ds.id = 5)
and o.order_status = 'Teslim Edildi'
Group By o.order_status, ds.district_name, op.quantity

--4. En çok satan renkler
select sum(op.quantity) "Satılan Ürün Sayısı", cl.color_name from order_products op
inner join products pr
on op.product_id = pr.id
inner join product_colors pc
on pr.id = pc.product_id
inner join colors cl
on pc.color_id = cl.id
group by cl.color_name
order by sum(op.quantity) desc

--5. Kargoda olan ürünlerin kargo firmalarının iletişim bilgileri
select o.id "Sipariş Numarası",op.product_id, o.shipment_address_id, o.order_status, sb.shipment_brand_name "Kargo Firma Adı", sb.website  from order_products op
inner join orders o 
on op.order_id = o.id
inner join order_shipments os
on o.id = os.order_id
inner join shipments sh
on os.shipment_id = sh.id
inner join shipment_brands sb
on sh.shipment_brand_id = sb.id
where o.order_status = 'Kargoda'

--6. Sepetinde ürün bulunan müşteriler ve fiyat sıralaması
select cs.name, cs.surname, pr.name "Ürün Adı", b.total_cost from customers cs
inner join baskets b
on cs.id = b.customer_id
inner join basket_products bp
on b.id = bp.basket_id
inner join products pr
on bp.product_id = pr.id
order by b.total_cost desc

--7. İade edilen ürünlerin kim tarafından ne sebeple edildiği
select cs.name, cs.surname, rfp.quantity "İade Edilen Ürün Sayısı", rf.refund_reason "İade Sebebi" from refunds rf
inner join refund_products as rfp
on rf.id = rfp.refund_id
inner join orders as o
on o.id = rf.order_id
inner join customers as cs
on o.customer_id = cs.id

--8. Beden tiplerine göre kaç farklı ürün vardır.
select pr.name "Ürün Adı", pr.stock, s.size_type "Ürün Bedeni" from products pr
inner join product_sizes ps
on pr.id = ps.product_id
inner join sizes s
on ps.size_id = s.id
group by s.size_type, pr.name, pr.stock
order by pr.stock

--9. Birden fazla kategoride ürün barındıran markalar
select count(ct.name) "Ürün Sayısı", ct.name, ct.type, br.brand_name from products pr
inner join categories ct
on pr.category_id = ct.id
inner join brand_categories bc
on ct.id = bc.category_id
inner join brands br
on bc.brand_id = br.id
group by ct.name, ct.type, br.brand_name
order by br.brand_name

--10. Birden fazla kategoride ürün barındıran satıcılar.
select count(ct.name) "Ürün Sayısı", ct.name, ct.type, sl.name "Satıdı Adı" from products pr
inner join categories ct
on pr.category_id = ct.id
inner join product_sellers ps
on pr.id = ps.product_id
inner join sellers sl
on ps.seller_id = sl.id
group by ct.name, ct.type, sl.name
order by sl.name

--11. Geçen aydan itibaren siparişler
select o.order_date, o.total_cost, pr.name, pr.unit_price, op.quantity from orders as o
inner join order_products as op
on o.id = op.order_id
inner join products as pr
on op.product_id = pr.id
where o.order_date between date_trunc('month', current_date - interval '1' month) and now()

--12. En çok satılan ürünler
select sum(op.quantity) "Satılan Ürün Sayısı", pr.name "Ürün Adı", sum(op.total_price) "Üründen Elde Edilen Toplam Para" from order_products op
inner join products pr
on op.product_id = pr.id
Group by pr.name
order by sum(op.quantity) desc

--13. En çok ürün satın alan müşteri
select sum(op.quantity) "Satılan Ürün Sayısı", cs.name, cs.surname from order_products op
inner join orders o
on op.order_id = o.id
inner join customers cs
on o.customer_id = cs.id
group by cs.name, cs.surname
order by sum(op.quantity) desc

--14. En çok iade yapan müşteri
select cs.name, cs.surname, sum(rp.quantity) "İade Edilen Ürün Sayısı", sum(rp.total_price) "Toplam İade Tutarı" from customers cs
inner join orders o
on cs.id = o.customer_id
inner join refunds r
on o.id = r.order_id
inner join refund_products rp
on r.id = rp.refund_id
group by cs.name, cs.surname
order by sum(rp.quantity) desc
limit 1

--15. Satıcıların Puana, takipçiye ve ürün sayısına göre sıralanması
select sl.name, sl.rating, sl.follower_count,count(ps.product_id) "Satışa Konulan Ürün Sayısı" from sellers sl
inner join product_sellers ps
on sl.id = ps.seller_id
inner join products pr
on ps.product_id = pr.id
group by sl.name, sl.rating, sl.follower_count
order by (count(ps.product_id), sl.rating, sl.follower_count) desc

--16. Ürünlerin Puanlarına(DESC) ve stoklarına(asc) göre sıralanması
select name, unit_price, stock, product_rating from products 
order by product_rating desc, stock asc

--17. Kaç alışverişte taksitlendirme yapılmış
select count(o.id) "Taksitlendirme Yapılan Sipariş Sayısı" from orders o
inner join payments py
on o.payment_id = py.id
inner join installments i
on py.installment_id = i.id


--18. Taksitlendirme Yapılan Alışverişlerde Kaç ay taksit yapılmış
select o.id "Sipariş Numarası", o.total_cost, o.order_date, py.payment_type, i.intallment_type "Taksit Tipi", i.months "Taksit Süresi" from orders o
inner join payments py
on o.payment_id = py.id
inner join installments i
on py.installment_id = i.id

--19. En çok iade edilenler hangi markanın ürünü oluyor
select r.id "İade Numarası", sum(rp.quantity) "İade Edilen Ürün Sayısı", r.refund_reason "İade Sebebi", b.brand_name from refund_products rp
inner join refunds r
on rp.refund_id = r.id
inner join order_products op
on rp.order_product_id = op.id
inner join products pr
on op.product_id = pr.id
inner join categories ct
on pr.category_id = ct.id
inner join brand_categories bc
on ct.id = bc.category_id
inner join brands b
on bc.brand_id = b.id
group by b.brand_name, r.id, r.refund_reason
order by b.brand_name, sum(rp.quantity) desc

--20. En çok iade edilenler hangi satıcının ürünü oluyor
select r.id "İade Numarası", sum(rp.quantity) "İade Edilen Ürün Sayısı",pr.name "İade Edilen Ürün", r.refund_reason "İade Sebebi", sl.name from refund_products rp
inner join refunds r
on rp.refund_id = r.id
inner join order_products op
on rp.order_product_id = op.id
inner join products pr
on op.product_id = pr.id
inner join product_sellers ps
on pr.id = ps.product_id
inner join sellers sl
on ps.seller_id = sl.id
group by sl.name, r.id, r.refund_reason, pr.name
order by sl.name, sum(rp.quantity) desc

--21. En çok tercih edilen kategori (Ürün sayıları ile)
select sum(op.quantity) "Satılan Ürün Sayısı", ct.type "Kategori Tipi" from order_products op
inner join products pr
on op.product_id = pr.id
inner join categories ct
on pr.category_id = ct.id
group by ct.type
order by sum(op.quantity) desc