class TreesController < ApplicationController
  def index
    @title = "My Family Tree"
    render 'index1.html.erb'
  end
end
