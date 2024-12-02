module Card::Codeable
  extend ActiveSupport::Concern

  SERIES = {
    PRB01: { id: '569301', name: 'PREMIUM BOOSTER -ONE PIECE CARD THE BEST- [PRB-01]' },
    EB01: { id: '569201', name: 'EXTRA BOOSTER -MEMORIAL COLLECTION- [EB-01]' },
    OP08: { id: '569108', name: 'BOOSTER PACK -TWO LEGENDS- [OP-08]' },
    OP07: { id: '569107', name: 'BOOSTER PACK -500 YEARS IN THE FUTURE- [OP-07]' },
    OP06: { id: '569106', name: 'BOOSTER PACK -WINGS OF THE CAPTAIN- [OP-06]' },
    OP05: { id: '569105', name: 'BOOSTER PACK -AWAKENING OF THE NEW ERA- [OP-05]' },
    OP04: { id: '569104', name: 'BOOSTER PACK -KINGDOMS OF INTRIGUE- [OP-04]' },
    OP03: { id: '569103', name: 'BOOSTER PACK -PILLARS OF STRENGTH- [OP-03]' },
    OP02: { id: '569102', name: 'BOOSTER PACK -PARAMOUNT WAR- [OP-02]' },
    OP01: { id: '569101', name: 'BOOSTER PACK -ROMANCE DAWN- [OP-01]' },
    ST20: { id: '569020', name: 'STARTER DECK -Yellow Charlotte Katakuri- [ST-20]' },
    ST19: { id: '569019', name: 'STARTER DECK -Black Smoker- [ST-19]' },
    ST18: { id: '569018', name: 'STARTER DECK -Purple Monkey.D.Luffy- [ST-18]' },
    ST17: { id: '569017', name: 'STARTER DECK -Blue Donquixote Doflamingo- [ST-17]' },
    ST16: { id: '569016', name: 'STARTER DECK -Green Uta- [ST-16]' },
    ST15: { id: '569015', name: 'STARTER DECK -Red Edward.Newgate- [ST-15]' },
    ST14: { id: '569014', name: 'STARTER DECK -3D2Y- [ST-14]' },
    ST13: { id: '569013', name: 'ULTRA DECK -The Three Brothers- [ST-13]' },
    ST12: { id: '569012', name: 'STARTER DECK -Zoro and Sanji- [ST-12]' },
    ST11: { id: '569011', name: 'STARTER DECK -Uta- [ST-11]' },
    ST10: { id: '569010', name: 'ULTRA DECK -The Three Captains- [ST-10]' },
    ST09: { id: '569009', name: 'STARTER DECK -Yamato- [ST-09]' },
    ST08: { id: '569008', name: 'STARTER DECK -Monkey D. Luffy- [ST-08]' },
    ST07: { id: '569007', name: 'STARTER DECK -Big Mom Pirates- [ST-07]' },
    ST06: { id: '569006', name: 'STARTER DECK -Absolute Justice- [ST-06]' },
    ST05: { id: '569005', name: 'STARTER DECK -ONE PIECE FILM edition- [ST-05]' },
    ST04: { id: '569004', name: 'STARTER DECK -Animal Kingdom Pirates- [ST-04]' },
    ST03: { id: '569003', name: 'STARTER DECK -The Seven Warlords of the Sea- [ST-03]' },
    ST02: { id: '569002', name: 'STARTER DECK -Worst Generation- [ST-02]' },
    ST01: { id: '569001', name: 'STARTER DECK -Straw Hat Crew- [ST-01]' },
    P: { id: '569901', name: 'Promotion card' },
    OP: { id: '569801', name: 'Other Product Card' }
  }.with_indifferent_access.freeze

  included do
    serialize :code, coder: Code

    validates :code, presence: true, uniqueness: true

    delegate :prefix, :prefix=, :number, :number=, to: :code, prefix: true

    scope :from_series, ->(series) { where('code LIKE ?', "#{series}-%") }
    scope :available_series, -> {
      result = current_scope

      return result unless available_series_codes.any?

      result = result.from_series(available_series_codes.first)
      available_series_codes.slice(1..).each { |code| result = result.or(from_series(code)) }

      result
    }

    def self.available_series_codes
      SERIES.keys
            .select { |series| Rails.features.enabled?(series) }
    end
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
