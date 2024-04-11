class Admin::Form::Modal::Component < Admin::BaseComponent
  renders_one :body

  attr_reader :forced

  def initialize(forced: false)
    super

    @forced = forced
  end
end
