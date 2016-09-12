class Group < ApplicationRecord
  has_many :group_students
  has_many :students, through: :group_students

  def <<(new_student)
    self.students << new_student
  end
end
