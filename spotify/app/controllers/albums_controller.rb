class AlbumsController < ApplicationController
before_action :redirect_if_logged_out
    def new
        @album = Album.new
        render :new
    end

    def create
        @album = Album.new(album_params)

        if @album.save
            redirect_to bands_url
        else 
            raise "nope"
        end 
    end 

    def show
        @album = Album.find(params[:id])

        render :show
    end 


    private 

    def album_params
        params.require(:album).permit(:title, :year, :live?, :band_id)
    end 
end
