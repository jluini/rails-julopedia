# frozen_string_literal: true

module JuloTree
  module Listings
    #
    # TODO: document
    #
    class NodeEntry
      attr_reader :node, :level
      
      def initialize(node, level)
        @node = node
        @level = level
      end
    end
  end
end
