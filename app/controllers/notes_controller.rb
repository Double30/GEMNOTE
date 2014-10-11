class NotesController < ApplicationController
  before_action :find_repo, only: :new
  def new
    @note = @repo.notes.build
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
  def find_repo
    @repo = Repository.find(params[:repository_id])
  end

  def note_params
    params.require(:notes).permit(:repository_id, :content, :name)
  end

end