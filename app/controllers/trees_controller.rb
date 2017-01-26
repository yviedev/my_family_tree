class TreesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @title = "My Family Tree"

    @trees = []

    p @trees_array = Relationship.where("user_id = ? OR relative_id = ? AND group_id = ?", current_user.id, current_user.id, current_user.group_id) 
    if @trees_array.count > 0
      @trees_array.each do |relationship|
        if User.find(relationship.relative_id).images.first.nil?
          image = ""
        else
          image = User.find(relationship.relative_id).images.first.url
        end

        if relationship.user_id == current_user.id
          @relationship_name_id = relationship.relative_id
          @relationship = RelativeType.find(relationship.relative_type_id).name
        else
          @relationship_name_id = relationship.user_id
          @relationship = RelativeType.find(relationship.relative_type_id).inverse_name
        end 

        @trees << {
          user_id: @relationship_name_id,
          name: User.find(@relationship_name_id).first_name,
          relationship: @relationship,
          image: image
        }
      end
    end

    # @trees.order('name ASC')
    @trees

    render 'donut.html.erb'
  end
end
