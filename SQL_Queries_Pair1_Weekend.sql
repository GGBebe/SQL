--Kargo şirketlerine toplam kaç para ödendiğini hesaplayınız.
select sh.name, sum(sh.price) "Ödenen Toplam Para" from shipments sh
inner join order_shipments os
on sh.id = os.shipment_id
inner join order_details od
on os.order_id = od.id
group by sh.name
order by sum(sh.price) desc

--Halihazırda indirimli ve isminde 'b' geçen tüm ürünleri listeleyiniz.
select * from products pr
where pr.discount_id is not null and upper(pr.name) like '%B%'

--3. harfi c olan tüm ürünleri listeleyiniz.
select * from products pr
where lower(pr.name) like '__c%'

--Bir kişinin sipariş oluştururken kullanacağı insert komutlarını yazınız (alt tablolar dahil ve siparişte en az 3 ürün olacak şekilde)
insert into order_details(
customer_id, total_price, invoice_adress_id, payment_id, shipment_address_id, order_date)
values (
1, 30, 2, 1, 2, '2022-02-12');
insert into order_products(
total_price, product_id, quantity, order_id)
values(
30,6,3, (select max(id) from order_details where customer_id = 1));

--Sipariş oluşturduktan sonra sepeti boşaltacak update komutlarını oluşturunuz.
insert into basket_products (product_id, basket_id, quantity, status)
values (3, (select max(id) from baskets where customer_id = 1), 1, false);
insert into order_details (total_price, customer_id, invoice_adress_id, payment_id, shipment_address_id, order_date)
values (30, 1, 2, 1, 2, '2022-04-12');
update baskets
set order_id = (select max(id) from order_details where customer_id = 1) where customer_id = 1;
update basket_products
set status = True where (select order_id from baskets where order_id is not null and customer_id = 1) is not null and basket_id = 4;
delete from basket_products 
product_id where status = true and (select id from baskets where customer_id = 1) = basket_id 

--İndirim halindeki ürünlerin indirim uygulanmış fiyatlarıyla listelenmesini sağlayınız.
select pr.name, pr.unit_price "İndirimsiz Fiyat", d.name "İndirim Tipi", d.percent "İndirim Yüzdesi", (pr.unit_price * (1-(d.percent/100))) "Yeni Fiyat" from products pr
inner join discounts d
on pr.discount_id = d.id

--Kullanıcı bir ürünü review ettiğinde (puanladığında) oluşacak insert komutunu geliştiriniz.
insert into user_reviews (description, customer_id, order_product_id, score)
values ('Hiç beğenmedim',101 , 3, 1.2);
insert into user_reviews (description, customer_id, order_product_id, score)
values ('Beğendim.', 101, 5, 4.5)

--Kullanıcı bir ürün iade etmek istediğinde oluşacak insert komutunu geliştiriniz.
insert into returns (
total_refund, description, order_id, payment_detail_id, refund_date)
values(1000, 'iade', 3, 1, '2022-12-04');
insert into return_products (
order_product_id,return_id,quantity,return_reason, total_price)
values (1, (select max(id) from returns where order_id = 3), 1, 'Beğenmedim', 1000);

--İade durumları değiştiğinde oluşacak update komutunu geliştiriniz.
update returns 
set description = 'İade Onaylandı'
where customer_approve = true

--Satıcı ürünü güncellemek istediğinde oluşacak örnek bir update komutu geliştiriniz.
update products
set name = 'bilgisayar'
where name = 'bicgisayar'


--Sipariş durumu (kargoda,taşımada vs) değiştiğinde tabloda değişikliği yapacak update komutunu geliştiriniz.
update order_products
set shipment_status = 'Teslim Edildi'
where shipment_status = 'Kargoda'

--Kullanıcı sepete ürün eklediğinde oluşacak insert komutunu geliştiriniz.
insert into baskets (customer_id,total_cost)
values (103,10);
insert into basket_products (product_id, basket_id, quantity)
values (3, (select max(id) from baskets where customer_id = 103), 1);

--Kullanıcı sepetteki ürün adetini artırdığında oluşacak komutu geliştiriniz.
update basket_products
set quantity = 3
where product_id = 3

--En az bir sipariş vermiş ancak hiç "MNG Kargo" kullanmamış müşterileri listeleyiniz
select cs.username, sh.name "Kargo Firma Adı" from customers cs
inner join order_details od
on cs.id = od.customer_id
inner join order_shipments os
on od.id = os.order_id
inner join shipments sh
on os.shipment_id = sh.id
where not sh.name = 'MNG Kargo'
group by cs.username, sh.name

--En az bir adet aynı üründen 10+ sipariş vermiş kullanıcıları ve ürünü listeleyiniz.
select op.product_id, cs.username, sum(op.quantity) from order_products op
inner join order_details od
on op.order_id = od.id
inner join customers cs
on od.customer_id = cs.id
group by op.product_id, cs.username
having sum(op.quantity) > 10

--Onaylanmamış ödemeleri listeleyiniz.
select od.id "Sipariş Numarası", pd.status from order_details od
inner join payment_details pd
on od.payment_id = pd.id
where not pd.status = 'Onaylandı' or pd.status is null

--En az 2 farklı ülkede adresi olan kullanıcıları listeleyiniz.
select cs.username, count(co.name) "Farklı Şehirlerdeki Adres Sayısı" from customers cs
inner join adresses ad
on cs.id = ad.customer_id
inner join streets st
on ad.street_id = st.id
inner join towns t
on st.town_id = t.id
inner join cities ct
on t.city_id = ct.id
inner join countries co
on ct.country_id = co.id
group by cs.username
having count(co.name) >= 2

--EN az 2 farklı şehirde adresi olan ve bu adreslere en az 1 adet sipariş vermiş kullanıcıları listeleyiniz.
select count(od.id) "Toplam Sipariş Sayısı", cs.first_name, count(ad.id) "Toplam Adres Numarası", count(distinct(ct.name)) "Farklı şehirdeki Sipariş gönderilmiş adres sayısı" from order_details od
inner join adresses ad
on od.shipment_address_id = ad.id
inner join customers cs
on ad.customer_id = cs.id
inner join streets st
on ad.street_id = st.id
inner join towns t
on st.town_id = t.id
inner join cities ct
on t.city_id = ct.id
group by cs.first_name
Having count(distinct(ct.name))>=2


--Eklenmiş ancak hiç bir siparişte kullanılmamış adresleri listeleyiniz.
select od.id "Sipariş Numarası", od.order_date "Sipariş Tarihi", ad.* from order_details od
right join adresses ad
on od.shipment_address_id = ad.id
where od.id is null
