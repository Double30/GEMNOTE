class NotesController < ApplicationController
  before_action :find_starred_repo, only: [:new, :create]
  def new
    @note = @star.notes.build
  end

  def create
    @note = @star.notes.build(note_params)
    if @note.save
      redirect_to @star
    else
      render :new
    end
  end

  private
  def find_starred_repo
    @star = Star.find(params[:star_id])
  end

  def note_params
    params.require(:note).permit(:star_id, :content, :name)
  end

end