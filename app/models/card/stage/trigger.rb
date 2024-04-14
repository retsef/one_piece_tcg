require 'polyglot'
require 'treetop'

module Card::Stage::Trigger
  extend Card::Trigger

  # Parser
  Treetop.load Rails.root.join('lib/card_stage_trigger.treetop').to_s
  @@parser = Card::Stage::TriggerParser.new

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
