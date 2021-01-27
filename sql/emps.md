# 社員をリストアップする

## 入社日順に

```sql
SELECT E.id, E.name, E.hiredate
FROM emp E
ORDER BY E.hiredate, E.id;
```

```
id           name       hiredate
6003         Henry      1999-09-14
6002         Miller     1999-10-25
6004         Tyler      2000-06-20
6005         Hayes      2001-03-01
6001         Ford       2001-09-12
7001         Wilson     2002-04-01
7002         Hoover     2002-04-01
7003         Kennedy    2002-04-01
7004         Carter     2002-04-01
8001         Smith      2010-04-01
8002         Allen      2010-04-01
8003         Ward       2010-04-01
8004         Jones      2010-04-01
8005         Martin     2010-04-01
9001         Blake      2011-04-01
9002         Clark      2011-04-01
9003         King       2011-04-01
9004         Turner     2011-04-01
9005         James      2011-04-01
```

## 部署名と共に

```sql
SELECT D.id, D.name, E.id, E.name
FROM emp E
  LEFT JOIN dept D
    ON D.id=E.dept_id
ORDER BY D.name, E.name;
```

```
id         name         id         name
30         営業         6003       Henry
30         営業         9003       King
30         営業         8003       Ward
20         研究         8002       Allen
20         研究         9002       Clark
20         研究         7002       Hoover
20         研究         6002       Miller
60         秘書室       7001       Wilson
10         経理         9001       Blake
10         経理         6001       Ford
10         経理         8001       Smith
50         総務         6005       Hayes
50         総務         9005       James
50         総務         8005       Martin
40         製造         7004       Carter
40         製造         8004       Jones
40         製造         7003       Kennedy
40         製造         9004       Turner
40         製造         6004       Tyler
```

## 上司の名前と共に

```sql
SELECT E.name
  , CASE WHEN MANAGER.name IS NULL THEN '' ELSE MANAGER.name END AS manager
  , E.salary
FROM emp E
  LEFT JOIN emp MANAGER
    ON MANAGER.id=E.manager_id
ORDER BY MANAGER.id, E.salary DESC;
```

```
name        manager   salary
Miller                750000
Hayes                 680000
Henry                 650000
Carter                650000
Tyler                 650000
Wilson                600000
Ford                  550000
Blake       Ford      200000
Smith       Ford      650000
Hoover      Miller    500000
Allen       Miller    350000
Clark       Miller    220000
Ward        Henry     300000
King        Henry     190000
Kennedy     Tyler     600000
Jones       Tyler     320000
Turner      Tyler     300000
Martin      Hayes     400000
James       Hayes     350000
```

## 入社年度でまとめる

```sql
SELECT YEAR(E.hiredate) + (CASE WHEN MONTH(E.hiredate) < 4 THEN -1 ELSE 0 END) AS nendo
  , GROUP_CONCAT(E.name ORDER BY E.hiredate SEPARATOR ', ') AS emp_names
FROM emp E
GROUP BY nendo
ORDER BY nendo
```

```
nendo    emp_names
1999     Henry, Miller
2000     Tyler, Hayes
2001     Ford
2002     Wilson, Hoover, Kennedy, Carter
2010     Smith, Allen, Ward, Jones, Martin
2011     James, Turner, King, Clark, Blake
```
