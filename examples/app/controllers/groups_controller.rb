require File.expand_path('../../models/group', __FILE__)

class GroupsController < BodyBuilder::Controller

  def index
    render :index, groups: Group.all
  end

  def new
    render :new, notice: notice
  end

  def create
    @group = Group.new(strong_params)
    if @group.save
      redirect_to :index
    else
      self.notice = "Что то пошло не так - #{@group.errors.messages}"
      redirect_to :new
    end
  end

  private

  def strong_params
    params["group"].permit(:name)
  end
end
