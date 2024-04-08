require 'polyglot'
require 'treetop'

module Card::Trigger
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

  # Main parsed nodes
  class ShallowParsedQuery < GroupNode
    def actions
      elements.select { |e| e.class.to_s.include? 'Effect' }
    end
  end

  # Effects
  class PlayEffect < GroupNode
  end

  class ActivateEffect < GroupNode
  end

  class DrawEffect < GroupNode
  end

  class KOEffect < GroupNode
  end

  class TrashEffect < GroupNode
  end

  class GiveEffect < GroupNode
  end

  # Literals
  class TraitLiteral < Literal
  end

  class TermLiteral < Literal
  end

  class IdentifierLiteral < Literal
  end

  class TargetLiteral < Literal
  end

  class DonLiteral < Literal
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
  Treetop.load Rails.root.join('lib/card_trigger.treetop').to_s
  @@parser = Card::TriggerParser.new

  def self.parse(data)
    # Pass the data over to the parser instance
    tree = @@parser.parse(data)

    # If the AST is nil then there was an error during parsing
    # we need to report a simple error message to help the user
    raise StandardError, "Parse error at index #{@@parser.index}" if tree.nil?

    clean_tree(tree)

    tree
  end

  def self.clean_tree(root_node)
    return if root_node.elements.nil?

    root_node.elements.delete_if { |node| node.instance_of?(::Treetop::Runtime::SyntaxNode) }
    root_node.elements.each { |node| clean_tree(node) }
  end
end
