class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  def index
    @notes = Note.where(user_id: current_user)
  end

  def new
    @note = current_user.notes.build
  end

  def create
    @note = current_user.notes.build(notes_params)

    if @note.save
      redirect_to @note, notice: 'Note created successfully!'
    else
      render 'new'
    end
  end

  def update
    if @note.update(note_params)
      redirect_to @note
    else
      render 'edit'
    end
  end

  def destroy
    @note.destroy
    redirect_to notes_path
  end

  private

    def note_params
      params.require(:note).permit(:title, :content)
    end

    def set_note
      @note = Note.find(params[:id])
    end
end
