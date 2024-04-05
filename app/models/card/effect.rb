require 'polyglot'
require 'treetop'

module Card::Effect
  # Parser nodes
  class ShallowParsedQuery < Treetop::Runtime::SyntaxNode
    def parse
      elements.map(&:parse)
    end

    def to_array
      elements.map(&:to_array)
    end
  end

  class SentenceNode < Treetop::Runtime::SyntaxNode
    def parse
      elements.map(&:parse)
    end

    def to_array
      elements.map(&:to_array)
    end
  end

  class QualifierNode < Treetop::Runtime::SyntaxNode
    def parse
      # node = elements[2].parse
      # node[:field] = elements[0].text_value.to_sym
      # node
      {
        field: :default,
        value: text_value.strip,
        negation: false,
        phrase: false,
      }
    end

    def to_array
      text_value.strip
    end
  end

  class TermNode < Treetop::Runtime::SyntaxNode
    def parse
      {
        field: :default,
        value: text_value.strip,
        negation: false,
        phrase: false,
      }
    end

    def to_array
      text_value.strip
    end
  end

  class IntegerNode < Treetop::Runtime::SyntaxNode
    def parse
      text_value.to_i
    end

    def to_array
      text_value.to_i
    end
  end

  class PhraseNode < Treetop::Runtime::SyntaxNode
    def parse
      phrase = elements[1].text_value
      phrase.gsub!('\\\"', "\"")
      phrase.gsub!("\\\\", "\\")
      {
        field: :default,
        value: phrase,
        negation: false,
        phrase: true,
      }
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
    raise StandardError, "Parse error at offset: #{@@parser.index}" if tree.nil?

    clean_tree(tree)

    tree
  end

  def self.clean_tree(root_node)
    return if root_node.elements.nil?

    root_node.elements.delete_if { |node| node.class.name == "Treetop::Runtime::SyntaxNode" }
    root_node.elements.each { |node| clean_tree(node) }
  end
end
