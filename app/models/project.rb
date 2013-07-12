class Project < ActiveRecord::Base
  attr_accessible :name, :project_lead

  has_many :issue_types, dependent: :destroy

  has_many :project_user_associations
  has_many :users, through: :project_user_associations, dependent: :destroy;

  validates :name, presence: true, length: { maximum: 80 }
  validates :project_lead, presence: true
end
