class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  self.store_attribute_unset_values_fallback_to_default = true

  # include OrderQuery

  def self.sample
    random_offset = rand(count)
    offset(random_offset).first
  end

  def self.random
    order(Arel.sql('RANDOM()'))
  end
end
