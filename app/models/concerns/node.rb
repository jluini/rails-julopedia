# frozen_string_literal: true

#
# Base node.
#
module Node
  def self.included(base)
    # base.extend(ClassMethods)
    base.class_eval do
      belongs_to :parent, class_name: :JulopediaNode,
                          optional: true,
                          inverse_of: :children
      has_many :children, class_name: :JulopediaNode,
                          dependent: :nullify,
                          foreign_key: :parent_id,
                          inverse_of: :parent
      validates :ordering, presence: true # integer
    end
  end
  
  # Class methods
  # module ClassMethods
  #   # ...
  # end
  
  # Instance methods
  
  # ...
end
