class Batch < ApplicationRecord
  has_many :groups
  belongs_to :cohort
  has_many :students, through: :cohort
  delegate :history, to: :cohort
  attr_reader :size

  validates :size, presence: true, if: :new_record?
  after_create :populate_groups

  def size=(a)
    @size = a.to_i
  end

  protected
  def students
    self.cohort.students.order(name: :asc)
  end

  def populate_groups
    groups = get_groups(students)
    groups.each do |group|
      self.groups.create(students: group)
    end
  end

  def get_groups(people)
    return [people] if self.size > people.length
    groups_enum(people).each do |group|
      new_people = people - group
      other_groups = get_groups(new_people)
      next unless other_groups
      return [groups] + other_groups
    end
    false
  end

  def sort_rank(*group)
    return 0 if group.length == 0
    return self.history.count {|past_group| past_group.include?(group[0])} if group.length == 1

    group.sort.combination(2).reduce(0) { |sum, pair| sum + self.history.count {|past_group| past_group & pair == pair} }
  end

  def groups_enum(people)
    Enumerator.new do |y|
      history = self.history.map(&:dup)

      until people.empty?
        next_group = []
        until next_group.length == self.size || people.empty?
          people = people.sort {|a,b| self.sort_rank(*next_group, a) <=> self.sort_rank(*next_group, b)}
          next_group << people.find {|person| !next_group.include?(person)}
        end
        history << next_group
        y << next_group
      end
    end
  end
end
