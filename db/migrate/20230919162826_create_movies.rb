class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :director
      t.string :description
      t.string :url
      t.string :image_url
      t.references :emoji, null: false, foreign_key: true

      t.timestamps
    end
  end
end
