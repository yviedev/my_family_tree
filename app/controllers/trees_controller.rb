class TreesController < ApplicationController
  def index
    @title = "My Family Tree"
    render 'index.html.erb'
  end
end
