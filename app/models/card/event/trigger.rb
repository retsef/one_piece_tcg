require 'polyglot'
require 'treetop'

module Card::Event::Trigger
  extend Card::Trigger

  # Parser
  def self.parser
    return @@parser if defined? @@parser

    Treetop.load Rails.root.join('lib/card/effect.treetop').to_s
    Treetop.load Rails.root.join('lib/card/trigger.treetop').to_s
    Treetop.load Rails.root.join('lib/card/event/trigger.treetop').to_s
    @@parser ||= Card::Event::TriggerParser.new
  end

  def self.parse(data)
    # Pass the data over to the parser instance
    tree = parser.parse(data, root: :body)

    # If the AST is nil then there was an error during parsing
    # we need to report a simple error message to help the user
    throw ParsingError.new(data, parser) if tree.nil?

    # clean_tree(tree)

    tree
  end
end
