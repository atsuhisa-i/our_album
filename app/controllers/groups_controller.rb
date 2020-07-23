class GroupsController < ApplicationController
  def index
    @albums = Album.serch(params[:keyword])
    respond_to do |format|
      format.html
      format.json { render json: @albums.to_json(:include => [:pictures]) }
    end
  end


  def new
    @group = Group.new
    @group.users << current_user
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to users_path, notice: 'グループを作成しました'
    else
      render :new
    end
  end

  def show
    @group = Group.find(params[:id])
    @albums = Album.all.includes(:pictures).order('created_at DESC')
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to users_path, notice: 'グループを更新しました'
    else
      render :edit
    end
  end

private

  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end

end
