-- 各月の登録数と先月比を計算するクエリ
-- 日付型のデータだけを抽出し、
WITH
mst_users_with_years_month AS (
    SELECT
      *
      -- rgister_dateの1番目から7個取得する
    , substring(rgister_date, 1, 7) AS year_month
    FROM
      users
)
-- デバイスごとの登録数を計算する
SELECT
  year_month
  , COUNT(DISTINCT user_id) AS register_count
  , COUNT(DISTINCT case WHEN register_devise == 'pc' THEN user_id END) AS register_pc
  , COUNT(DISTINCT case WHEN register_devise == 'sp' THEN user_id END) AS register_sp
  , COUNT(DISTINCT case WHEN register_devise == 'app' THEN user_id END) AS register_app
FROM
  mst_users_with_years_month
GROUP BY
  year_month
;
