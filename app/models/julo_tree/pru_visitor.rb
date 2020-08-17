# frozen_string_literal: true

module JuloTree
  #
  # Mock node visitor for testing.
  #
  class PruVisitor
    def visit_node(node, children, index, level)
      node_name = node.present? ? node.name : '---'
      
      out = "Node '#{node_name}' (index=#{index}, level=#{level}, #{children.size} children)"
      
      if children.present?
        cs = (children.map { |c| "<li>#{c}</li>" }) * ''
        out += "<ul>#{cs}</ul>"
      end
      
      out
    end
  end
end
