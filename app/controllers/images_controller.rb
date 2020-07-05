class ImagesController < ApplicationController
  before_action :set_group

  def index
    @images = @group.images.includes(:user)

  def new
    @image = Image.new
  end

  def create
    @imege = @group.images.new(image_params)
    if @image.save
      redirect_to users_path
    else
      flash.now[:alert] = '写真を登録してください'
      render :new
    end
  end

  def show
  end

  private
  def image_params
    params.require(:image).permit(:picture, :content, :date).merge(user_id: current_user.id)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end
end
