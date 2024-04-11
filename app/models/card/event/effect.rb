require 'polyglot'
require 'treetop'

module Card::Event::Effect
  include Card::Effect

  # Parser
  Treetop.load Rails.root.join('lib/card_event_effect.treetop').to_s
  @@parser = Card::Event::EffectParser.new

  def self.parse(data)
    # Pass the data over to the parser instance
    tree = @@parser.parse(data)

    # If the AST is nil then there was an error during parsing
    # we need to report a simple error message to help the user
    raise StandardError, "Parse error near: \"#{data.slice(@@parser.index - 10, 10)}\"" if tree.nil?

    clean_tree(tree)

    tree
  end

end
