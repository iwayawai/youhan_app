class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.integer :genre_id
      t.integer :member_id
      t.string :ingredient
      t.string :name
      t.text :introduction
      t.integer :star
      t.string :time
      t.string :price
      t.string :procedure
      t.string :point
      t.timestamps
    end
  end
end
