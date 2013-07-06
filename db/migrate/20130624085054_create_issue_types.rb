class CreateIssueTypes < ActiveRecord::Migration
  def change
    create_table :issue_types do |t|
      t.string :name
      t.string :project_id

      t.timestamps
    end
  end
end
