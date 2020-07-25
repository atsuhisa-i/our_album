class AlbumsController < ApplicationController
  before_action :set_group

  def new
    @album = Album.new
    @album.pictures.build
  end

  def create
    @album = @group.albums.new(album_params)
    if @album.save
      redirect_to group_path(@group)
    else
      flash.now[:alert] = '写真を登録してください'
      @album.pictures.build
      redirect_to new_group_album_path
    end
  end

  def show
    @album = Album.find(params[:id])
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])
    if @album.update(album_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to group_path(@group)
  end

private
  def album_params
    params.require(:album).permit(:title, :content, :date, pictures_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end
end
