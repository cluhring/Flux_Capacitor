class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :full_name
      t.string :email
      t.string :provider
      t.string :token
      t.string :uid
      t.string :image_url

      t.timestamps null: false
    end
  end
end
