require 'polyglot'
require 'treetop'

module Card::Trigger
  extend Card::Effect

  # Effects
  class PlayEffect < Card::Effect::GroupNode
  end

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

  class KOEffect < Card::Effect::GroupNode
  end

  class TrashEffect < Card::Effect::GroupNode
  end

  class GiveEffect < Card::Effect::GroupNode
  end

  class RestEffect < Card::Effect::GroupNode
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
  Treetop.load Rails.root.join('lib/card_trigger.treetop').to_s
  @@parser = Card::TriggerParser.new

  def self.parse(data)
    # Pass the data over to the parser instance
    tree = @@parser.parse(data)

    # If the AST is nil then there was an error during parsing
    # we need to report a simple error message to help the user
    raise StandardError, "Parse error at index #{@@parser.index}" if tree.nil?

    # clean_tree(tree)

    tree
  end

  def self.clean_tree(root_node)
    return if root_node.elements.nil?

    root_node.elements.delete_if { |node| node.instance_of?(::Treetop::Runtime::SyntaxNode) }
    root_node.elements.each { |node| clean_tree(node) }
  end
end
