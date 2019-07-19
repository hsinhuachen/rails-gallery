class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.text :title
      t.text :desc
      t.text :thumb
      t.boolean :feature
      t.boolean :published
      t.integer :sorting, default: 0

      t.timestamps
    end
  end
end
