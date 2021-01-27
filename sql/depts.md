# 部署をリストアップする

## 単純に

```sql
SELECT D.id, D.name, D.loc
FROM dept D
ORDER BY D.id;
```

```
id         name         loc
10         経理         A01
20         研究         A02
30         営業         B01
40         製造         C01
50         総務         C02
60         秘書室       A03
```

## 見せ方を変える

```sql
SELECT CONCAT(SUBSTR(D.loc, 1, 1), '棟') AS building
  , CONCAT(SUBSTR(D.loc, 2)-0, '階') AS floor
  , D.name
FROM dept D
ORDER BY D.loc;
```

```
building    floor       name
A棟         1階         経理
A棟         2階         研究
A棟         3階         秘書室
B棟         1階         営業
C棟         1階         製造
C棟         2階         総務
```

## 部署の社員も列挙し、社員数の多い部署順に

```sql
SELECT D.id, MAX(D.name) AS name
  , COUNT(E.id) AS num_emps
  , GROUP_CONCAT(E.name ORDER BY E.name SEPARATOR ', ') AS emp_names
FROM dept D
  LEFT JOIN emp E
    ON E.dept_id=D.id
GROUP BY D.id
ORDER BY num_emps DESC, D.name;
```

```
id         name         num_emps    emp_names
40         製造         5           Carter, Jones, Kennedy, Turner, Tyler
20         研究         4           Allen, Clark, Hoover, Miller
30         営業         3           Henry, King, Ward
10         経理         3           Blake, Ford, Smith
50         総務         3           Hayes, James, Martin
60         秘書室       1           Wilson
```
