class Droptable < ActiveRecord::Migration[6.1]
  def up
    drop_table :connect_catagories
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
