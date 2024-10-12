require 'polyglot'
require 'treetop'

module Card::Effect
  class ParsingError < StandardError
    def initialize(data = '', parser = nil, chunk_offset = 5)
      error_index = parser&.failure_index || 0 # parser.index
      sliced_data = data.slice([ 0, error_index - chunk_offset ].max, [ data.size, chunk_offset * 2 ].min)
      message = "Parse error at index #{error_index} on \"#{data[error_index]}\" near: \"#{sliced_data}\""

      super(message)
    end
  end

  class BaseNode < Treetop::Runtime::SyntaxNode
  end

  class Literal < BaseNode
    def parse
      text_value.strip
    end

    def to_array
      text_value.strip
    end

    def inspect
      to_array
    end
  end

  class GroupNode < BaseNode
    def parse
      elements.map(&:parse)
    end

    def to_array
      elements.map(&:to_array)
    end

    def inspect
      to_array
    end
  end

  # Parser nodes
  class ShallowParsedQuery < GroupNode
    def cost_node
      return nil unless elements.size >= 2

      elements[0]
    end

    def main_node
      return elements.first unless elements.size >= 2

      elements[1]
    end

    def effects
      (main_node&.elements || []).select { |e| e.class.name&.demodulize.to_s.include? 'Effect' }
    end

    def actions
      (main_node&.elements || []).select { |e| e.class.name&.demodulize.to_s.include? 'Action' }
    end

    def conditions
      (main_node&.elements || []).select { |e| e.class.name&.demodulize.to_s.include? 'Condition' }
    end

    def investments
      (main_node&.elements || []).select { |e| e.class.name&.demodulize.to_s.include? 'Investment' }
    end
  end

  class SentenceNode < GroupNode
  end

  # Literals
  class LifeLiteral < Literal
  end

  class SelfLiteral < Literal
  end

  class OpponentLiteral < Literal
  end

  class TargetLiteral < Literal
  end

  class DonLiteral < Literal
  end

  class LeaderLiteral < Literal
  end

  class UpToLiteral < Literal
  end

  class AllLiteral < Literal
  end

  class EveryLiteral < Literal
  end

  class OrLessLiteral < Literal
  end

  class OrMoreLiteral < Literal
  end

  class TraitNode < Literal
  end

  class TraitLiteral < Literal
    TRAITS = {
      '[Blocker]': :blocker,
      '[Rush]': :rush,
      '[Banish]': :banish,
      '[Double Attack]': :double_attack
    }.freeze

    def parse
      TRAITS.fetch(text_value.strip.to_sym, text_value.strip)
    end
  end

  class ElementLiteral < Literal
    ELEMENTS = {
      '<Strike>': :strike,
      '<Special>': :special,
      '<Slash>': :slash,
      '<Wisdom>': :wisdom,
      '<Ranged>': :ranged
    }.freeze

    def parse
      ELEMENTS.fetch(text_value.strip.to_sym, text_value.strip)
    end
  end

  class ActionLiteral < Literal
    ACTIONS = {
      '[Main]': :main,
      '[Activate: Main]': :activate_main,
      '[End of Your Turn]': :end_of_your_turn,
      '[Your Turn]': :your_turn,
      "[Opponent's Turn]": :opponents_turn,
      '[On Play]': :on_play,
      '[When Attacking]': :when_attacking,
      '[Counter]': :counter,
      "[On Your Opponent's Attack]": :on_your_opponents_attack
    }.freeze

    def parse
      ACTIONS.fetch(text_value.strip.to_sym, text_value.strip)
    end
  end

  class OncePerTurnLiteral < Literal
  end

  # Conditions
  class DonCostCondition < GroupNode
  end

  class DonSacrificeCondition < GroupNode
  end

  class DonInvestmentCondition < GroupNode
    VALUES = {
      '➀': 1,
      '➁': 2,
      '➂': 3,
      '➃': 4,
      '①': 1,
      '②': 2,
      '③': 3,
      '④': 4
    }.freeze

    def parse
      return 0 unless VALUES.include?(text_value.strip)

      VALUES.index_of(text_value.strip)
    end

    def to_array
      parse
    end
  end

  class TermLiteral < Literal
  end

  class IntegerLiteral < Literal
    def parse
      text_value.to_i
    end

    def to_array
      text_value.to_i
    end
  end

  def self.clean_tree(root_node)
    return if root_node.elements.nil?

    root_node.elements.delete_if { |node| node.class.name == 'Treetop::Runtime::SyntaxNode' }
    root_node.elements.each { |node| clean_tree(node) }
  end
end
