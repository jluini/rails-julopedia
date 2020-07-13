# frozen_string_literal: true

#
# Create julopedia_nodes table.
# Represents a tree-like structure.
#
class CreateJulopediaNodes < ActiveRecord::Migration[6.0]
  def change
    create_table :julopedia_nodes do |t|
      t.references :parent, null: true, foreign_key: { to_table: :julopedia_nodes }
      t.integer :ordering
      t.string :name
      t.string :kind
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
