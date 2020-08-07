class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :destination_first_name, null: false
      t.string :destination_family_name, null: false
      t.string :destination_first_name_kana, null: false
      t.string :destination_family_name_kana, null: false
      t.integer :post_code, null: false
      t.integer :prefecture_code, null: false
      t.string :city, null:false
      t.integer :house_number, null: false
      t.string :building_name
      t.integer :phone_number, unique: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
