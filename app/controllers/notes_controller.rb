class NotesController < ApplicationController
  def index
    @notes = Note.all
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new note_params
    @note.save
    redirect_to notes_path
  end

  def edit
    @note = Note.find params[:id]
  end

  def update
    @note = Note.find params[:id]
    @note.update! note_params
    redirect_to notes_path
  end 

  def destroy
    @note = Note.find params[:id]
    @note.try :destroy
    redirect_to notes_path
  end

  private

  def note_params
    params.require(:note).permit(:text)
  end 
end
