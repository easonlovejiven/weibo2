json.array!(@user_logs) do |user_log|
  json.extract! user_log, :id, :caishuo_id, :coins_id, :name, :amount, :created_at, :status
  json.url user_log_url(user_log, format: :json)
end
