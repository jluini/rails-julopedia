# frozen_string_literal: true

module JuloTree
  module Listings
    #
    # Lists a root node and its children recursively.
    #
    class TreeListing
      def initialize(root = nil, include_root = false, maximum_depth = 10)
        @root = root
        @include_root = include_root
        @maximum_depth = maximum_depth
        
        if @include_root && !@root
          @include_root = false
          Rails.logger.warn 'Include root is set but no root; ignoring it'
        end
        
        fetch_list
      end
      
      def list
        @listing
      end
      
      private
      
      def fetch_list
        @listing = []
        @traversed_ids = {}
        
        fetch_node(@root, 0) if @include_root
        
        fetch_children(@root, 1)
      end
      
      def fetch_children(node, level)
        return if @maximum_depth >= 0 && level > @maximum_depth
        
        children = JulopediaNode.where(parent: node && node.id).order(:ordering)
        
        children.each do |child|
          already_present = fetch_node(child, level)
          fetch_children(child, level + 1) unless already_present
        end
      end
      
      def fetch_node(node, level)
        out = @traversed_ids.key? node.id
        @listing.append NodeEntry.new(node, level)
        @traversed_ids[node.id] = true
        out
      end
    end
  end
end
