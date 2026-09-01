class CreateInformation < ActiveRecord::Migration[7.1]
  def change
    create_table :information do |t|
      t.string :title
      t.text :content
      t.string :category
      t.string :author
      t.string :status

      t.timestamps
    end
    add_index :information, :status
  end
end
