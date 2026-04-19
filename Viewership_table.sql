---Getting all the data from the viewership_table
select * from `workspace`.`default`.`viewership_table` limit 100

---Total viewing per channel
SELECT Channel2,
       SUM(DATEDIFF(SECOND, '00:00:00', `Duration 2`)) / 60.0 AS total_minutes
FROM viewership_table
GROUP BY Channel2
ORDER BY total_minutes DESC

---Coverting to South African Time
SELECT *,
  DATEADD(HOUR, 2, RecordDate2) AS SA_Time
FROM viewership_table

---Getting Total Sessions
SELECT COUNT(*) AS total_sessions
FROM viewership_table

---Information about most watched channels
SELECT Channel2,
       COUNT(*) AS total_views
FROM viewership_table
GROUP BY Channel2
ORDER BY total_views DESC

---Getting the Total Number of unique users
SELECT COUNT(DISTINCT UserID0) AS total_users
FROM viewership_table

---Getting Peak Hours Viewing
SELECT DATEPART('HOUR', DATEADD(HOUR, 2, RecordDate2)) AS hour,
       COUNT(*) AS total_views
FROM viewership_table
GROUP BY DATEPART('HOUR', DATEADD(HOUR, 2, RecordDate2))
ORDER BY total_views DESC
