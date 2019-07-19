class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.string :name
      t.integer :sorting, default: 0
      t.integer :project_id

      t.timestamps
    end
  end
end
