class CreateTodos < ActiveRecord::Migration[5.0]
  def change
    create_table :todos do |t|
      t.integer :user_id
      t.integer :data_id
      t.text :titleStr
      t.text :todoText
      t.integer :IsNotify
      t.integer :IsMemo
      t.text :todoTimeStr
      t.text :lookUpTimeStr
      t.text :notificationTimeStr

      t.timestamps
    end
  end
end
