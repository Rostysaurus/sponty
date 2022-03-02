class RenameColumnType < ActiveRecord::Migration[6.1]
  def change
    rename_column :experiences, :type, :event_type
  end
end
