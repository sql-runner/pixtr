class CommentsController < ApplicationController

  def create
    @image = Image.find(params[:image_id])
    @comment = @image.comments.build(find_image_params)
    if @comment.save
      redirect_to gallery_image_path(@image.gallery_id, @image) 
    else
      redirect_to "image/show"
    end

  end

  private

  def find_image_params
    params.require(:comment).permit(:content).merge(user: current_user)
  end



end
