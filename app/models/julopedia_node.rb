# frozen_string_literal: true

#
# Julopedia node.
#
class JulopediaNode < ApplicationRecord
  # Node
  belongs_to :parent, class_name: :JulopediaNode,
                      optional: true,
                      inverse_of: :children
  has_many :children, class_name: :JulopediaNode,
                      dependent: :nullify,
                      foreign_key: :parent_id,
                      inverse_of: :parent
  validates :ordering, presence: true # integer
  validates :ordering, presence: true # integer
  
  # NamedNode
  validates :name, presence: true # string
  
  # DocumentNode
  validates :kind, presence: true # string
  validates :title, presence: true # string
  validates :content, presence: true # text
  
  # JulopediaNode
  # ...
  
  def self.new_with_defaults(attributes = {})
    attributes.reverse_merge! default_attributes
    new_instance = new attributes
    new_instance
  end
  
  def self.default_attributes
    {
      parent: nil,
      ordering: -1,
      
      name: '',
      
      kind: '',
      title: '',
      content: ''
    }
  end
end
