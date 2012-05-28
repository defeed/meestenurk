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
      t.integer :payment_method_id
      t.integer :delivery_method_id
      t.text :comment
      t.string :status

      t.timestamps
    end
  end
end
