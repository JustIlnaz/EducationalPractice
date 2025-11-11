-- Лабораторная работа № 2
CREATE TABLE "Academics"(
"FIO" varchar(150),
"DOB" date,
"Square" int,
"Specialization" varchar(150) ,
"Year_of_title_award" int
)


--1.	Вывести ФИО, специализацию и дату рождения всех академиков.
SELECT "FIO", "Specialization", "DOB"
FROM "Academics"
-- 2.	Создать вычисляемое поле «О присвоении звания», которое содержит информацию об академиках в виде: «Петров Петр Петрович получил звание в 1974».
SELECT "FIO" ||  'получил звание в ' ||  "Year_of_title_award" AS "О присвоении звания"
FROM  "Academics"
-- 3.	Вывести ФИО академиков и вычисляемое поле «Через 5 лет после присвоения звания».
SELECT "FIO" AS "ФИО",
	"Year_of_title_award" +  5 AS "Через 5 лет после присвоения звани"
FROM "Academics"
-- 4.	Вывести список годов присвоения званий, убрав дубликаты.
SELECT DISTINCT "Year_of_title_award" 
FROM "Academics"
-- 5.	Вывести список академиков, отсортированный по убыванию даты рождения.
SELECT *
FROM "Academics"
ORDER BY "DOB" ASC

-- 6.	Вывести список академиков, отсортированный в обратном алфавитном порядке специализаций, по убыванию года присвоения звания, и в алфавитном порядке ФИО.
SELECT *
FROM "Academics"
ORDER BY "Specialization" DESC , "Year_of_title_award" DESC, "FIO" ASC
-- 7.	Вывести первую строку из списка академиков, отсортированного в обратном алфавитном порядке ФИО.
SELECT "FIO"
FROM "Academics"
ORDER BY "FIO" DESC
LIMIT 1;

-- 8.	Вывести фамилию академика, который раньше всех получил звание.
SELECT "FIO"
FROM "Academics"
ORDER BY "Year_of_title_award"
LIMIT 1
-- 9.	Вывести первые 10% строк из списка академиков, отсортированного в алфавитном порядке ФИО.
SELECT *
FROM "Academics"
ORDER BY "FIO"
LIMIT (SELECT ROUND(COUNT(*) * 0.1) FROM "Academics") 
-- 10.	Вывести из таблицы «Академики», отсортированной по возрастанию года присвоения звания, список академиков, у которых год присвоения звания – один из первых пяти в отсортированной таблице.
SELECT *
FROM "Academics"
ORDER BY "Year_of_title_award"
LIMIT 5
-- 11.	Вывести, начиная с десятого, список академиков, отсортированный по возрастанию даты рождения.
SELECT *
FROM "Academics"
ORDER BY "DOB"
OFFSET 8 ROWS
-- 12.	Вывести девятую и десятую строку из списка академиков, отсортированного в алфавитном порядке ФИО.
SELECT *
FROM "Academics"
ORDER BY "FIO"
OFFSET 8 ROWS FETCH NEXT 2 ROW ONLY













--Лабораторная работа № 3

CREATE TABLE "Countries"(
"Name" varchar(150),
"Capital" varchar(150),
"Square" int,
"Population" int ,
"Continent" varchar(150)
)

SELECT *
FROM "Countries"
-- 1.	Вывести названия и столицы пяти наибольших стран по площади.
SELECT "Name", "Capital"
FROM "Countries"
ORDER BY "Square" DESC
LIMIT 5;

-- 2.	Вывести список африканских стран, население которых не превышает 1 млн. чел.
SELECT *
FROM "Countries"
WHERE "Continent" = 'Африка' AND "Population" < 1000000;

-- 3.	Вывести список стран, население которых больше 5 млн. чел., а площадь меньше 100 тыс. кв. км, и они расположены не в Европе.
SELECT *
FROM "Countries"
WHERE "Population" > 5000000 AND "Continent" != 'Европа' AND "Square" < 100000;
-- 4.	Вывести список стран Северной и	 Южной Америки, население которых больше 20 млн. чел., или стран Африки, у которых население больше 30 млн. чел.
SELECT *
FROM "Countries"
WHERE ("Continent" = 'Северная Америка' OR "Continent" = 'Южная Америка')
  AND "Population" > 20000000
   OR
  "Continent" = 'Африка' AND "Population" > 30000000;
  
-- 5.	Вывести список стран, население которых составляет от 10 до 100 млн. чел., а пло-щадь не больше 500 тыс. кв. км.
SELECT *
FROM "Countries"
WHERE "Population" BETWEEN 10000000 AND 100000000
  AND "Square" <= 500000;
-- 6.	Вывести список стран, названия которых не начинаются с буквы «К».
SELECT *
FROM "Countries"
WHERE "Name" NOT LIKE 'К%';
-- 7.	Вывести список стран, в названии которых третья буква – «а», а предпоследняя –«и».
SELECT *
FROM "Countries"
WHERE SUBSTRING("Name", 3, 1) = 'а'
  AND SUBSTRING("Name", LENGTH("Name") - 1, 1) = 'и';
-- 8.	Вывести список стран, в названии которых вторая буква – гласная.
SELECT *
FROM "Countries"
WHERE SUBSTRING("Name", 2, 1) IN ('а', 'е', 'ё', 'и', 'о', 'у', 'ы', 'э', 'ю', 'я');
-- 9.	Вывести список стран, названия которых начинаются с букв от «К» до «П».
SELECT *
FROM "Countries"
WHERE "Name" BETWEEN 'К' AND 'П';
-- 10.	Вывести список стран, названия которых начинаются с букв от «А» до «Г», но не с буквы «Б».
SELECT *
FROM "Countries"
WHERE "Name" BETWEEN 'А' AND 'Г'
  AND "Name" NOT LIKE 'Б%';
-- 11.	Вывести список стран, столицы которых есть в базе.
SELECT *
FROM "Countries"
WHERE "Capital" IS NOT NULL
  AND "Capital" != '';
-- 12.	Вывести список стран Африки, Северной и Южной Америки.
SELECT *
FROM "Countries"
WHERE "Continent" IN ('Африка', 'Северная Америка', 'Южная Америка');












