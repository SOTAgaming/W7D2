class NotesController < ApplicationController

    def new 
        @note = Note.new 

        render :new
    end 

    def create
        @note = Note.new(note_params)
        @note.user_id = current_user.id

        if @note.save 
            redirect_to track_url(@note.track_id)
        else 
            raise "get shwifty"
        end 
    end

    def destroy
        @note = Note.find(params[:id])

        if @note
         @note.destroy
         redirect_to track_url(@note.track_id)
        else 
            raise "well something went wrong"
        end 

        

    end 

    private

    def note_params
        params.require(:note).permit(:user_id, :track_id, :note)
    end 
end
