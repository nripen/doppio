class IssueType < ActiveRecord::Base
  attr_accessible :name
  belongs_to :project
  
  validates :project_id, presence: true
end
