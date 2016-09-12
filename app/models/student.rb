class Student < ApplicationRecord
  belongs_to :cohort
  has_many :group_students
  has_many :groups, through: :group_students

  validates :name, presence: true, uniqueness: {scope: :cohort}
end
