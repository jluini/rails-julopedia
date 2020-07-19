# frozen_string_literal: true

#
# Controller for creating, showing and editing JulopediaNode's.
#
class JulopediaNodesController < ApplicationController
  def index
    @nodes = JulopediaNode.all
  end
  
  def show
    @node = JulopediaNode.find(params[:id])
  end
  
  def new
    @node = JulopediaNode.new_with_defaults(
      title: 'Insert title here'
    )
  end
  
  def edit
    @node = JulopediaNode.find(params[:id])
  end
  
  def create
    @node = JulopediaNode.new_with_defaults(node_params)
     
    if @node.save
      redirect_to @node
    else
      render 'new'
    end
  end
  
  def update
    @node = JulopediaNode.find(params[:id])
     
    if @node.update(node_params)
      redirect_to @node
    else
      render 'edit'
    end
  end
  
  def destroy
    @node = JulopediaNode.find(params[:id])
    @node.destroy
   
    redirect_to julopedia_nodes_path
  end
  
  private
  
  def node_params
    params.require(:julopedia_node).permit(
      :name,
      :kind,
      :title,
      :content
    )
  end
end
