class CreateAnimes < ActiveRecord::Migration[5.2]
  def change
    create_table :animes do |t|
      t.string :name
      t.string :content
      t.string :image
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
