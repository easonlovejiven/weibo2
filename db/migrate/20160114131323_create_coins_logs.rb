class CreateCoinsLogs < ActiveRecord::Migration
  def change
    create_table :coins_logs do |t|
      t.integer :caishuo_id
      t.integer :coins_id
      t.string :name
      t.float :amount
      t.string :status
      t.string :product

      t.timestamps
    end
  end
end
