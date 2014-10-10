class ImagesController < ApplicationController
  
  def new
    @gallery = Gallery.find(params[:gallery_id])
    @image = Image.new
  end

  def create
    gallery = Gallery.find(params[:gallery_id])
    gallery.images.create(find_image_params)

    redirect_to gallery_path(gallery)
    
  end

  def show
    @image = Image.find(params[:id])
    @gallery = Gallery.find(params[:gallery_id])
  end

  def edit
    @gallery = Gallery.find(params[:gallery_id])
    @image = Image.find(params[:id])
  end

  def update
    image = Image.find(params[:id])
    image_params = find_image_params
    gallery = Gallery.find(params[:gallery_id])
    image.update(image_params)

    redirect_to gallery_image_path(gallery, image)
  end

  def destroy
    image = Image.find(params[:id])
    gallery = Gallery.find(params[:gallery_id])
    image.destroy
    
    redirect_to gallery_path(gallery)
  end

  private

  def find_image_params
    params.require(:image).permit(:name, :description, :url)
  end
end
