class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.integer :presence_id, null: false
      t.integer :mood_id
      t.integer :body_temperature_id
      t.integer :sleep_id
      t.string :breakfast
      t.text :comment1
      t.integer :reason_id
      t.integer :period_id
      t.text :comment2
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

