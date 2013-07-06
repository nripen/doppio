class CreateWorkflows < ActiveRecord::Migration
  def change
    create_table :workflows do |t|
      t.string :name
      t.integer :project_id

      t.timestamps
    end
  end
end
