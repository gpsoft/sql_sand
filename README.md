# Sql sand

## 概要

SQLの実験プロジェクト。MySQL5.7を使用する。

## 準備

- `scott`という名前のデータベースを作って
- `import.sql`を実行

## 部署テーブル dept

```sql
CREATE TABLE `dept` (
  `id` int(11) NOT NULL,
  `name` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `loc` varchar(3) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin
```

## 社員テーブル emp

```sql
CREATE TABLE `emp` (
  `id` int(11) NOT NULL,
  `name` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `hiredate` date NOT NULL,
  `salary` int(11) NOT NULL,
  `dept_id` int(11) NOT NULL,
  `manager_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin
```

## メニュー

- [社員をリストアップする](sql/emps.md)
