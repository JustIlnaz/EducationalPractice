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

