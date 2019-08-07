class TracksController < ApplicationController
before_action :redirect_if_logged_out
    def new 
        @track = Track.new
        render :new
    end 

    def create 
      @track = Track.new(track_params)

        if @track.save
            redirect_to album_url(@track.album_id)
        else 
            raise "oops"
        end 

    end 

    def show
        @track = Track.find(params[:id])

        render :show
    end 

    private 

    def track_params 
        params.require(:track).permit(:title, :album_id, :ord, :type, :lyrics)
    end 
end
