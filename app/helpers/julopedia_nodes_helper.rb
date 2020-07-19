# frozen_string_literal: true

#
# Helpers for JulopediaNodesController.
#
module JulopediaNodesHelper
  def delete_link(node)
    delete_url = julopedia_node_path(node)
    link_to 'Destroy',
            delete_url,
            method: :delete,
            data: { confirm: 'Are you sure?' }
  end
end
