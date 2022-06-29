1)Найдите номер модели, скорость и размер жесткого диска для всех ПК стоимостью менее 500 дол. Вывести: model, speed и hd

select model, speed, hd from pc
where price < 500;

Результат выполнения
model	speed	hd
1232	500	10.0
1232	450	8.0
1232	450	10.0
1260	500	10.0

2)Найдите производителей принтеров. Вывести: maker

select distinct maker from Product
where type = 'Printer';

Результат выполнения
maker
A
D
E

3)Найдите номер модели, объем памяти и размеры экранов ПК-блокнотов, цена которых превышает 1000 дол.

select model, ram, screen from Laptop
where price > 1000

Результат выполнения
model	ram	screen
1750	128	14
1298	64	15
1752	128	14
4)Найдите все записи таблицы Printer для цветных принтеров.

select * from Printer
where color = 'y'

Результат выполнения 
code	model	color	type	price
3	1434	y	Jet	290.0000
2	1433	y	Jet	270.0000

5)Найдите номер модели, скорость и размер жесткого диска ПК, имеющих 12x или 24x CD и цену менее 600 дол.

select model, speed, hd from PC
where cd in ('12x', '24x') and price < 600

Результат выполнения
model	speed	hd
1232	500	10.0
1232	450	8.0
1232	450	10.0
1260	500	10.0

6)Для каждого производителя, выпускающего ПК-блокноты c объёмом жесткого диска не менее 10 Гбайт, найти скорости таких ПК-блокнотов. 
Вывод: производитель, скорость.

select distinct Product.maker, Laptop.speed from Product, Laptop
where Laptop.hd >= 10 and Product.type = 'Laptop' and Product.model = Laptop.model

Результат выполнения
maker	speed
A	450
A	600
A	750
B	750

7)Найдите номера моделей и цены всех имеющихся в продаже продуктов (любого типа) производителя B (латинская буква).

select distinct PC.model, price from PC 
join Product on PC.model = Product.model
where maker = 'B'
union 
select distinct Laptop.model, price from Laptop
join Product on Laptop.model = Product.model
where maker = 'B'
union
select distinct Printer.model, price from Printer
join Product on Printer.model = Product.model
where maker = 'B'

Результат выполнения
model	price
1121	850.0000
1750	1200.0000

8) Найдите производителя, выпускающего ПК, но не ПК-блокноты.

select distinct maker from product
where type = 'PC' and not maker in 
(select maker from product where type = 'laptop')

Результат выполнения
maker
E

9)Найдите производителей ПК с процессором не менее 450 Мгц. Вывести: Maker

Select distinct product.maker from product 
join pc on product.model = pc.model
where pc.speed >= 450 and product.type = 'pc'

Результат выполнения
maker
A
B
E

