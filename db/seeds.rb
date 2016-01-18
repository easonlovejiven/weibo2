# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)




require "csv"

CSV.foreach("/Users/Timy/Documents/test/user_trading_2016-01-11.csv") do |row|
  CoinsLog.create(caishuo_id: row[0].to_i, coins_id: row[1].to_i, name: row[2].strip, amount: row[3].to_i, created_at: row[4], status: row[5].strip)
end