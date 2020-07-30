class GroupsController < ApplicationController

  def index
    if params[:groupId].present? 
      @group = Group.find(params[:groupId]) 
      @ids = @group.users.ids 
      return nil if params[:keyword] == ""
      @users = User.where(['name LIKE ?', "%#{params[:keyword]}%"]).where.not(id: current_user.id, id: @ids).limit(10)
    else
      return nil if params[:keyword] == ""
      @users = User.where(['name LIKE ?', "%#{params[:keyword]}%"]).where.not(id: current_user.id).limit(10)
    end
    respond_to do |format|
      format.html
      format.json{ render 'index.json.jbuilder' }
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
    @albums = @group.albums.all.includes(:pictures).order('created_at DESC')
  end

  def search
    @group = Group.find(params[:id])
    @search_albums = @group.albums.all.includes(:pictures).search(params[:search])
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
