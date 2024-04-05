module Codeable
  extend ActiveSupport::Concern

  included do
    serialize :code, coder: Code

    validates :code, presence: true, uniqueness: true

    delegate :prefix, :prefix=, :number, :number=, to: :code, prefix: true
  end

  class Code
    def self.dump(code)
      code.to_s
    end

    def self.load(data)
      new(*data.to_s.split('-'))
    end

    attr_accessor :prefix, :number

    def initialize(prefix = 'N00', number = '000')
      @prefix = prefix
      @number = number
    end

    def to_s
      "#{prefix}-#{number}"
    end

    def ==(other)
      case other
      when Code then prefix == other.prefix && number == other.number
      when String then to_s == other
      else false
      end
    end

    def inspect
      to_s
    end
  end
end
