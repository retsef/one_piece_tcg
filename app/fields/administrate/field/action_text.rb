class Administrate::Field::ActionText < Administrate::Field::Text
  def to_s # rubocop:disable Rails/Delegate
    data.to_s
  end

  def self.searchable?
    false
  end

  def associated_class_name
    'ActionText::RichText'
  end

  def self.associative?
    true
  end

  def self.eager_load?
    true
  end
end
