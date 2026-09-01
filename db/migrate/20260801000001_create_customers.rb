class CreateCustomers < ActiveRecord::Migration[7.1]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.text :address
      t.string :company
      t.text :notes

      t.timestamps
    end
    add_index :customers, :email, unique: true
  end
end
