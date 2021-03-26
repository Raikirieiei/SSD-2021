class CreateConnectCatagories < ActiveRecord::Migration[6.1]
  def change
    create_table :connect_catagories do |t|

      t.timestamps
    end
  end
end
