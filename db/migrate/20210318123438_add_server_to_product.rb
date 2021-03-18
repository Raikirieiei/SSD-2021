class AddServerToProduct < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :server, :string
  end
end
