class GalleriesController < ApplicationController
  def index
    @galleries = Gallery.all
  end

  def show
    @gallery = Gallery.find(params[:id])
  end

  def new
    @gallery = Gallery.new
  end
  def create
    gallery = Gallery.create(find_gallery_params)

    redirect_to gallery_path(gallery)
  end
 def destroy
   gallery = Gallery.find(params[:id])
   gallery.delete

   redirect_to galleries_path
 end
 def edit
   @gallery = Gallery.find(params[:id])
   
 end
 def update
   gallery = Gallery.find(params[:id])
   gallery.update(find_gallery_params)

   redirect_to gallery_path(gallery)
 end

 private

 def find_gallery_params
   params.require(:gallery).permit(:name, :description, :cover_image)
 end

end
