SELECT ARRAY(WITH table1 AS
(SELECT *, (fiscal_year - ROW_NUMBER() OVER(ORDER BY company,fiscal_year))%100 AS year_diff FROM dividend),
table2 as
(SELECT *, COUNT(*) OVER(PARTITION BY year_diff,company) AS no_of_row FROM table1)
SELECT DISTINCT company AS valuestocks FROM table2
WHERE no_of_row >= 3);

