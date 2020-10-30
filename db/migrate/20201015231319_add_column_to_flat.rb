class AddColumnToFlat < ActiveRecord::Migration[6.0]
  def change
    add_column :flats, :picture, :text
  end
end
