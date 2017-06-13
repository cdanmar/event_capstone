class CreateVisitors < ActiveRecord::Migration[5.1]
  def change
    create_table :visitors do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :identifier_key

      t.timestamps
    end
  end
end
