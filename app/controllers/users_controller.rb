class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update]

  def index
    if params[:search].present?
      filtered = User.where("name LIKE ? or login LIKE ? or email LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%").all
    else
      filtered = User.all
    end
    @pagy, @users = pagy(filtered.all, items: 10)

    # respond_to do |format|
      
    #   if turbo_frame_request?
    #     format.html { render partial: 'user', locals: { users: @users } }
    #   else
    #     format.html
    #   end
    # end
  end

  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end


  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    if @user.save!
      format.html { redirect_to user_url(@user), notice: "User was successfully created." }
    else
      format.html { render :new, status: :unprocessable_entity }
    end
  end
  
  # PATCH/PUT /users/1 or /users/1.json
  def update
    if @user.update!(user_params)
      format.html { redirect_to user_url(), notice: "User was successfully updated." }
    else
      format.html { render :edit, status: :unprocessable_entity }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :login, :federal_tax_id, :phone_number, :email, :password, :password_confirmation)
  end
end
