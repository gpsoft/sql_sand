# 稼いでるのは誰だ?

## 給与ランキング

```sql
SELECT COUNT(E2.id) AS ranking, E.salary, E.name
FROM emp E, emp E2
WHERE E2.salary >= E.salary
GROUP BY E.id
ORDER BY ranking
```

```
ranking   salary         name
1         750000         Miller
2         680000         Hayes
6         650000         Henry
6         650000         Carter
6         650000         Tyler
6         650000         Smith
8         600000         Kennedy
8         600000         Wilson
9         550000         Ford
10        500000         Hoover
11        400000         Martin
13        350000         Allen
13        350000         James
14        320000         Jones
16        300000         Turner
16        300000         Ward
17        220000         Clark
18        200000         Blake
19        190000         King
```

## 部署ごとの稼ぎ頭

```sql
SELECT D.name, E.salary
  , GROUP_CONCAT(E.name ORDER BY E.name SEPARATOR ', ') AS emp_names
FROM emp E
  LEFT JOIN dept D
    ON D.id=E.dept_id
WHERE NOT EXISTS (
    SELECT 1 FROM emp WHERE
      dept_id=E.dept_id AND id!=E.id AND salary > E.salary
    )
GROUP BY D.id
ORDER BY D.id;
```

```
name         salary         emp_names
経理         650000         Smith
研究         750000         Miller
営業         650000         Henry
製造         650000         Carter, Tyler
総務         680000         Hayes
秘書室       600000         Wilson
```

## 上司よりも稼いでいる人

```sql
SELECT E.name, E.salary
  , CONCAT(MANAGER.name, '(', MANAGER.salary, ')') AS manager
FROM emp E
  LEFT JOIN emp MANAGER
    ON MANAGER.id=E.manager_id
WHERE E.salary > MANAGER.salary
```

```
name         salary         manager
Smith        650000         Ford(550000)
```
