module Card::Parser
  extend ActiveSupport::Concern

  class_methods do
    def parsed_with(parser_path, parser_class)
      define_singleton_method :parser do
        Treetop.load Rails.root.join(parser_path).to_s
        parser_class.classify.constantize.new
      end
    end

    def parse(data)
      # Pass the data over to the parser instance
      tree = parser.parse(data)

      # If the AST is nil then there was an error during parsing
      # we need to report a simple error message to help the user
      throw ParsingError.new(data, parser) if tree.nil?

      # clean_tree(tree)

      tree
    end

    def clean_tree(root_node)
      return if root_node.elements.nil?

      root_node.elements.delete_if { |node| node.class.name == 'Treetop::Runtime::SyntaxNode' }
      root_node.elements.each { |node| clean_tree(node) }
    end
  end
end
