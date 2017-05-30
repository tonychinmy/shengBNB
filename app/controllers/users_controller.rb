class UsersController < Clearance::UsersController
  def create
    @user = User.new(user_params)

    if @user.save
      sign_in @user
      redirect_back_or url_after_create
    else
      render template: "users/new"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @edit_user = User.find(params[:id])
    @edit_user.update(user_params)
    redirect_to root_path
  end

  def show
    @user = User.find(params[:id])
  end

private
  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :email, :password)
  end
end
