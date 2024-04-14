module Arena
  class HandCard::Component < BaseComponent
    attr_accessor :label, :rotation, :offset

    def initialize(label: '', rotation: 0, offset: 0)
      @label = label

      @rotation = rotation
      @offset = offset
    end
  end
end
