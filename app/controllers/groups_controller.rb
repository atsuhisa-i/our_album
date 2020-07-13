class GroupsController < ApplicationController

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
  end

  def update
  end

private

  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end

end
