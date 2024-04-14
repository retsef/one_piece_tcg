class Administrate::Field::Hidden < Administrate::Field::Base
  def to_s
    data
  end

  def self.searchable?
    false
  end

  def hidden?
    true
  end
end
