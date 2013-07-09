class Project < ActiveRecord::Base
  attr_accessible :name, :user_id

  has_many :issue_types, dependent: :destroy

  has_many :project_user_associations
  has_many :users, through: :project_user_associations

  validates :name, presence: true, length: { maximum: 80 }
  validates :user_id, presence: true
end
