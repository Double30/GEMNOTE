class NotesController < ApplicationController
  before_action :find_starred_repo, only: :new
  def new
    @note = @star.notes.build
  end

  def create
    @note = Note.new(note_params)
    if @note.save
      redirect_to @note
    else
      render :new
    end
  end

  private
  def find_starred_repo
    @star = Star.find(params[:star_id])
  end

  def note_params
    params.require(:notes).permit(:star_id, :content, :name)
  end

end