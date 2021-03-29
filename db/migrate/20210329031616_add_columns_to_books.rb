class AddColumnsToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :reason_id, :integer
    add_column :books, :period_id, :integer
  end
end
