class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.integer :genre_id
      t.integer :user_id
      t.text :ingredient
      t.string :name
      t.text :introduction
      t.integer :star
      t.string :time
      t.string :price
      t.text :procedure
      t.text :point
      t.timestamps
    end
  end
end
