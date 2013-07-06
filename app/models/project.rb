class Project < ActiveRecord::Base
  attr_accessible :name, :user_id

  has_many :issue_types, dependent: :destroy

  validates :name, presence: true, length: { maximum: 80 }
  validates :user_id, presence: true
end
