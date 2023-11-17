class ListsController < ApplicationController

  before_action :set_params, only: [:show, :edit, :update, :destroy]

  def new
    @list = List.new
  end

  def index
    @lists = List.all
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end
  def edit
  end

  def update
    @list.update(list_params)
    redirect_to list_path(@list)
  end

  def show
    @bookmarks = @list.bookmarks
  end

  def destroy
    @list.destroy
    redirect_to list_path, status: :see_other
  end

  private

  def set_params
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
