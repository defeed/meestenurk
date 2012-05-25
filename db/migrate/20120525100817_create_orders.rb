class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :email
      t.string :address
      t.string :city
      t.string :zip
      t.string :payment_method
      t.string :shipping_method
      t.text :comment
      t.string :status
      t.integer :cart_id

      t.timestamps
    end
  end
end
