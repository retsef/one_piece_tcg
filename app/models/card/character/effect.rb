require 'polyglot'
require 'treetop'

module Card::Character::Effect
  extend Card::Effect

  # Effects
  class BaseEffect < Card::Effect::GroupNode
    def count
      elements.find { |e| e.class.to_s.include? 'Integer' }&.parse
    end

    def rule
      return :up_to if elements.any? { |e| e.class.to_s.include? 'UpTo' }
      return :or_less if elements.any? { |e| e.class.to_s.include? 'OrLess' }
      return :all if elements.any? { |e| e.class.to_s.include? 'All' }

      :exact
    end
  end

  class ActivateEffect < BaseEffect
  end

  class DrawEffect < BaseEffect
  end

  class TrashEffect < BaseEffect
  end

  class GiveEffect < BaseEffect
  end

  class RestEffect < BaseEffect
  end

  class ReturnEffect < BaseEffect
  end

  class LookUpEffect < BaseEffect
  end

  class KOEffect < BaseEffect
  end

  class PlaceEffect < BaseEffect
  end

  class PlayEffect < BaseEffect
  end

  class SearchEffect < BaseEffect
  end

  # Conditions
  class BaseCondition < Card::Effect::GroupNode
    def count
      elements.find { |e| e.class.to_s.include? 'Integer' }&.parse
    end

    def rule
      return :up_to if elements.any? { |e| e.class.to_s.include? 'UpTo' }
      return :or_less if elements.any? { |e| e.class.to_s.include? 'OrLess' }
      return :all if elements.any? { |e| e.class.to_s.include? 'All' }

      :exact
    end
  end

  class DonCostCondition < BaseCondition
  end

  class LifeCondition < BaseCondition
  end

  class CardHandCondition < BaseCondition
  end

  class LeaderCondition < BaseCondition
  end

  class KOCondition < BaseCondition
  end

  # Parser
  Treetop.load Rails.root.join('lib/card_character_effect.treetop').to_s
  @@parser = Card::Character::EffectParser.new

  def self.parse(data)
    # Pass the data over to the parser instance
    tree = @@parser.parse(data)

    # If the AST is nil then there was an error during parsing
    # we need to report a simple error message to help the user
    throw ParsingError.new(data, @@parser) if tree.nil?

    # clean_tree(tree)

    tree
  end

end
