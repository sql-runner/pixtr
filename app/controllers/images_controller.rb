class ImagesController < ApplicationController
  
  def new
    @gallery = Gallery.find(params[:gallery_id])
    @image = Image.new
  end

  def create
    @gallery = Gallery.find(params[:gallery_id])
    @image = @gallery.images.new(find_image_params)
    
    if @image.save
      redirect_to gallery_path(@gallery)
    else
      render :new
    end
  end

  def show
    @image = Image.find(params[:id])
    @gallery = Gallery.find(params[:gallery_id])
    @comment = Comment.new
  end

  def edit
    @gallery = Gallery.find(params[:gallery_id])
    @image = Image.find(params[:id])
  end

  def update
    @image = Image.find(params[:id])
    @gallery = Gallery.find(params[:gallery_id])

    if @image.update(find_image_params)
      redirect_to gallery_path(@gallery)
    else
      render :edit
    end
  end

  def destroy
    image = Image.find(params[:id])
    gallery = Gallery.find(params[:gallery_id])
    image.destroy
    
    redirect_to gallery_path(gallery)
  end

  private

  def find_image_params
    params.require(:image).permit(:name, :description, :url, :tag_list, group_ids: [])
  end


end
