class TreesController < ApplicationController
  def index
    @title = "My Family Tree"

    @trees = []

    @trees_array = Relationship.where(user_id: current_user.id). where(group_id: current_user.group_id)
    if @trees_array[0]
      @trees_array.each do |relationship|
        if User.find(relationship.relative_id).images.first.nil?
          image = ""
        else
          image = User.find(relationship.relative_id).images.first.url
        end
        @trees << {
          user_id: relationship.relative_id,
          name: User.find(relationship.relative_id).first_name,
          relationship: RelativeType.find(relationship.relative_type_id).name,
          image: image
        }
      end
    end

    # @trees.order('name ASC')

    render 'donut.html.erb'
  end
end
