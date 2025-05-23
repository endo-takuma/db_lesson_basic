Q1


MariaDB [db_lesson]> create table departments (
    -> department_id INT unsigned auto_increment not null primary key,
    -> name varchar(20) not null,
    -> created_at timestamp default current_timestamp,
    -> updated_at timestamp default current_timestamp on update current_timestamp
    -> );
Query OK, 0 rows affected (0.022 sec)

MariaDB [db_lesson]> show tables
    -> ;
+---------------------+
| Tables_in_db_lesson |
+---------------------+
| departments         |
| people              |
| reports             |
+---------------------+
3 rows in set (0.002 sec)

MariaDB [db_lesson]> desc departments
    -> ;
+---------------+------------------+------+-----+---------------------+-------------------------------+
| Field         | Type             | Null | Key | Default             | Extra                         |
+---------------+------------------+------+-----+---------------------+-------------------------------+
| department_id | int(10) unsigned | NO   | PRI | NULL                | auto_increment                |
| name          | varchar(20)      | NO   |     | NULL                |                               |
| created_at    | timestamp        | NO   |     | current_timestamp() |                               |
| updated_at    | timestamp        | NO   |     | current_timestamp() | on update current_timestamp() |
+---------------+------------------+------+-----+---------------------+-------------------------------+
4 rows in set (0.038 sec)



Q2

MariaDB [db_lesson]> alter table people add department_id int unsigned after email;
Query OK, 0 rows affected (0.018 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [db_lesson]> desc people
    -> ;
+---------------+---------------------+------+-----+---------------------+-------------------------------+
| Field         | Type                | Null | Key | Default             | Extra                         |
+---------------+---------------------+------+-----+---------------------+-------------------------------+
| person_id     | int(10) unsigned    | NO   | PRI | NULL                | auto_increment                |
| name          | varchar(20)         | NO   |     | NULL                |                               |
| email         | varchar(255)        | YES  | UNI | NULL                |                               |
| department_id | int(10) unsigned    | YES  |     | NULL                |                               |
| age           | tinyint(3) unsigned | YES  |     | NULL                |                               |
| gender        | tinyint(4)          | YES  |     | NULL                |                               |
| created_at    | timestamp           | NO   |     | current_timestamp() |                               |
| updated_at    | timestamp           | NO   |     | current_timestamp() | on update current_timestamp() |
+---------------+---------------------+------+-----+---------------------+-------------------------------+
8 rows in set (0.030 sec)


Q3


MariaDB [db_lesson]> insert into departments (name)
    -> values
    -> ('営業'),
    -> ('開発'),
    -> ('経理'),
    -> ('人事'),
    -> ('情報システム');
Query OK, 5 rows affected (0.011 sec)
Records: 5  Duplicates: 0  Warnings: 0

MariaDB [db_lesson]> select * from departments;
+---------------+--------------+---------------------+---------------------+
| department_id | name         | created_at          | updated_at          |
+---------------+--------------+---------------------+---------------------+
|             1 | 営業         | 2025-05-16 16:19:50 | 2025-05-16 16:19:50 |
|             2 | 開発         | 2025-05-16 16:19:50 | 2025-05-16 16:19:50 |
|             3 | 経理         | 2025-05-16 16:19:50 | 2025-05-16 16:19:50 |
|             4 | 人事         | 2025-05-16 16:19:50 | 2025-05-16 16:19:50 |
|             5 | 情報システム | 2025-05-16 16:19:50 | 2025-05-16 16:19:50 |
+---------------+--------------+---------------------+---------------------+
5 rows in set (0.001 sec)

MariaDB [db_lesson]> insert into people (name,email,department_id,age,gender)
    -> values
    -> ('永木ようすけ','eigi@beyond-works.co.jp',1,28,1),
    -> ('海馬つよし','kaiba@beyond-works.co.jp',2,29,1),
    -> ('甲斐はつめ','kai@beyond-works.co.jp',2,26,2),
    -> ('慶伊りつこ','kei@beyond-works.co.jp',3,30,2),
    -> ('落合しんじ','otiai@beyond-works.co.jp',4,30,1),
    -> ('北条こうき','houzyou@beyond-works.co.jp',5,35,1),
    -> ('高木きょうすけ','takagi@beyond-works.co.jp',1,25,1),
    -> ('大川まゆみ','okawa@beyond-works.co.jp',1,22,2),
    -> ('飯田かいと','iida@beyond-works.co.jp',2,22,1),
    -> ('柿沼かおる','kakinuma@beyond-works.co.jp',2,27,2);
Query OK, 10 rows affected (0.011 sec)
Records: 10  Duplicates: 0  Warnings: 0

MariaDB [db_lesson]> select * from people;
+-----------+----------------+------------------------------+---------------+------+--------+---------------------+---------------------+
| person_id | name           | email                        | department_id | age  | gender | created_at          | updated_at          |
+-----------+----------------+------------------------------+---------------+------+--------+---------------------+---------------------+
|         1 | 鈴木たかし     | suzuki@beyond-works.co.jp    |          NULL |   20 |      1 | 2025-04-17 15:25:41 | 2025-04-17 15:25:41 |
|         2 | 田中ゆうこ     | tanaka@beyond-works.co.jp    |          NULL |   25 |      2 | 2025-04-17 15:29:32 | 2025-04-17 15:29:32 |
|         3 | 福田だいすけ   | fukuda@beyond-works.co.jp    |          NULL |   42 |      1 | 2025-04-17 15:29:32 | 2025-04-17 15:29:32 |
|         4 | 豊島はなこ     | toyoshima@beyond-works.co.jp |          NULL |   34 |      2 | 2025-04-17 15:29:32 | 2025-04-17 15:29:32 |
|         6 | 不思議沢みちこ | NULL                         |          NULL | NULL |   NULL | 2025-04-17 15:29:32 | 2025-04-17 15:29:32 |
|         7 | 永木ようすけ   | eigi@beyond-works.co.jp      |             1 |   28 |      1 | 2025-05-16 16:56:27 | 2025-05-16 16:56:27 |
|         8 | 海馬つよし     | kaiba@beyond-works.co.jp     |             2 |   29 |      1 | 2025-05-16 16:56:27 | 2025-05-16 16:56:27 |
|         9 | 甲斐はつめ     | kai@beyond-works.co.jp       |             2 |   26 |      2 | 2025-05-16 16:56:27 | 2025-05-16 16:56:27 |
|        10 | 慶伊りつこ     | kei@beyond-works.co.jp       |             3 |   30 |      2 | 2025-05-16 16:56:27 | 2025-05-16 16:56:27 |
|        11 | 落合しんじ     | otiai@beyond-works.co.jp     |             4 |   30 |      1 | 2025-05-16 16:56:27 | 2025-05-16 16:56:27 |
|        12 | 北条こうき     | houzyou@beyond-works.co.jp   |             5 |   35 |      1 | 2025-05-16 16:56:27 | 2025-05-16 16:56:27 |
|        13 | 高木きょうすけ | takagi@beyond-works.co.jp    |             1 |   25 |      1 | 2025-05-16 16:56:27 | 2025-05-16 16:56:27 |
|        14 | 大川まゆみ     | okawa@beyond-works.co.jp     |             1 |   22 |      2 | 2025-05-16 16:56:27 | 2025-05-16 16:56:27 |
|        15 | 飯田かいと     | iida@beyond-works.co.jp      |             2 |   22 |      1 | 2025-05-16 16:56:27 | 2025-05-16 16:56:27 |
|        16 | 柿沼かおる     | kakinuma@beyond-works.co.jp  |             2 |   27 |      2 | 2025-05-16 16:56:27 | 2025-05-16 16:56:27 |
+-----------+----------------+------------------------------+---------------+------+--------+---------------------+---------------------+
15 rows in set (0.001 sec)

MariaDB [db_lesson]> insert into reports (person_id,content)
    -> values
    -> (1,'日次報告書20250417'),
    -> (1,'日次報告書20250418'),
    -> (3,'日次報告書20250419'),
    -> (1,'日次報告書20250420'),
    -> (8,'日次報告書20250421'),
    -> (8,'日次報告書20250422'),
    -> (9,'日次報告書20250423'),
    -> (1,'日次報告書20250424'),
    -> (9,'日次報告書20250425'),
    -> (8,'日次報告書20250426'),
    -> (16,'日次報告書20250427');
Query OK, 12 rows affected (0.009 sec)
Records: 12  Duplicates: 0  Warnings: 0

MariaDB [db_lesson]> select * from reports;
+-----------+-----------+--------------------+---------------------+---------------------+
| report_id | person_id | content            | created_at          | updated_at          |
+-----------+-----------+--------------------+---------------------+---------------------+
|         1 |         1 | 日次報告書20250407 | 2025-04-17 17:37:33 | 2025-04-17 17:45:42 |
|         2 |         1 | 日次報告書20250408 | 2025-04-17 17:50:14 | 2025-04-17 17:50:14 |
|         3 |         1 | 日次報告書20250409 | 2025-04-17 17:50:14 | 2025-04-17 17:50:14 |
|         4 |         3 | 日次報告書20250410 | 2025-04-17 17:50:14 | 2025-04-17 17:50:14 |
|         5 |         4 | 日次報告書20250411 | 2025-04-17 17:50:14 | 2025-04-17 17:50:14 |
|         6 |         4 | 日次報告書20250412 | 2025-04-17 17:50:14 | 2025-04-17 17:50:14 |
|         7 |         4 | 日次報告書20250413 | 2025-04-17 17:50:14 | 2025-04-17 17:50:14 |
|         8 |         2 | 日次報告書20250414 | 2025-04-17 17:50:14 | 2025-04-17 17:50:14 |
|         9 |         1 | 日次報告書20250415 | 2025-04-17 17:50:14 | 2025-04-17 17:50:14 |
|        10 |         5 | 日次報告書20250416 | 2025-04-17 17:50:14 | 2025-04-17 18:21:03 |
|        12 |         1 | 日次報告書20250417 | 2025-05-16 17:07:34 | 2025-05-16 17:07:34 |
|        13 |         1 | 日次報告書20250418 | 2025-05-16 17:07:34 | 2025-05-16 17:07:34 |
|        14 |         3 | 日次報告書20250419 | 2025-05-16 17:07:34 | 2025-05-16 17:07:34 |
|        15 |         1 | 日次報告書20250420 | 2025-05-16 17:07:34 | 2025-05-16 17:07:34 |
|        16 |         1 | 日次報告書20250420 | 2025-05-16 17:07:34 | 2025-05-16 17:07:34 |
|        17 |         8 | 日次報告書20250421 | 2025-05-16 17:07:34 | 2025-05-16 17:07:34 |
|        18 |         8 | 日次報告書20250422 | 2025-05-16 17:07:34 | 2025-05-16 17:07:34 |
|        19 |         9 | 日次報告書20250423 | 2025-05-16 17:07:34 | 2025-05-16 17:07:34 |
|        20 |         1 | 日次報告書20250424 | 2025-05-16 17:07:34 | 2025-05-16 17:07:34 |
|        21 |         9 | 日次報告書20250425 | 2025-05-16 17:07:34 | 2025-05-16 17:07:34 |
|        22 |         8 | 日次報告書20250426 | 2025-05-16 17:07:34 | 2025-05-16 17:07:34 |
|        23 |        16 | 日次報告書20250427 | 2025-05-16 17:07:34 | 2025-05-16 17:07:34 |
+-----------+-----------+--------------------+---------------------+---------------------+
22 rows in set (0.001 sec)



Q4


MariaDB [db_lesson]> UPDATE people SET department_id = 2 WHERE person_id = 1;
Query OK, 1 row affected (0.012 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [db_lesson]> select * from people;
+-----------+----------------+------------------------------+---------------+------+--------+---------------------+---------------------+
| person_id | name           | email                        | department_id | age  | gender | created_at          | updated_at          |
+-----------+----------------+------------------------------+---------------+------+--------+---------------------+---------------------+
|         1 | 鈴木たかし     | suzuki@beyond-works.co.jp    |             2 |   20 |      1 | 2025-04-17 15:25:41 | 2025-05-16 17:22:55 |
|         2 | 田中ゆうこ     | tanaka@beyond-works.co.jp    |          NULL |   25 |      2 | 2025-04-17 15:29:32 | 2025-04-17 15:29:32 |
|         3 | 福田だいすけ   | fukuda@beyond-works.co.jp    |          NULL |   42 |      1 | 2025-04-17 15:29:32 | 2025-04-17 15:29:32 |
|         4 | 豊島はなこ     | toyoshima@beyond-works.co.jp |          NULL |   34 |      2 | 2025-04-17 15:29:32 | 2025-04-17 15:29:32 |
|         6 | 不思議沢みちこ | NULL                         |          NULL | NULL |   NULL | 2025-04-17 15:29:32 | 2025-04-17 15:29:32 |
|         7 | 永木ようすけ   | eigi@beyond-works.co.jp      |             1 |   28 |      1 | 2025-05-16 16:56:27 | 2025-05-16 16:56:27 |
|         8 | 海馬つよし     | kaiba@beyond-works.co.jp     |             2 |   29 |      1 | 2025-05-16 16:56:27 | 2025-05-16 16:56:27 |
|         9 | 甲斐はつめ     | kai@beyond-works.co.jp       |             2 |   26 |      2 | 2025-05-16 16:56:27 | 2025-05-16 16:56:27 |
|        10 | 慶伊りつこ     | kei@beyond-works.co.jp       |             3 |   30 |      2 | 2025-05-16 16:56:27 | 2025-05-16 16:56:27 |
|        11 | 落合しんじ     | otiai@beyond-works.co.jp     |             4 |   30 |      1 | 2025-05-16 16:56:27 | 2025-05-16 16:56:27 |
|        12 | 北条こうき     | houzyou@beyond-works.co.jp   |             5 |   35 |      1 | 2025-05-16 16:56:27 | 2025-05-16 16:56:27 |
|        13 | 高木きょうすけ | takagi@beyond-works.co.jp    |             1 |   25 |      1 | 2025-05-16 16:56:27 | 2025-05-16 16:56:27 |
|        14 | 大川まゆみ     | okawa@beyond-works.co.jp     |             1 |   22 |      2 | 2025-05-16 16:56:27 | 2025-05-16 16:56:27 |
|        15 | 飯田かいと     | iida@beyond-works.co.jp      |             2 |   22 |      1 | 2025-05-16 16:56:27 | 2025-05-16 16:56:27 |
|        16 | 柿沼かおる     | kakinuma@beyond-works.co.jp  |             2 |   27 |      2 | 2025-05-16 16:56:27 | 2025-05-16 16:56:27 |
+-----------+----------------+------------------------------+---------------+------+--------+---------------------+---------------------+
15 rows in set (0.001 sec)

MariaDB [db_lesson]> UPDATE people SET department_id = 1 WHERE person_id = 2;
Query OK, 1 row affected (0.009 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [db_lesson]> UPDATE people SET department_id = 3 WHERE person_id = 3;
Query OK, 1 row affected (0.010 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [db_lesson]> UPDATE people SET department_id = 4 WHERE person_id = 4;
Query OK, 1 row affected (0.010 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [db_lesson]> UPDATE people SET department_id = 5 WHERE person_id = 6;
Query OK, 1 row affected (0.012 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [db_lesson]> select * from people;
+-----------+----------------+------------------------------+---------------+------+--------+---------------------+---------------------+
| person_id | name           | email                        | department_id | age  | gender | created_at          | updated_at          |
+-----------+----------------+------------------------------+---------------+------+--------+---------------------+---------------------+
|         1 | 鈴木たかし     | suzuki@beyond-works.co.jp    |             2 |   20 |      1 | 2025-04-17 15:25:41 | 2025-05-16 17:22:55 |
|         2 | 田中ゆうこ     | tanaka@beyond-works.co.jp    |             1 |   25 |      2 | 2025-04-17 15:29:32 | 2025-05-16 17:23:32 |
|         3 | 福田だいすけ   | fukuda@beyond-works.co.jp    |             3 |   42 |      1 | 2025-04-17 15:29:32 | 2025-05-16 17:24:31 |
|         4 | 豊島はなこ     | toyoshima@beyond-works.co.jp |             4 |   34 |      2 | 2025-04-17 15:29:32 | 2025-05-16 17:26:17 |
|         6 | 不思議沢みちこ | NULL                         |             5 | NULL |   NULL | 2025-04-17 15:29:32 | 2025-05-16 17:26:35 |
|         7 | 永木ようすけ   | eigi@beyond-works.co.jp      |             1 |   28 |      1 | 2025-05-16 16:56:27 | 2025-05-16 16:56:27 |
|         8 | 海馬つよし     | kaiba@beyond-works.co.jp     |             2 |   29 |      1 | 2025-05-16 16:56:27 | 2025-05-16 16:56:27 |
|         9 | 甲斐はつめ     | kai@beyond-works.co.jp       |             2 |   26 |      2 | 2025-05-16 16:56:27 | 2025-05-16 16:56:27 |
|        10 | 慶伊りつこ     | kei@beyond-works.co.jp       |             3 |   30 |      2 | 2025-05-16 16:56:27 | 2025-05-16 16:56:27 |
|        11 | 落合しんじ     | otiai@beyond-works.co.jp     |             4 |   30 |      1 | 2025-05-16 16:56:27 | 2025-05-16 16:56:27 |
|        12 | 北条こうき     | houzyou@beyond-works.co.jp   |             5 |   35 |      1 | 2025-05-16 16:56:27 | 2025-05-16 16:56:27 |
|        13 | 高木きょうすけ | takagi@beyond-works.co.jp    |             1 |   25 |      1 | 2025-05-16 16:56:27 | 2025-05-16 16:56:27 |
|        14 | 大川まゆみ     | okawa@beyond-works.co.jp     |             1 |   22 |      2 | 2025-05-16 16:56:27 | 2025-05-16 16:56:27 |
|        15 | 飯田かいと     | iida@beyond-works.co.jp      |             2 |   22 |      1 | 2025-05-16 16:56:27 | 2025-05-16 16:56:27 |
|        16 | 柿沼かおる     | kakinuma@beyond-works.co.jp  |             2 |   27 |      2 | 2025-05-16 16:56:27 | 2025-05-16 16:56:27 |
+-----------+----------------+------------------------------+---------------+------+--------+---------------------+---------------------+
15 rows in set (0.001 sec)



Q5


MariaDB [db_lesson]> select name,age from people where gender=1 order by age desc;
+----------------+------+
| name           | age  |
+----------------+------+
| 福田だいすけ   |   42 |
| 北条こうき     |   35 |
| 落合しんじ     |   30 |
| 海馬つよし     |   29 |
| 永木ようすけ   |   28 |
| 高木きょうすけ |   25 |
| 飯田かいと     |   22 |
| 鈴木たかし     |   20 |
+----------------+------+
8 rows in set (0.001 sec)



Q6


`people` のテーブルから、営業部に所属している人の情報【名前/メールアドレス/年齢】をテーブルへの追加順(作成順)に並べ替えて表示してください。



Q7


MariaDB [db_lesson]> SELECT gender , name , age FROM people
    -> WHERE gender=1 AND 40<=age AND age<=49
    -> OR gender=2 AND 20<=age AND age<=29
    -> ORDER BY gender ASC , age ASC;
+--------+--------------+------+
| gender | name         | age  |
+--------+--------------+------+
|      1 | 福田だいすけ |   42 |
|      2 | 大川まゆみ   |   22 |
|      2 | 田中ゆうこ   |   25 |
|      2 | 甲斐はつめ   |   26 |
|      2 | 柿沼かおる   |   27 |
+--------+--------------+------+
5 rows in set (0.001 sec)


Q8


MariaDB [db_lesson]> select * from people where department_id = 1 order by age asc;
+-----------+----------------+---------------------------+---------------+------+--------+---------------------+---------------------+
| person_id | name           | email                     | department_id | age  | gender | created_at          | updated_at          |
+-----------+----------------+---------------------------+---------------+------+--------+---------------------+---------------------+
|        14 | 大川まゆみ     | okawa@beyond-works.co.jp  |             1 |   22 |      2 | 2025-05-16 16:56:27 | 2025-05-16 16:56:27 |
|         2 | 田中ゆうこ     | tanaka@beyond-works.co.jp |             1 |   25 |      2 | 2025-04-17 15:29:32 | 2025-05-16 17:23:32 |
|        13 | 高木きょうすけ | takagi@beyond-works.co.jp |             1 |   25 |      1 | 2025-05-16 16:56:27 | 2025-05-16 16:56:27 |
|         7 | 永木ようすけ   | eigi@beyond-works.co.jp   |             1 |   28 |      1 | 2025-05-16 16:56:27 | 2025-05-16 16:56:27 |
+-----------+----------------+---------------------------+---------------+------+--------+---------------------+---------------------+
4 rows in set (0.002 sec)



Q9


MariaDB [db_lesson]> SELECT department_id, AVG(age) AS average_age
    -> FROM people
    -> WHERE gender = 2 && department_id = 2
    -> GROUP BY department_id;
+---------------+-------------+
| department_id | average_age |
+---------------+-------------+
|             2 |     26.5000 |
+---------------+-------------+
1 row in set (0.001 sec)

department_idが2であるところが、開発部に所属する女性の平均年齢になります。



Q10


MariaDB [db_lesson]> select people.name,people.department_id,reports.content
    -> from people inner join reports on people.person_id = reports.person_id;
+--------------+---------------+--------------------+
| name         | department_id | content            |
+--------------+---------------+--------------------+
| 鈴木たかし   |             2 | 日次報告書20250407 |
| 鈴木たかし   |             2 | 日次報告書20250408 |
| 鈴木たかし   |             2 | 日次報告書20250409 |
| 福田だいすけ |             3 | 日次報告書20250410 |
| 豊島はなこ   |             4 | 日次報告書20250411 |
| 豊島はなこ   |             4 | 日次報告書20250412 |
| 豊島はなこ   |             4 | 日次報告書20250413 |
| 田中ゆうこ   |             1 | 日次報告書20250414 |
| 鈴木たかし   |             2 | 日次報告書20250415 |
| 鈴木たかし   |             2 | 日次報告書20250417 |
| 鈴木たかし   |             2 | 日次報告書20250418 |
| 福田だいすけ |             3 | 日次報告書20250419 |
| 鈴木たかし   |             2 | 日次報告書20250420 |
| 鈴木たかし   |             2 | 日次報告書20250420 |
| 海馬つよし   |             2 | 日次報告書20250421 |
| 海馬つよし   |             2 | 日次報告書20250422 |
| 甲斐はつめ   |             2 | 日次報告書20250423 |
| 鈴木たかし   |             2 | 日次報告書20250424 |
| 甲斐はつめ   |             2 | 日次報告書20250425 |
| 海馬つよし   |             2 | 日次報告書20250426 |
| 柿沼かおる   |             2 | 日次報告書20250427 |
+--------------+---------------+--------------------+
21 rows in set (0.001 sec)



Q11


SELECT p.person_id, p.name, r.content FROM people p LEFT OUTER JOIN reports r USING (person_id) where content is null;
+-----------+----------------+---------+
| person_id | name           | content |
+-----------+----------------+---------+
|         6 | 不思議沢みちこ | NULL    |
|         7 | 永木ようすけ   | NULL    |
|        10 | 慶伊りつこ     | NULL    |
|        11 | 落合しんじ     | NULL    |
|        12 | 北条こうき     | NULL    |
|        13 | 高木きょうすけ | NULL    |
|        14 | 大川まゆみ     | NULL    |
|        15 | 飯田かいと     | NULL    |
+-----------+----------------+---------+
8 rows in set (0.008 sec)