class NotesController < ApplicationController
  before_action :find_starred_repo, only: [:new, :create]
  def new
    @note = @star.notes.build(user: current_user)
  end

  def show
    @note = Note.find(params[:id])
  end

  def create
    @note = @star.notes.build(note_params)
    @note.user_id = current_user.id
    if @note.save
      render :edit
    else
      flash[:error] = @note.errors.full_messages
      render :new
    end
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    @note.update(note_params)
    if @note.save
      redirect_to @note
    else
      render :edit
    end
  end

  private
  def find_starred_repo
    @star = Star.find(params[:star_id])
  end

  def note_params
    params.require(:note).permit(:star_id, :content, :name, :user_id)
  end

end