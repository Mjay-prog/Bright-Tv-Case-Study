---see what data is inside the table and check the actual column names
SELECT *
FROM user_profiles_table
LIMIT 1000;

---how many user records exist in the table in total
SELECT COUNT(*) AS total_users
FROM user_profiles_table;

---how many unique users the table actually has
SELECT COUNT(DISTINCT UserID) AS unique_users
FROM user_profiles_table;

---Check for duplicate user records
SELECT UserID,
       COUNT(*) AS occurrences
FROM user_profiles_table
GROUP BY UserID
HAVING COUNT(*) > 1;

---Create a clean user table without duplicates
SELECT DISTINCT *
FROM user_profiles_table;

---Preview only the user ID column
SELECT UserID
FROM user_profiles_table
LIMIT 100;
