class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :name, :null => false, :limit => 160
      t.string :year, :limit => 45 
      t.text :description
      t.string :image_url, :limit => 150
      t.boolean :is_showing, :null => false,

      t.timestamps
    end
  end
end
