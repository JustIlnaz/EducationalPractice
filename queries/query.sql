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









-- Лабораторная работа № 4

-- 1.	Вывести список академиков, отсортированный по количеству символов в ФИО.
SELECT *
FROM "Academics"
ORDER BY LENGTH("FIO")
-- 2.	Вывести список академиков, убрать лишние пробелы в ФИО.
SELECT trim("FIO"), "DOB", "Specialization"
FROM "Academics"
-- 3.	Найти позиции «ов» в ФИО каждого академика. Вывести ФИО и номер позиции.
SELECT 
    "FIO", 
    STRPOS("FIO", 'ов') AS "Position"
FROM 
    "Academics"
-- 4.	Вывести ФИО и последние две буквы специализации для каждого академика.
SELECT 
    "FIO",
    CASE 
        WHEN LENGTH("Specialization") >= 2 THEN RIGHT("Specialization", 2)
        ELSE "Specialization" -- Выводим всю строку, если длина меньше 2
    END AS "Последние_две_буквы_специализации"
FROM 
    "Academics";
-- 5.	Вывести список академиков, ФИО в формате Фамилия и Инициалы.
SELECT 
    CONCAT(
        SPLIT_PART("FIO", ' ', 1), -- Фамилия
        ' ',
        SUBSTRING(SPLIT_PART("FIO", ' ', 2) FROM 1 FOR 1), -- Первая буква имени
        '.',
        SUBSTRING(SPLIT_PART("FIO", ' ', 3) FROM 1 FOR 1)  -- Первая буква отчества
    ) AS "Фамилия и инициалы"
FROM "Academics";
-- 6.	Вывести список специализаций в правильном и обратном виде. Убрать дубликаты.
SELECT DISTINCT
    "Specialization" AS "Прямой порядок",
    REVERSE("Specialization") AS "Обратный порядок"
FROM "Academics";
-- 7.	Вывести свою фамилию в одной строке столько раз, сколько вам лет.
SELECT REPEAT('Фазлиахметов ', 18) AS "Повторенная фамилия";
-- 8.	Вывести абсолютное значение функций 2^2 − 2^3 с точностью два знака после десятичной запятой.
SELECT ABS(ROUND(2*2 - 2*2*2, 2)) AS "абсолютное значение"
-- 9.	Вывести количество дней до конца семестра.
SELECT '2025-12-31':: DATE - CURRENT_DATE AS "количество дней до конца семестра."
-- 10.	Вывести количество месяцев от вашего рождения.
SELECT 
    EXTRACT(YEAR FROM AGE('2025-11-11'::DATE, '2007-08-23'::DATE)) * 12 +
    EXTRACT(MONTH FROM AGE('2025-11-11'::DATE, '2007-08-23'::DATE)) AS "Количество месяцев от рождения";
-- 11.	Вывести ФИО и високосность года рождения каждого академика.
SELECT 
    "FIO",
    CASE 
        WHEN EXTRACT(MONTH FROM "DOB") = 2 AND EXTRACT(DAY FROM "DOB") = 29 
        THEN 'Год рождения високосный (родился 29 февраля)'
        ELSE 
            CASE 	
                WHEN EXTRACT(YEAR FROM "DOB") % 4 = 0 AND 
                     (EXTRACT(YEAR FROM "DOB") % 100 != 0 OR EXTRACT(YEAR FROM "DOB") % 400 = 0)
                THEN 'Год рождения високосный'
                ELSE 'Год рождения не високосный'
            END
    END AS "Високосность года рождения"
FROM "Academics";
-- 12.	Вывести список специализаций без повторений. Для каждой специализации вывести «длинный» или «короткий», в зависимости от количества символов.
 SELECT DISTINCT
    "Specialization",
    CASE 
        WHEN LENGTH("Specialization") > 10 THEN 'длинный'
        ELSE 'короткий'
    END AS "Длинна"
FROM "Academics";








-- Лабораторная работа № 5

-- 1.	Вывести минимальную площадь стран.
SELECT MIN("Square") AS  "минимальная площадь стран"
FROM "Countries";
--2.	Вывести наибольшую по населению страну в Северной и Южной Америке.
SELECT MAX("Population")
FROM "Countries"
WHERE "Continent" IN ('Южная Америка','Северная Америка')
-- 3.	Вывести среднее население стран. Результат округлить до одного знака.
SELECT ROUND(AVG("Population"),1)
FROM "Countries"
-- 4.	Вывести количество стран, у которых название заканчивается на «ан», кроме стран, у которых название заканчивается на «стан».
SELECT COUNT(*) AS "Количество стран"
FROM "Countries"
WHERE 
    "Name" LIKE '%ан'
    AND 
    "Name" NOT LIKE '%стан';
-- 5.	Вывести количество континентов, где есть страны, название которых начинается с буквы «Р».
SELECT "Continent"
FROM "Countries"
WHERE "Name" LIKE 'Р%'
--  6.	Сколько раз страна с наибольшей площадью больше, чем страна с наименьшей площадью?
SELECT MAX("Square") /  MIN("Square") AS "настолько раз больше"
FROM "Countries"

-- 7.	Вывести количество стран с населением больше, чем 100 млн. чел. на каждом кон-тиненте. Результат отсортировать по количеству стран по возрастанию.
SELECT 
    "Continent",
    COUNT(*) AS "CountryCount"
FROM 
    "Countries"
WHERE 
    "Population" > 100000000
GROUP BY 
    "Continent"
ORDER BY 
    "CountryCount" ASC;


--  8.	Вывести количество стран по количеству букв в названии. Результат отсортировать по убыванию.
SELECT 
    LENGTH("Name") AS "NameLength",
    COUNT(*) AS "CountryCount"
FROM 
    "Countries"
GROUP BY 
    "NameLength"
ORDER BY 
    "CountryCount" DESC;
-- 9.	Ожидается, что через 20 лет население мира вырастет на 10%. Вывести список континентов с прогнозируемым населением:
SELECT 
    "Continent",
    ROUND(SUM("Population" * 1.1),0) AS "ProjectedPopulation"
FROM 
    "Countries"
GROUP BY 
    "Continent"
ORDER BY 
    "ProjectedPopulation" DESC;
-- 10.	Вывести список континентов, где разница по площади между наибольшими и наименьшими странами не более в 10000 раз:
SELECT "Continent"
FROM "Countries"
GROUP BY "Continent"
HAVING MAX("Square") / MIN("Square") <= 10000;
--  11.	Вывести среднюю длину названий Африканских стран.
SELECT AVG(LENGTH(Name)) AS AvgNameLength
FROM "Countries"
WHERE "Continent" = 'Африка';
-- 12.	Вывести список континентов, у которых средняя плотность среди стран с населе-нием более 1 млн. чел. больше, чем 30 чел. на кв. км.
SELECT "Continent"
FROM "Countries"
WHERE "Population" > 1000000
GROUP BY "Continent"
HAVING AVG("Population" * 1.0 / "Square") > 30;


-- Лабораторная работа № 6

CREATE TABLE faculty (
    abbr VARCHAR(10) PRIMARY KEY,
    name TEXT NOT NULL
);



CREATE TABLE department (
    code VARCHAR(10) PRIMARY KEY,
    name TEXT NOT NULL,
    faculty_abbr VARCHAR(10) NOT NULL REFERENCES faculty(abbr)
);



CREATE TABLE staff (
    staff_id INTEGER PRIMARY KEY,
    dept_code VARCHAR(10) NOT NULL REFERENCES department(code),
    full_name TEXT NOT NULL,
    position TEXT NOT NULL,
    salary NUMERIC(10,2),
    supervisor_id INTEGER REFERENCES staff(staff_id)
);


CREATE TABLE program (
    code VARCHAR(10) PRIMARY KEY,
    title TEXT NOT NULL,
    dept_code VARCHAR(10) NOT NULL REFERENCES department(code)
);



CREATE TABLE course (
    course_id INTEGER PRIMARY KEY,
    workload INTEGER NOT NULL,
    title TEXT NOT NULL,
    dept_code VARCHAR(10) NOT NULL REFERENCES department(code)
);



CREATE TABLE curriculum (
    program_code VARCHAR(10) REFERENCES program(code),
    course_id INTEGER REFERENCES course(course_id),
    PRIMARY KEY (program_code, course_id)
);





CREATE TABLE head_of_department (
    staff_id INTEGER PRIMARY KEY REFERENCES staff(staff_id),
    experience_years INTEGER NOT NULL
);


CREATE TABLE engineer (
    staff_id INTEGER PRIMARY KEY REFERENCES staff(staff_id),
    specialty TEXT NOT NULL
);



CREATE TABLE lecturer (
    staff_id INTEGER PRIMARY KEY REFERENCES staff(staff_id),
    title TEXT,
    degree TEXT
);



CREATE TABLE student (
    reg_num INTEGER PRIMARY KEY,
    program_code VARCHAR(10) NOT NULL REFERENCES program(code),
    full_name TEXT NOT NULL
);



CREATE TABLE exam (
    exam_date DATE NOT NULL,
    course_id INTEGER NOT NULL REFERENCES course(course_id),
    reg_num INTEGER NOT NULL REFERENCES student(reg_num),
    staff_id INTEGER NOT NULL REFERENCES staff(staff_id),
    classroom TEXT NOT NULL,
    grade INTEGER CHECK (grade BETWEEN 2 AND 5),
    PRIMARY KEY (exam_date, course_id, reg_num)
);

-- 1.	Вывести из таблиц «Кафедра», «Специальность» и «Студент» данные о студентах, которые обучаются на данном факультете (например, «ит»).
SELECT 
    s.reg_num AS регистрационный_номер,
    s.full_name AS фио_студента,
    p.code AS код_специальности,
    p.title AS специальность,
    d.name AS кафедра,
    f.name AS факультет
FROM student s
JOIN program p ON s.program_code = p.code
JOIN department d ON p.dept_code = d.code
JOIN faculty f ON d.faculty_abbr = f.abbr
WHERE f.abbr = 'ит';
-- 2.	Вывести из таблиц «Кафедра», «Специальность» и «Сотрудник» данные о выпус-кающих кафедрах (факультет, шифр, название, фамилию заведующего). Выпускающей счита-ется та кафедра, на которую есть ссылки в таблице «Специальность».
SELECT DISTINCT
    f.name AS факультет,
    d.code AS шифр,
    d.name AS название_кафедры,
    st.full_name AS заведующий
from department d
  join program p on p.dept_code = d.code
  join faculty f on f.abbr = d.faculty_abbr
  join staff st on st.dept_code = d.code
-- 3.	Вывести в запросе для каждого сотрудника номер и фамилию его непосредствен-ного руководителя. Для заведующих кафедрами поле руководителя оставить пустым.
SELECT 
    s.staff_id AS сотрудник_id,
    s.full_name AS фио_сотрудника,
    s.position AS должность,
    COALESCE(m.full_name, 'Нет руководителя') AS руководитель_фио,
    m.staff_id AS руководитель_id
FROM staff s
LEFT JOIN staff m ON s.supervisor_id = m.staff_id
ORDER BY s.staff_id;
-- 4.	Вывести список студентов, сдавших минимум два экзамена.
SELECT 
    s.reg_num AS регистрационный_номер,
    s.full_name AS фио_студента,
    COUNT(e.exam_date) AS количество_экзаменов
FROM student s
JOIN exam e ON s.reg_num = e.reg_num
GROUP BY s.reg_num, s.full_name
HAVING COUNT(e.exam_date) >= 2;
-- 5.	Вывести список инженеров с зарплатой, меньшей 20000 руб.
SELECT 
    s.reg_num AS регистрационный_номер,
    s.full_name AS фио_студента,
    COUNT(e.exam_date) AS количество_экзаменов
FROM student s
JOIN exam e ON s.reg_num = e.reg_num
GROUP BY s.reg_num, s.full_name
HAVING COUNT(e.exam_date) >= 2;
-- 6.	Вывести список студентов, сдавших экзамены в заданной аудитории. аудитория т506
SELECT DISTINCT
    s.reg_num AS регистрационный_номер,
    s.full_name AS фио_студента,
    e.classroom AS аудитория,
    e.exam_date AS дата_экзамена
FROM student s
JOIN exam e ON s.reg_num = e.reg_num
WHERE e.classroom = 'т506';

-- 7.	Вывести из таблиц «Студент» и «Экзамен» учетные номера и фамилии студентов, а также количество сданных экзаменов и средний балл для каждого студента только для тех студентов, у которых средний балл не меньше заданного (например, 4).
SELECT 
    s.reg_num AS регистрационный_номер,
    s.full_name AS фио_студента,
    COUNT(e.grade) AS количество_экзаменов,
    ROUND(AVG(e.grade), 2) AS средний_балл
FROM student s
JOIN exam e ON s.reg_num = e.reg_num
GROUP BY s.reg_num, s.full_name
HAVING AVG(e.grade) >= 4;
-- 8.	Вывести список заведующих кафедрами и их зарплаты, и степень.
SELECT 
    st.full_name AS фио_заведующего,
    st.salary AS зарплата,
    l.degree AS степень,
    d.name AS кафедра
FROM staff st
JOIN head_of_department hod ON st.staff_id = hod.staff_id
LEFT JOIN lecturer l ON st.staff_id = l.staff_id
JOIN department d ON st.dept_code = d.code;

-- 9. Вывести список профессоров.
SELECT 
    st.full_name AS фио_преподавателя,
    st.position AS должность,
    l.title AS ученое_звание,
    l.degree AS ученая_степень,
    d.name AS кафедра
FROM staff st
JOIN lecturer l ON st.staff_id = l.staff_id
JOIN department d ON st.dept_code = d.code
WHERE LOWER(st.position) LIKE '%профессор%' OR LOWER(l.title) LIKE '%профессор%';
-- 10.	Вывести название дисциплины, фамилию, должность и степень преподавателя, дату и место проведения экзаменов в хронологическом порядке в заданном интервале даты.
SELECT 
    c.title AS название_дисциплины,
    st.full_name AS фио_преподавателя,
    st.position AS должность,
    l.degree AS ученая_степень,
    e.exam_date AS дата_экзамена,
    e.classroom AS аудитория
FROM exam e
JOIN course c ON e.course_id = c.course_id
JOIN staff st ON e.staff_id = st.staff_id
LEFT JOIN lecturer l ON st.staff_id = l.staff_id
WHERE e.exam_date BETWEEN '2015-06-05' AND '2015-06-10'
ORDER BY e.exam_date;

-- 11.	Вывести фамилию преподавателей, принявших более трех экзаменов.
SELECT 
    st.full_name AS фио_преподавателя,
    st.position AS должность,
    COUNT(e.exam_date) AS количество_принятых_экзаменов
FROM staff st
JOIN exam e ON st.staff_id = e.staff_id
GROUP BY st.staff_id, st.full_name, st.position
HAVING COUNT(e.exam_date) > 3;
-- 12.	Вывести список студентов, не сдавших ни одного экзамена в указанной дате. 2015-06-9
SELECT 
    s.reg_num AS регистрационный_номер,
    s.full_name AS фио_студента,
    p.title AS специальность
FROM student s
JOIN program p ON s.program_code = p.code
WHERE s.reg_num NOT IN (
    SELECT reg_num 
    FROM exam 
    WHERE exam_date = '2015-06-9');








-- Лабораторная работа № 7

-- 1.	Вывести объединенный результат выполнения запросов, которые выбирают страны с площадью меньше 500 кв. км и с площадью больше 5 млн. кв. км:
SELECT *
FROM "Countries"
WHERE "Square" < 500
UNION
SELECT *
FROM "Countries"
WHERE "Square" > 5000000;
-- 2.	Вывести список стран с площадью больше 1 млн. кв. км, исключить страны с насе-лением меньше 100 млн. чел.
SELECT *
FROM "Countries"
WHERE "Square" > 1000000
EXCEPT
SELECT *
FROM "Countries"
WHERE "Population"  < 100000000;
-- 3.	Вывести список стран с площадью меньше 500 кв. км и с населением меньше 100	тыс. чел.
SELECT *
FROM "Countries"
WHERE "Square" < 500
INTERSECT
SELECT *
FROM "Countries"
WHERE "Population" < 100000;










-- Лабораторная работа № 8

-- 1.	Вывести список стран и процентное соотношение площади каждой из них к общей площади всех стран мира.
SELECT
    "Name",
    ROUND(("Square" * 100.0) / (SELECT SUM("Square") FROM "Countries"),2) AS Percentage
FROM "Countries";
-- 2.	Вывести список стран мира, плотность населения которых больше, чем средняя плотность населения всех стран мира.
SELECT
    "Name",
    "Population",
    "Square",
    ("Population" * 1.0) / "Square" AS Density
FROM "Countries"
WHERE ("Population" * 1.0) / "Square" >
    (SELECT AVG(("Population" * 1.0) / "Square") FROM "Countries" WHERE "Square" > 0);
-- 3.	С помощью подзапроса вывести список европейских стран, население которых меньше 5 млн. чел.
SELECT
    "Name",
    "Population"
FROM "Countries"
WHERE "Name" IN (
    SELECT "Name"
    FROM "Countries"
    WHERE "Continent" = 'Европа'
)
AND "Population"< 5000000;
-- 4.	Вывести список стран и процентное соотношение их площади к суммарной площади той части мира, где они находятся.
SELECT
    c."Name",
    (c."Square" * 100.0) / (
        SELECT SUM("Square")
        FROM "Countries"
        WHERE "Continent" = c."Continent"
    ) AS "Percentage"
FROM "Countries" c;
-- 5.	Вывести список стран мира, площадь которых больше, чем средняя площадь стран той части света, где они находятся.
SELECT
    c."Name",
    c."Square"
FROM "Countries" c
WHERE c."Square" > (
    SELECT AVG("Square")
    FROM "Countries"
    WHERE "Continent" = c."Continent"
);
-- 6.	Вывести список стран мира, которые находятся в тех частях света, средняя плотность населения которых превышает общемировую.
SELECT
    c."Name",
    c."Continent"
FROM "Countries" c
WHERE (
    SELECT AVG(("Population") / "Square")
    FROM "Countries"
    WHERE "Continent" = c."Continent" AND "Square" > 0
) > (
    SELECT AVG(("Population") / "Square")
    FROM "Countries" WHERE "Square" > 0
);
-- 7.	Вывести список южноамериканских стран, в которых живет больше людей, чем в любой африканской стране.
SELECT
    "Name",
    "Population"
FROM "Countries"
WHERE "Continent" = 'Южная Америка'
  AND "Population" > (
      SELECT MAX("Population")
      FROM "Countries"
      WHERE "Continent" = 'Африка'
  );

-- 8.	Вывести список африканских стран, в которых живет больше людей, чем хотя бы водной южноамериканской стране.
SELECT
	"Name",
	"Population"
FROM "Countries"
WHERE "Continent" = 'Африка'
	AND "Population" > (
	SELECT  MIN("Population")
	FROM "Countries"
	WHERE "Continent" = 'Южная Америка'
);
-- 9.	Если в Африке есть хотя бы одна страна, площадь которой больше 2 млн. кв. км, вывести список всех африканских стран.
SELECT
    "Name",
    "Square"
FROM "Countries"
WHERE "Continent" = 'Африка'
  AND EXISTS (
      SELECT 1
      FROM "Countries"
      WHERE "Continent" = 'Африка' AND "Square" > 2000000
  );
-- 10.	Вывести список стран той части света, где находится страна «Фиджи».
SELECT
    "Name"
FROM "Countries"
WHERE "Continent" = (
    SELECT "Continent"
    FROM "Countries"
    WHERE "Name" = 'Фиджи'
);
-- 11.	Вывести список стран, население которых не превышает население страны «Фиджи».
SELECT "Name"
FROM "Countries"
WHERE "Population" < (
    SELECT "Population"
    FROM "Countries"
    WHERE "Name" = 'Фиджи'
);
-- 12.	Вывести название страны с наибольшим населением среди стран с наименьшей площадью на каждом континенте.
SELECT "Name" FROM "Countries" c1 
WHERE c1."Square" = (SELECT MIN("Square") FROM "Countries" c2 
WHERE c2."Continent" = c1."Continent" AND c2."Square" > 0) AND c1."Population" = (SELECT MAX("Population") 
FROM "Countries" c3 
WHERE c3."Continent" = c1."Continent" AND c3."Square" = (SELECT MIN("Square") 
FROM "Countries" c4 
WHERE c4."Continent" = c1."Continent"  AND c4."Square" > 0));








-- Лабораторная работа № 9

-- 1. Создать таблицу «Управление_ВашаФамилия». Определить основной ключ, идентификатор, значение по умолчанию
CREATE TABLE "Control_Fazliakhmetov" (
    id SERIAL PRIMARY KEY, 
    created_at DATE DEFAULT CURRENT_TIMESTAMP 
);

-- 2. Создать таблицу «Страны_ВашаФамилия». Определить основной ключ, разрешение / запрет на NULL, условие на вводимое значение.
CREATE TABLE "Countries_Fazliakhmetov" (
    id SERIAL PRIMARY KEY,
    country_name VARCHAR(255) NOT NULL, 
    population BIGINT CHECK (population >= 0) 
);

-- 3. Создать таблицу «Цветы_ВашаФамилия». Определить основной ключ, значения столбца «ID» сделать уникальными, для столбца «Класс» установить значение по умолчанию «Двудольные».
CREATE TABLE "Flowers_Fazliakhmetov" (
    id INT UNIQUE, 
    flower_id SERIAL,
    PRIMARY KEY (flower_id), 
    name VARCHAR(255) NOT NULL,
    class VARCHAR(100) DEFAULT 
);

-- 4. Создать таблицу «Животные_ВашаФамилия». Определить основной ключ, значения столбца «ID» сделать уникальными, для столбца «Отряд» установить значение по умолчанию «Хищные».
CREATE TABLE "Animals_Fazliakhmetov" (
    id INT UNIQUE,
    animal_id SERIAL,
    PRIMARY KEY (animal_id),
    name VARCHAR(255) NOT NULL,
    order_name VARCHAR(100) DEFAULT 'Хищные' 
);











-- Лабораторная работа № 10
CREATE TABLE students(
	id INT PRIMARY KEY,
	surname VARCHAR(150),
	subject VARCHAR(150),
	school VARCHAR(150),
	points FLOAT
);
	

-- 1. В таблицу «Ученики» внести новую запись для ученика школы № 18 Трошкова, оценка которого по химии неизвестна.
INSERT INTO students (id, surname, subject, school, points) 
VALUES (11, 'Трошкова', 'Химия', 'Школа 18', NULL);

-- 2. В таблицу «Ученики» внести три строки.
INSERT INTO students (id, surname, subject, school, points) VALUES
(12, 'Волкова', 'Математика', 'Школа 18', 85.0),
(13, 'Гришин', 'Физика', 'Школа 21', 76.0),
(14, 'Лебедева', 'Химия', 'Гимназия', 90.0);

-- 3. В таблице «Ученики» изменить данные Трошкова, школу исправить на № 21, предмет на математику, а оценку на 56.
UPDATE students 
SET school = 'Школа 21', subject = 'Математика', points = 56.0 
WHERE surname = 'Трошкова';

-- 4. В таблице «Ученики» изменить данные всех учеников по химии, оценку увеличить на 10%, если она ниже 60 баллов.
UPDATE students 
SET points = points * 1.1 
WHERE subject = 'Химия' AND points < 60;

-- 5. В таблице «Ученики» удалить данные всех учеников из школы №21.
DELETE FROM students 
WHERE school = 'Школа 21';

-- 6. Создать таблицу «Гимназисты» и скопировать туда данные всех гимназистов, кроме тех, которые набрали меньше 60 баллов.
CREATE TABLE gymnasium_students AS
SELECT * FROM students 
WHERE school = 'Гимназия' AND points > 60;

-- 7. Очистить таблицу «Гимназисты».
TRUNCATE TABLE gymnasium_students;



















-- Лабораторная работа № 11

-- 1.	Даны числа A и B. Найти и вывести их произведение.
DO $$
DECLARE
    A INT := 5;
    B INT := 7;
    P INT;
BEGIN
    P := A * B;
    RAISE INFO '%', P;
END $$;
-- 2.	В таблице «Ученики» найти разницу между средними баллами лицеистов и гимназистов.
DO $$
DECLARE
    avg_liceum FLOAT;
    avg_gimn FLOAT;
    diff FLOAT;
BEGIN
    SELECT AVG(points) INTO avg_liceum FROM students WHERE school = 'Лицей';
    SELECT AVG(points) INTO avg_gimn FROM students WHERE school = 'Гимназия';
    diff := COALESCE(avg_liceum, 0) - COALESCE(avg_gimn, 0);
    RAISE NOTICE '%', diff;
END $$;
-- 3.	В таблице «Ученики» проверить на четность количество строк.
DO $$
DECLARE
    count_rows INT;
BEGIN
    SELECT COUNT(*) INTO count_rows FROM students;
    IF count_rows % 2 = 0 THEN
        RAISE NOTICE 'Четное';
    ELSE
        RAISE NOTICE 'Нечетное';
    END IF;
END $$;
-- 4.	Дано четырехзначное число. Вывести сумму его цифр.
DO $$
DECLARE
    num INT := 1234;
    sum_digits INT := 0;
BEGIN
    sum_digits := (num / 1000) + ((num % 1000) / 100) + ((num % 100) / 10) + (num % 10);
    RAISE NOTICE '%', sum_digits;
END $$;
-- 5.	Даны случайные целые числа a, b и c. Найти наименьшее из них.
DO $$
DECLARE
    a INT := FLOOR(RANDOM() * 100)::INT;
    b INT := FLOOR(RANDOM() * 100)::INT;
    c INT := FLOOR(RANDOM() * 100)::INT;
    min_val INT;
BEGIN
    min_val := LEAST(a, b, c);
    RAISE NOTICE '%', min_val;
END $$;
-- 6.	Дано случайное целое число a. Проверить, делится ли данное число на 11.
DO $$
DECLARE
    a INT := FLOOR(RANDOM() * 1000)::INT;
BEGIN
    IF a % 11 = 0 THEN
        RAISE NOTICE '% делится на 11', a;
    ELSE
        RAISE NOTICE '% не делится на 11', a;
    END IF;
END $$;
-- 7.	Дано случайное целое число N (N < 1000). Если оно является степенью числа 3, то вывести «Да», если не является – вывести «Нет».
DO $$
DECLARE
    N INT := FLOOR(RANDOM() * 1000)::INT;
    temp INT;
BEGIN
    temp := N;
    WHILE temp > 1 LOOP
        IF temp % 3 = 0 THEN
            temp := temp / 3;
        ELSE
            EXIT;
        END IF;
    END LOOP;

    IF temp = 1 THEN
        RAISE NOTICE 'Да';
    ELSE
        RAISE NOTICE 'Нет';
    END IF;
END $$;
-- 8.	Даны случайные целые числа a и b. Найти наименьший общий кратный (НОК).
DO $$
DECLARE
    a INT := FLOOR(RANDOM() * 100)::INT;
    b INT := FLOOR(RANDOM() * 100)::INT;
    x INT;
    y INT;
    gcd INT;
    lcm INT;
BEGIN
    x := a;
    y := b;

    WHILE x != y LOOP
        IF x > y THEN
            x := x - y;
        ELSE
            y := y - x;
        END IF;
    END LOOP;

    gcd := x;
    lcm := (a * b) / gcd;
    RAISE NOTICE 'НОК = %', lcm;
END $$;
-- 9.	Даны два целых числа A и B (A<B). Найти сумму квадратов всех целых чисел от A до B включительно.
DO $$
DECLARE
    A INT := 1;
    B INT := 5;
    sum_sq INT := 0;
BEGIN
    WHILE A <= B LOOP
        sum_sq := sum_sq + A * A;
        A := A + 1;
    END LOOP;
    RAISE NOTICE '%', sum_sq;
END $$;
-- 10.	Найти первое натуральное число, которое при делении на 2, 3, 4, 5, и 6 дает остаток 1, но делится на 7.
DO $$
DECLARE
    N INT := 1;
BEGIN
    LOOP
        IF N % 2 = 1 AND N % 3 = 1 AND N % 4 = 1 AND N % 5 = 1 AND N % 6 = 1 AND N % 7 = 0 THEN
            RAISE NOTICE '%', N;
            EXIT;
        END IF;
        N := N + 1;
    END LOOP;
END $$;
-- 11.	Вывести свою фамилию на экран столько раз, сколько в нем букв.
DO $$
DECLARE
    surname TEXT := 'Фазлиахметов';
    i INT := 0;
    len INT;
BEGIN
    len := LENGTH(surname);
    WHILE i < len LOOP
        RAISE NOTICE '%', surname;
        i := i + 1;
    END LOOP;
END $$;
-- 12.	Напишите код для вывода на экран с помощью цикла:

-- Н

-- иНи

-- жиНиж

-- нжиНижн

-- енжиНижне

-- венжиНижнев

-- авенжиНижнева

-- равенжиНижневар

-- травенжиНижневарт

-- отравенжиНижневарто

-- вотравенжиНижневартов

-- свотравенжиНижневартовс

-- ксвотравенжиНижневартовск
DO $$
DECLARE
    name TEXT := 'ксовтравенжиНижневартовск';
    total_len INT;
    len INT := 0;
    left_part TEXT;
    right_part TEXT;
BEGIN
    total_len := LENGTH(name);

    WHILE len < total_len LOOP
        left_part := LEFT(name, len + 1);
        right_part := REVERSE(LEFT(name, len));
        RAISE NOTICE '%', left_part || right_part;
        len := len + 1;
    END LOOP;

    len := total_len - 2;
    WHILE len >= 0 LOOP
        left_part := LEFT(name, len + 1);
        right_part := REVERSE(LEFT(name, len));
        RAISE NOTICE '%', left_part || right_part;
        len := len - 1;
    END LOOP;
END $$;








-- Лабораторная работа № 12

-- 1.	Напишите функцию для вывода названия страны с заданной столицей, и вызовите ее.
CREATE OR REPLACE FUNCTION get_country_by_capital(cap_name TEXT)
RETURNS TEXT AS $$
BEGIN
    RETURN (SELECT "Name" FROM "Countries" WHERE "Capital" = cap_name LIMIT 1);
END;
$$ LANGUAGE plpgsql;

-- Пример вызова
SELECT get_country_by_capital('Бразилиа');
-- 2.	Напишите функцию для перевода населения в млн. чел. и вызовите ее.
CREATE OR REPLACE FUNCTION population_in_millions(pop BIGINT)
RETURNS NUMERIC(10,2) AS $$
BEGIN
    RETURN pop::NUMERIC / 1000000;
END;
$$ LANGUAGE plpgsql;

-- Пример вызова
SELECT population_in_millions(146000000);
-- 3.	Напишите функцию для вычисления плотности населения заданной части света и вызовите ее.
CREATE OR REPLACE FUNCTION density_by_continent(cont_name TEXT)
RETURNS NUMERIC(10,2) AS $$
DECLARE
    total_pop BIGINT;
    total_square NUMERIC;
    density NUMERIC;
BEGIN
    SELECT SUM("Population"), SUM("Square")
    INTO total_pop, total_square
    FROM "Countries"
    WHERE "Continent" = cont_name;

    IF total_square IS NULL OR total_square = 0 THEN
        RETURN 0;
    END IF;

    density := total_pop::NUMERIC / total_square;
    RETURN ROUND(density, 2);
END;
$$ LANGUAGE plpgsql;

-- Пример вызова
SELECT density_by_continent('Европа');
-- 4.	Напишите функцию для поиска страны, третьей по населению и вызовите ее.
CREATE OR REPLACE FUNCTION get_third_most_populous_country()
RETURNS TEXT AS $$
BEGIN
    RETURN (
        SELECT "Name"
        FROM "Countries"
        ORDER BY "Population" DESC
        LIMIT 1 OFFSET 2
    );
END;
$$ LANGUAGE plpgsql;

-- Пример вызова:
SELECT get_third_most_populous_country();
-- 5.	Напишите функцию для поиска страны с максимальным населением в заданной ча-сти света и вызовите ее. Если часть света не указана, выбрать Азию.
CREATE OR REPLACE FUNCTION get_max_population_country_in_continent(cont_name TEXT DEFAULT 'Азия')
RETURNS TEXT AS $$
BEGIN
    RETURN (
        SELECT "Name"
        FROM "Countries"
        WHERE "Continent" = cont_name
        ORDER BY "Population" DESC
        LIMIT 1
    );
END;
$$ LANGUAGE plpgsql;

-- Пример вызова
SELECT get_max_population_country_in_continent('Европа');
SELECT get_max_population_country_in_continent(); -- Азия по умолчанию
-- 6.	Напишите функцию для замены букв в заданном слове от третьей до предпоследней на “тест” и примените ее для столицы страны.
CREATE OR REPLACE FUNCTION replace_chars_in_word(word TEXT)
RETURNS TEXT AS $$
DECLARE
    len INT;
    result TEXT;
BEGIN
    len := LENGTH(word);
    IF len < 4 THEN
        RETURN word;
    END IF;

    result := SUBSTRING(word FROM 1 FOR 2) || 'тест' || SUBSTRING(word FROM len FOR 1);
    RETURN result;
END;
$$ LANGUAGE plpgsql;

-- Пример вызова
SELECT replace_chars_in_word("Capital") FROM "Countries" WHERE "Name" = 'Австрия';
-- 7.	Напишите функцию, которая возвращает количество стран, не содержащих в названии заданную букву.
CREATE OR REPLACE FUNCTION count_countries_without_letter(letter TEXT)
RETURNS INTEGER AS $$
BEGIN
    RETURN (
        SELECT COUNT(*)
        FROM "Countries"
        WHERE "Name" NOT ILIKE '%' || letter || '%'
    );
END;
$$ LANGUAGE plpgsql;

-- Пример вызова
SELECT count_countries_without_letter('и');
-- 8.	Напишите функцию для возврата списка стран с площадью меньше заданного числа и вызовите ее.
CREATE OR REPLACE FUNCTION countries_with_area_less_than(max_square NUMERIC)
RETURNS TABLE("Name" "varchar", "Capital" "varchar", "Square" int, "Population" int, "Continent" "varchar") AS $$
BEGIN
    RETURN QUERY
    SELECT c."Name", c."Capital", c."Square", c."Population", c."Continent"
    FROM "Countries" AS c
    WHERE c."Square" < max_square;
END;
$$ LANGUAGE plpgsql;

-- Пример вызова
SELECT * FROM countries_with_area_less_than(500000);
-- 9. 	Напишите функцию для возврата списка стран с населением в интервале заданных значений и вызовите ее.
CREATE OR REPLACE FUNCTION countries_by_population_range(min_pop int, max_pop int)
RETURNS TABLE("Name" "varchar", "Capital" "varchar", "Square" int, "Population" int, "Continent" "varchar") AS $$
BEGIN
    RETURN QUERY
    SELECT c."Name", c."Capital", c."Square", c."Population", c."Continent"
    FROM "Countries" AS c
    WHERE c."Population" BETWEEN min_pop AND max_pop;
END;
$$ LANGUAGE plpgsql;

-- Пример вызова
SELECT * FROM countries_by_population_range(10000000, 50000000);
-- 10. 	Напишите функцию для возврата таблицы с названием континента и суммарным населением и вызовите ее.
CREATE OR REPLACE FUNCTION continent_total_population()
RETURNS TABLE("Continent" TEXT, "Total_Population" BIGINT) AS $$
BEGIN
    RETURN QUERY
    SELECT c."Continent", SUM(c."Population")::BIGINT AS "Total_Population"
    FROM "Countries" AS c
    GROUP BY c."Continent"
    ORDER BY "Total_Population" DESC;
END;
$$ LANGUAGE plpgsql;

-- Пример вызова
SELECT * FROM continent_total_population();

-- Пример вызова
SELECT * FROM continent_total_population();
-- 11.	Напишите функцию IsPalindrom(P) целого типа, возвращающую 1, если целый па-раметр P (P > 0) является палиндромом, и 0 в противном случае.
CREATE OR REPLACE FUNCTION IsPalindrom(P INTEGER)
RETURNS INTEGER AS $$
DECLARE
    str_p TEXT;
    reversed_str TEXT;
BEGIN
    IF P <= 0 THEN
        RETURN 0;
    END IF;

    str_p := P::TEXT;
    reversed_str := REVERSE(str_p);

    IF str_p = reversed_str THEN
        RETURN 1;
    ELSE
        RETURN 0;
    END IF;
END;
$$ LANGUAGE plpgsql;

-- Пример вызова
SELECT IsPalindrom(12321); -- 1
SELECT IsPalindrom(12345); -- 0
-- 12.	Напишите функцию Quarter(x, y) целого типа, определяющую номер координатной четверти, содержащей точку с ненулевыми вещественными координатами (x, y).
CREATE OR REPLACE FUNCTION Quarter(x NUMERIC, y NUMERIC)
RETURNS INTEGER AS $$
BEGIN
    IF x > 0 AND y > 0 THEN
        RETURN 1;
    ELSIF x < 0 AND y > 0 THEN
        RETURN 2;
    ELSIF x < 0 AND y < 0 THEN
        RETURN 3;
    ELSIF x > 0 AND y < 0 THEN
        RETURN 4;
    ELSE
        RETURN 0; -- точка на оси
    END IF;
END;
$$ LANGUAGE plpgsql;

-- Пример вызова
SELECT Quarter(3.5, -2.1); -- 4
SELECT Quarter(-1.0, 4.0); -- 2
-- 13.	Напишите функцию IsPrime(N) целого типа, возвращающую 1, если целый пара-метр N (N > 1) является простым числом, и 0 в противном случае.
CREATE OR REPLACE FUNCTION IsPrime(N INTEGER)
RETURNS INTEGER AS $$
DECLARE
    i INTEGER;
BEGIN
    IF N <= 1 THEN
        RETURN 0;
    END IF;
    IF N = 2 THEN
        RETURN 1;
    END IF;
    IF N % 2 = 0 THEN
        RETURN 0;
    END IF;

    FOR i IN 3..FLOOR(SQRT(N)) BY 2 LOOP
        IF N % i = 0 THEN
            RETURN 0;
        END IF;
    END LOOP;

    RETURN 1;
END;
$$ LANGUAGE plpgsql;

-- Пример вызова
SELECT IsPrime(17); -- 1
SELECT IsPrime(15); -- 0
-- 14.	Напишите код для удаления созданных вами функций 
DROP FUNCTION IF EXISTS get_country_by_capital(TEXT);
DROP FUNCTION IF EXISTS population_in_millions(BIGINT);
DROP FUNCTION IF EXISTS density_by_continent(TEXT);
DROP FUNCTION IF EXISTS get_third_most_populous_country();
DROP FUNCTION IF EXISTS get_max_population_country_in_continent(TEXT);
DROP FUNCTION IF EXISTS replace_chars_in_word(TEXT);
DROP FUNCTION IF EXISTS count_countries_without_letter(TEXT);
DROP FUNCTION IF EXISTS countries_with_area_less_than(NUMERIC);
DROP FUNCTION IF EXISTS countries_by_population_range(BIGINT, BIGINT);
DROP FUNCTION IF EXISTS continent_total_population();
DROP FUNCTION IF EXISTS IsPalindrom(INTEGER);
DROP FUNCTION IF EXISTS Quarter(NUMERIC, NUMERIC);
DROP FUNCTION IF EXISTS IsPrime(INTEGER);























-- Лабораторная работа № 13

-- 1.	Создайте курсор, содержащий отсортированные по баллам фамилии и баллы уче-ников, откройте его, выведите первую строку, закройте и освободите курсор.
DO $$
DECLARE
    cur_student CURSOR FOR
        SELECT surname, points
        FROM students
        ORDER BY points DESC;
    v_surname TEXT;
    v_points INT;
BEGIN
    OPEN cur_student;
    FETCH NEXT FROM cur_student INTO v_surname, v_points;
    RAISE NOTICE 'Первый ученик: %, Баллы: %', v_surname, v_points;
    CLOSE cur_student;
END $$;
-- 2.	Создайте курсор с прокруткой, содержащий список учеников, откройте его, выве-дите пятую, предыдущую, с конца четвертую, следующую, первую строку, закройте и освобо-дите курсор.
DO $$
DECLARE
    cur_student SCROLL CURSOR FOR
        SELECT surname, subject, school, points
        FROM students
        ORDER BY surname;
    v_surname TEXT;
    v_subject TEXT;
    v_school TEXT;
    v_points INT;
BEGIN
    OPEN cur_student;

    -- 5-я строка
    FETCH ABSOLUTE 5 FROM cur_student INTO v_surname, v_subject, v_school, v_points;
    RAISE NOTICE '5-я строка: %, %, %, %', v_surname, v_subject, v_school, v_points;

    -- Предыдущая (4-я)
    FETCH PRIOR FROM cur_student INTO v_surname, v_subject, v_school, v_points;
    RAISE NOTICE 'Предыдущая: %, %, %, %', v_surname, v_subject, v_school, v_points;

    -- 4-я с конца
    FETCH ABSOLUTE -4 FROM cur_student INTO v_surname, v_subject, v_school, v_points;
    RAISE NOTICE '4-я с конца: %, %, %, %', v_surname, v_subject, v_school, v_points;

    -- Следующая (5-я с конца)
    FETCH NEXT FROM cur_student INTO v_surname, v_subject, v_school, v_points;
    RAISE NOTICE 'Следующая: %, %, %, %', v_surname, v_subject, v_school, v_points;

    -- Первая
    FETCH FIRST FROM cur_student INTO v_surname, v_subject, v_school, v_points;
    RAISE NOTICE 'Первая: %, %, %, %', v_surname, v_subject, v_school, v_points;

    CLOSE cur_student;
END $$;
-- 3.	Создайте курсор с прокруткой, содержащий список учеников, откройте его, выве-дите последнюю, шесть позиций назад находящуюся, четыре позиций вперед находящуюся строку, закройте и освободите курсор.
DO $$
DECLARE
    cur_student SCROLL CURSOR FOR
        SELECT surname, subject, school, points
        FROM students
        ORDER BY surname;
    v_surname TEXT;
    v_subject TEXT;
    v_school TEXT;
    v_points INT;
BEGIN
    OPEN cur_student;

    -- Последняя строка
    FETCH LAST FROM cur_student INTO v_surname, v_subject, v_school, v_points;
    RAISE NOTICE 'Последняя: %, %, %, %', v_surname, v_subject, v_school, v_points;

    -- Шесть позиций назад (т.е. на 6-ю позицию от конца)
    MOVE BACKWARD 6 FROM cur_student;
    FETCH RELATIVE 0 FROM cur_student INTO v_surname, v_subject, v_school, v_points; -- Текущая позиция
    RAISE NOTICE 'Шесть назад: %, %, %, %', v_surname, v_subject, v_school, v_points;

    -- Четыре позиции вперед (от текущей позиции)
    MOVE FORWARD 4 FROM cur_student;
    FETCH RELATIVE 0 FROM cur_student INTO v_surname, v_subject, v_school, v_points;
    RAISE NOTICE 'Четыре вперед: %, %, %, %', v_surname, v_subject, v_school, v_points;

    CLOSE cur_student;
END $$;
-- 4.	С помощью курсора, вычислите сумму баллов у учеников с наибольшим и наименьшим баллом.
DO $$
DECLARE
    cur_student SCROLL CURSOR FOR
        SELECT surname, points
        FROM students
        ORDER BY points DESC;
    v_surname TEXT;
    v_points INT;
    max_points INT := 0;
    min_points INT := 0;
BEGIN
    OPEN cur_student;

    -- Первый — максимальный балл
    FETCH FIRST FROM cur_student INTO v_surname, v_points;
    max_points := v_points;
    RAISE NOTICE 'Максимальный балл: % (%)', v_surname, max_points;

    -- Последний — минимальный балл
    FETCH LAST FROM cur_student INTO v_surname, v_points;
    min_points := v_points;
    RAISE NOTICE 'Минимальный балл: % (%)', v_surname, min_points;

    RAISE NOTICE 'Сумма: %', max_points + min_points;

    CLOSE cur_student;
END $$;
-- 5.	С помощью курсора, сгенерируйте строку вида «Ученики <список фамилий и названий предметов, разделенных запятыми> участвовали в олимпиаде».
DO $$
DECLARE
    cur_student CURSOR FOR
        SELECT surname, subject
        FROM students
        ORDER BY surname;
    v_surname TEXT;
    v_subject TEXT;
    result_text TEXT := '';
BEGIN
    OPEN cur_student;

    LOOP
        FETCH NEXT FROM cur_student INTO v_surname, v_subject;
        EXIT WHEN NOT FOUND;

        IF result_text = '' THEN
            result_text := v_surname || ' (' || v_subject || ')';
        ELSE
            result_text := result_text || ', ' || v_surname || ' (' || v_subject || ')';
        END IF;
    END LOOP;

    RAISE NOTICE 'Ученики % участвовали в олимпиаде', result_text;

    CLOSE cur_student;
END $$;
-- 6.	Создайте курсор, содержащий список учеников, с его помощью выведите учеников с нечетной позицией.
DO $$
DECLARE
    cur_student CURSOR FOR
        SELECT surname, subject, school, points
        FROM students
        ORDER BY surname;
    v_surname TEXT;
    v_subject TEXT;
    v_school TEXT;
    v_points INT;
    row_num INT := 0;
BEGIN
    OPEN cur_student;

    LOOP
        FETCH NEXT FROM cur_student INTO v_surname, v_subject, v_school, v_points;
        EXIT WHEN NOT FOUND;

        row_num := row_num + 1;
        IF row_num % 2 = 1 THEN
            RAISE NOTICE 'Нечетная позиция %: %, %, %, %', row_num, v_surname, v_subject, v_school, v_points;
        END IF;
    END LOOP;

    CLOSE cur_student;
END $$;
-- 7.	Создайте курсор, содержащий отсортированный по убыванию баллов список уче-ников, откройте его, для каждого ученика выведите фамилию, предмет, школу, баллы и про-центное соотношение баллов с предыдущим учеником.
DO $$
DECLARE
    cur_student CURSOR FOR
        SELECT surname, subject, school, points
        FROM students
        ORDER BY points DESC;
    v_surname TEXT;
    v_subject TEXT;
    v_school TEXT;
    v_points INT;
    prev_points INT := NULL;
    percent_diff NUMERIC;
BEGIN
    OPEN cur_student;

    LOOP
        FETCH NEXT FROM cur_student INTO v_surname, v_subject, v_school, v_points;
        EXIT WHEN NOT FOUND;

        IF prev_points IS NOT NULL AND prev_points > 0 THEN
            percent_diff := ROUND(((v_points::NUMERIC - prev_points::NUMERIC) / prev_points::NUMERIC) * 100, 2);
            RAISE NOTICE '%', FORMAT('%s, %s, %s, %s — изменение: %s%%', v_surname, v_subject, v_school, v_points, percent_diff);
        ELSE
            RAISE NOTICE '%, %, %, % — первый ученик', v_surname, v_subject, v_school, v_points;
        END IF;

        prev_points := v_points;
    END LOOP;

    CLOSE cur_student;
END $$;









-- Лабораторная работа № 15

-- 1.	Вывести список учеников и разницу между баллами ученика и максимальным баллом в каждой строке.
SELECT 
    surname,
    school,
    points,
    MAX(points) OVER() - points AS diff_from_max
FROM students;
-- 2.	Вывести список учеников и процентное соотношение к среднему баллу в каждой строке.
SELECT 
    surname,
    school,
    points,
    (points * 100.0 / AVG(points) OVER()) AS pct_of_avg
FROM students;
-- 3.	Вывести список учеников и минимальный балл в школе в каждой строке.
SELECT 
    surname,
    school,
    points,
    MIN(points) OVER(PARTITION BY school) AS min_points_in_school
FROM students;
-- 4.	Вывести список учеников и суммарный балл в школе в каждой строке, отсортиро-вать по школам в оконной функции.
SELECT 
    surname,
    school,
    points,
    SUM(points) OVER(PARTITION BY school) AS total_points_in_school
FROM students
ORDER BY school, surname;
-- 5.	Вывести список учеников и номер строки при сортировке по фамилиям в обратном алфавитном порядке.
SELECT 
    surname,
    school,
    points,
    ROW_NUMBER() OVER(ORDER BY surname DESC) AS row_num_desc
FROM students;
-- 6.	Вывести список учеников, номер строки внутри школы и количество учеников в школе при сортировке по баллам по убыванию.
SELECT 
    surname,
    school,
    points,
    ROW_NUMBER() OVER(PARTITION BY school ORDER BY points DESC) AS rank_in_school,
    COUNT(*) OVER(PARTITION BY school) AS total_students_in_school
FROM students;
-- 7.	Вывести список учеников и ранг по баллам.
SELECT 
    surname,
    school,
    points,
    RANK() OVER(ORDER BY points DESC) AS global_rank
FROM students;
-- 8.	Вывести список учеников и сжатый ранг по баллам. Результат отсортировать по фамилии в алфавитном порядке.
SELECT 
    surname,
    school,
    points,
    DENSE_RANK() OVER(ORDER BY points DESC) AS dense_rank
FROM students
ORDER BY surname ASC;
-- 9.	Вывести список учеников, распределенных по пяти группам по фамилии.
SELECT 
    surname,
    school,
    points,
    NTILE(5) OVER(ORDER BY surname) AS group_by_surname
FROM students;
-- 10.	Вывести список учеников, распределенных по трем группам по баллам внутри школы.
SELECT 
    surname,
    school,
    points,
    NTILE(3) OVER(PARTITION BY school ORDER BY points DESC) AS group_by_points_in_school
FROM students;
-- 11.	Вывести список учеников и разницу с баллами ученика, находящегося выше на три позиции при сортировке по возрастанию баллов.
SELECT 
    surname,
    school,
    points,
    points - LAG(points, 3) OVER(ORDER BY points ASC) AS diff_with_3rd_above
FROM students;
-- 12.	Вывести список учеников и разницу с баллами следующего ученика при сорти-ровке по убыванию баллов, значение по умолчанию использовать 0.
SELECT 
    surname,
    school,
    points,
    points - LEAD(points, 1, 0) OVER(ORDER BY points DESC) AS diff_with_next_student
FROM students;






-- Лабораторная работа № 16


-- 1.	Напишите запрос, который выводит максимальный балл учеников по школам, по каждому предмету по каждой школе и промежуточные итоги.
SELECT 
    school,
    subject,
    MAX(points) AS max_points
FROM students
GROUP BY ROLLUP(school, subject)
ORDER BY school, subject;
-- 2.	Напишите запрос, который выводит минимальный балл учеников по школам и по предметам, и промежуточные итоги.
SELECT 
    school,
    subject,
    MIN(points) AS min_points
FROM students
GROUP BY ROLLUP(school, subject)
ORDER BY school, subject;
-- 3.	Напишите запрос, который выводит средний балл учеников по школам и по предметам.
 SELECT 
    school,
    subject,
    AVG(points) AS avg_points
FROM students
GROUP BY school, subject
ORDER BY school, subject;

-- 4.	Напишите запрос, который выводит количество учеников по каждой школе по пред-метам и промежуточные итоги. NULL значения заменить на соответствующий текст.
SELECT 
    COALESCE(school, 'ВСЕ ШКОЛЫ') AS school,
    COALESCE(subject, 'ВСЕ ПРЕДМЕТЫ') AS subject,
    COUNT(*) AS student_count
FROM students
GROUP BY ROLLUP(school, subject)
ORDER BY school, subject;
-- 5.	Напишите запрос, который выводит суммарный балл учеников по школам и по пред-метам, и промежуточные итоги. В итоговых строках NULL значения заменить на соответству-ющий текст в зависимости от группировки.
SELECT 
    COALESCE(school, 'ВСЕ ШКОЛЫ') AS school,
    COALESCE(subject, 'ВСЕ ПРЕДМЕТЫ') AS subject,
    SUM(points) AS total_points
FROM students
GROUP BY ROLLUP(school, subject)
ORDER BY school, subject;
-- 6.	Напишите запрос, который выводит максимальный балл учеников по школам и по предметам. В итоговых строках NULL значения заменить на соответствующий текст в зави-симости от уровней группировки.
SELECT 
    CASE 
        WHEN school IS NULL AND subject IS NULL THEN 'ОБЩИЙ ИТОГ'
        WHEN school IS NULL THEN 'ИТОГ ПО ВСЕМ ШКОЛАМ'
        WHEN subject IS NULL THEN CONCAT('ИТОГ ПО ШКОЛЕ ', school)
        ELSE school 
    END AS school_display,
    CASE 
        WHEN subject IS NULL THEN 'ВСЕ ПРЕДМЕТЫ'
        ELSE subject 
    END AS subject,
    MAX(points) AS max_points
FROM students
GROUP BY ROLLUP(school, subject)
ORDER BY school, subject;
-- 7.	Напишите запрос, который выводит средний балл учеников по школам в столбцы.
CREATE EXTENSION IF NOT EXISTS tablefunc;

SELECT *
FROM crosstab(
    $$
    SELECT 
        subject,
        school,
        AVG(points) AS avg_points
    FROM students
    WHERE points IS NOT NULL  
    GROUP BY subject, school
    ORDER BY subject, school
    $$,
    $$
    SELECT DISTINCT school FROM students WHERE school IS NOT NULL ORDER BY school
    $$
)
AS ct (
    subject text,
    "Гимназия" numeric,
    "Лицей" numeric,
    "Школа 18" numeric
);
-- 8.	Напишите запрос, который выводит средний балл учеников по школам в столбцы и по предметам в строки.
SELECT
    subject,
    AVG(CASE WHEN school = 'Лицей' THEN points END) AS "Лицей",
    AVG(CASE WHEN school = 'Гимназия' THEN points END) AS "Гимназия",
    AVG(CASE WHEN school = 'Школа 18' THEN points END) AS "Школа 18"
FROM students
WHERE points IS NOT NULL 
GROUP BY subject
ORDER BY subject;
-- 9.	Напишите запрос, который выводит названия предметов, фамилии учеников и школы в один столбец.
SELECT
    value AS combined_value
FROM students
CROSS JOIN LATERAL (
    VALUES (subject), (surname), (school)
) AS unpivoted(value);