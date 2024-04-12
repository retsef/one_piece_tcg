require 'polyglot'
require 'treetop'

module Card::Character::Effect
  include Card::Effect

  # Effects
  class ActivateEffect < Card::Effect::GroupNode
  end

  class DrawEffect < Card::Effect::GroupNode
    def count
      elements.find { |e| e.class.to_s.include? 'Integer' }&.parse
    end

    def rule
      return :up_to if elements.any? { |e| e.class.to_s.include? 'UpTo' }
      return :or_less if elements.any? { |e| e.class.to_s.include? 'OrLess' }

      :exact
    end
  end

  class TrashEffect < Card::Effect::GroupNode
    def count
      elements.find { |e| e.class.to_s.include? 'Integer' }&.parse
    end

    def rule
      return :up_to if elements.any? { |e| e.class.to_s.include? 'UpTo' }
      return :or_less if elements.any? { |e| e.class.to_s.include? 'OrLess' }

      :exact
    end
  end

  class GiveEffect < Card::Effect::GroupNode
    def count
      elements.find { |e| e.class.to_s.include? 'Integer' }&.parse
    end

    def rule
      return :up_to if elements.any? { |e| e.class.to_s.include? 'UpTo' }
      return :or_less if elements.any? { |e| e.class.to_s.include? 'OrLess' }

      :exact
    end
  end

  class RestEffect < Card::Effect::GroupNode
    def count
      elements.find { |e| e.class.to_s.include? 'Integer' }&.parse
    end

    def rule
      return :up_to if elements.any? { |e| e.class.to_s.include? 'UpTo' }
      return :or_less if elements.any? { |e| e.class.to_s.include? 'OrLess' }

      :exact
    end
  end

  class KOEffect < Card::Effect::GroupNode
  end

  class SearchEffect < Card::Effect::GroupNode
  end

  # Conditions
  class DonCostCondition < Card::Effect::GroupNode
  end

  class LifeCondition < Card::Effect::GroupNode
  end

  class LeaderCondition < Card::Effect::GroupNode
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
