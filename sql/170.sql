-- 各月の登録数と先月比を計算するクエリ
-- 日付型のデータだけを抽出し、
WITH
mst_users_with_years_month AS (
    SELECT
      *
    , substring(rgister_date, 1, 7) AS year_month
    FROM
      users
)
-- LAG関数を使って先月の登録数を計算する
SELECT
  year_month
  , COUNT(DISTINCT user_id) AS register_count
  , LAG(COUNT(DISTINCT user_id)) OVER(ORDER BY year_month) AS last_month_count
  , 1.0 * COUNT(DISTINCT user_id) / LAG(COUNT(DISTINCT user_id))) OVER(ORDER BY year_month) AS month_over_month_ratio
FROM
  mst_users_with_years_month
GROUP BY
  year_month
;
