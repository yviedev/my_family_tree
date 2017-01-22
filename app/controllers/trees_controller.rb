class TreesController < ApplicationController
  def index
    @title = "My Family Tree"

    @trees = []

    @trees_array = Relationship.where("user_id = ? OR relative_id = ?", current_user.id, current_user.id) 
    if @trees_array.count > 0
      @trees_array.each do |relationship|
        if User.find(relationship.relative_id).images.first.nil?
          image = ""
        else
          image = User.find(relationship.relative_id).images.first.url
        end

        if relationship.user_id == current_user.id
          @relationship = RelativeType.find(relationship.relative_type_id).name
        else
          @relationship = RelativeType.find(relationship.relative_type_id).inverse_name
        end 

        @trees << {
          user_id: relationship.relative_id,
          name: User.find(relationship.relative_id).first_name,
          relationship: @relationship,
          image: image
        }
      end
    end

    # @trees.order('name ASC')
    p @trees

    render 'donut.html.erb'
  end
end
