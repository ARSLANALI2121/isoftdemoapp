class CreatePictures < ActiveRecord::Migration[6.1]
  def change
    create_table :pictures do |t|
      t.string :imageable_type
      t.integer :imageable_id
      t.string :name

      t.timestamps
    end
  end
end
