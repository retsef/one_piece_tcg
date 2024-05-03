require 'polyglot'
require 'treetop'

module Card::Effect
  class ParsingError < StandardError
    def initialize(data = '', parser = nil, chunk_offset = 3)
      error_index = parser.max_terminal_failure_index # parser.index
      sliced_data = data.slice([0, error_index - chunk_offset].max, [data.size, chunk_offset * 2].min)
      message = "Parse error at index #{error_index} near: \"#{sliced_data}\""

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
  end

  class SentenceNode < GroupNode
  end

  # Literals
  class TraitLiteral < Literal
  end

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

  class OrLessLiteral < Literal
  end

  class OrMoreLiteral < Literal
  end

  class TraitNode < Literal
  end

  class ActionLiteral < Literal
    def parse
      case text_value.strip
      when '[Main]' then :main
      when '[Activate: Main]' then :activate_main
      when '[End of Your Turn]' then :end_of_your_turn
      when '[Your Turn]' then :your_turn
      when "[Opponent's Turn]" then :opponents_turn
      when "[On Play]" then :on_play
      when "[When Attacking]" then :when_attacking
      when "[Counter]" then :counter
      when "[On Your Opponent's Attack]" then :on_your_opponents_attack
      else text_value.strip
      end
    end
  end

  class OncePerTurnLiteral < Literal
  end

  # Conditions
  class DonCostCondition < GroupNode
  end

  class DonInvestmentCondition < GroupNode
    VALUES = %w[① ② ③ ④].freeze

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

  # Parser
  Treetop.load Rails.root.join('lib/card_effect.treetop').to_s
  @@parser = Card::EffectParser.new

  def self.parse(data)
    # Pass the data over to the parser instance
    tree = @@parser.parse(data)

    # If the AST is nil then there was an error during parsing
    # we need to report a simple error message to help the user
    throw ParsingError.new(data, @@parser) if tree.nil?

    # clean_tree(tree)

    tree
  end

  def self.clean_tree(root_node)
    return if root_node.elements.nil?

    root_node.elements.delete_if { |node| node.class.name == "Treetop::Runtime::SyntaxNode" }
    root_node.elements.each { |node| clean_tree(node) }
  end
end
