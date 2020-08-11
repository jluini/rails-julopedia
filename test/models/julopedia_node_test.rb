# frozen_string_literal: true

require 'test_helper'

#
# JulopediaNode tests.
#
class JulopediaNodeTest < ActiveSupport::TestCase
  MINUS_ONE = -1
  
  test 'default attributes' do
    node = JulopediaNode.new_with_defaults
    
    assert_nil node.parent
    assert_nil node.parent_id
    assert_equal MINUS_ONE, node.ordering
    
    assert_equal '', node.name
    
    assert_equal '', node.kind
    assert_equal '', node.title
    assert_equal '', node.content
  end
  
  test 'can\'t save a blank node' do
    node = JulopediaNode.new_with_defaults
    save_result = node.save
    assert_not save_result, 'Should not save a node with no name/kind/title/content'
  end
  
  test 'can save a node' do
    node = JulopediaNode.new_with_defaults(
      name: 'node_name',
      kind: 'section',
      title: 'node_title',
      content: 'node_content'
    )
    
    assert_equal false, node.persisted?
    
    save_result = node.save
    assert save_result, 'Should save the node'
    
    assert_equal true, node.persisted?
    
    assert_nil node.parent
    assert_equal MINUS_ONE, node.ordering
    
    assert_equal 'node_name', node.name
    
    assert_equal 'section', node.kind
    assert_equal 'node_title', node.title
    assert_equal 'node_content', node.content
  end
  
  test 'can create a valid node' do
    node = JulopediaNode.create_with_defaults(
      name: 'node_name',
      kind: 'section',
      title: 'node_title',
      content: 'node_content'
    )
    
    assert_equal true, node.persisted?
  end
  
  test 'fixture nodes' do
    cbc_node = JulopediaNode.find(1)
    assert_equal 1, cbc_node.id
    assert_equal 'cbc', cbc_node.name
    assert_nil cbc_node.parent_id
    assert_nil cbc_node.parent
    
    biof_node = JulopediaNode.find(2)
    assert_equal 2, biof_node.id
    assert_equal 'biofisica', biof_node.name
    assert_equal 1, biof_node.parent_id
    assert_equal cbc_node, biof_node.parent
    
    meca_node = JulopediaNode.find(3)
    assert_equal 'Unidad 1: mecánica', meca_node.title
    assert_equal biof_node, meca_node.parent
    assert_equal cbc_node, meca_node.parent.parent
  end
end
