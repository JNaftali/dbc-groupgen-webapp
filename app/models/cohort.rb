class Cohort < ApplicationRecord
  belongs_to :user
  has_many :students
  has_many :batches
  has_many :groups, through: :batches

  def history
    self.groups.map do |group|
      group.students
    end
  end
end
