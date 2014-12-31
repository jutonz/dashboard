class NotesController < ApplicationController
  def index
    @notes = Note.all
  end

  def new
    @note = Note.new
    session[:return_to] ||= request.referer
  end

  def create
    @note = Note.new note_params
    @note.save
    redirect_to session.delete(:return_to)
  end

  def edit
    @note = Note.find params[:id]
    session[:return_to] ||= request.referer
  end

  def update
    @note = Note.find params[:id]
    @note.update! note_params
    redirect_to session.delete(:return_to)
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
