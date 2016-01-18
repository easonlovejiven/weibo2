class CreateUserLogs < ActiveRecord::Migration
  def change
    create_table :user_logs do |t|
      t.integer :caishuo_id
      t.integer :coins_id
      t.string :name, limit: 50
      t.decimal :amount, precision: 16, scale: 3, default: 0
      t.string :status
    end
  end
end
