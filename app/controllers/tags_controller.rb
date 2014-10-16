class TagsController < ApplicationController

  def show
    @images = Image.tagged_with(params[:id])
  end

end

