class UsersController < AppllcationController

  def index
    @users = User.all
  end



end
