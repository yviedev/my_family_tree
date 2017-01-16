class TreesController < ApplicationController
  def index
    @title = "My Family Tree"
    render 'bubble.html'
  end
end
