json.array!(@coins_logs) do |coins_log|
  json.extract! coins_log, :id, :name, :amount
  json.url coins_log_url(coins_log, format: :json)
end
