# frozen_string_literal: true

module JuloTree
  #
  # TreeWalker
  #
  class TreeWalker
    def initialize(root, visitor)
      @root = root
      @visitor = visitor
    end
    
    def walk
      _walk(@root, 0, 0)
    end
    
    private
    
    def _walk(node, index, level)
      children = JulopediaNode.where(parent: node && node.id).order(:ordering).to_a
      
      children_results = children.map.with_index do |child, child_index|
        _walk(child, child_index, level + 1)
      end
      
      @visitor.visit_node(node, children_results, index, level)
    end
  end
end
