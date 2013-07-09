class CreateProjectUserAssociations < ActiveRecord::Migration
  def change
    create_table :project_user_associations do |t|
      t.integer :project_id
      t.integer :user_id

      t.timestamps
    end
    add_index :project_user_associations, :project_id
    add_index :project_user_associations, :user_id
    add_index :project_user_associations, [:project_id, :user_id], unique: true
  end
end
