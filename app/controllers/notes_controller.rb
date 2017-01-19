class NotesController < ApplicationController

  before_action :find_note, only: [:show, :edit, :update, :destroy]

  def index
    @notes = Note.all.order("created_at DESC")
  end

  def show
  end

  def new
    @note = Note.new
  end

  def create

    @note = Note.new(note_params)

    #redirect to the note after submitting
    if @note.save
      redirect_to @note
    else
      render 'new'
    end

  end

  def edit
  end

  def update
  end

  private

  # method willbe used for previous methods to find which note
  def find_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:title, :content)
  end

end
