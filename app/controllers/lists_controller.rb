class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

# GET /lists
def index
  @user = current_user
  @lists = @user.lists
end

# GET /lists/new
def new
  @list = List.new
end

# POST /lists
def create
  @list = List.new(list_params)
  @list.user_id = current_user.id
  respond_to do |format|
    if @list.save
      format.html { redirect_to root_path}
    else
      format.html { render action: 'new' }
    end
  end
end

# PATCH/PUT /lists/1
def update
  respond_to do |format|
    if @list.update(list_params)
      format.html { redirect_to root_path }
    else
      format.html { render action: 'edit' }
    end
  end
end

# DELETE /lists/1
def destroy
  @list.destroy
  respond_to do |format|
    format.html { redirect_to root_path }
  end
end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_list
    @list = List.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def list_params
    params.require(:list).permit(:content)
  end
end
