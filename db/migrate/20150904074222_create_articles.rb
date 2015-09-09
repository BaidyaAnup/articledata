class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :address
      t.string :gender
      t.string :city
      t.string :state
      t.string :country
      t.string :interest
      t.references :article, index: true,foreign_key: true



      t.timestamps null: false
    end
  end
end
