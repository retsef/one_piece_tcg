module Card::Codeable
  extend ActiveSupport::Concern

  SERIES = {
    ST01: { id: '569001', name: "STARTER DECK -Straw Hat Crew- [ST-01]" },
    ST02: { id: '569002', name: "STARTER DECK -Worst Generation- [ST-02]" },
    ST03: { id: '569003', name: "STARTER DECK -The Seven Warlords of the Sea- [ST-03]" },
    ST04: { id: '569004', name: "STARTER DECK -Animal Kingdom Pirates- [ST-04]" },
    ST05: { id: '569005', name: "STARTER DECK -ONE PIECE FILM edition- [ST-05]" },
    ST06: { id: '569006', name: "STARTER DECK -Absolute Justice- [ST-06]" },
    ST07: { id: '569007', name: "STARTER DECK -Big Mom Pirates- [ST-07]" },
    ST08: { id: '569008', name: "STARTER DECK -Monkey D. Luffy- [ST-08]" },
    ST09: { id: '569009', name: "STARTER DECK -Yamato- [ST-09]" },
    ST10: { id: '569010', name: "ULTRA DECK -The Three Captains- [ST-10]" },
    ST11: { id: '569011', name: "STARTER DECK -Uta- [ST-11]" },
    ST12: { id: '569012', name: "STARTER DECK -Zoro and Sanji- [ST-12]" },
    ST13: { id: '569013', name: "ULTRA DECK -The Three Brothers- [ST-13]" },
    OP01: { id: '569101', name: "BOOSTER PACK -ROMANCE DAWN- [OP-01]" },
    OP02: { id: '569102', name: "BOOSTER PACK -PARAMOUNT WAR- [OP-02]" },
    OP03: { id: '569103', name: "BOOSTER PACK -PILLARS OF STRENGTH- [OP-03]" },
    OP04: { id: '569104', name: "BOOSTER PACK -KINGDOMS OF INTRIGUE- [OP-04]" },
    OP05: { id: '569105', name: "BOOSTER PACK -AWAKENING OF THE NEW ERA- [OP-05]" },
    OP06: { id: '569106', name: "BOOSTER PACK -WINGS OF THE CAPTAIN- [OP-06]" },
    EB01: { id: '569201', name: "EXTRA BOOSTER -MEMORIAL COLLECTION- [EB-01]" },
    P:    { id: '569901', name: "Promotion card" },
    LP:   { id: '569801', name: "Limited Product card" }
  }.with_indifferent_access.freeze

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

    def to_yaml
      to_s
    end

    def series
      SERIES[prefix.to_sym]
    end

    delegate :id, :name, to: :series, prefix: true, allow_nil: true
  end
end
