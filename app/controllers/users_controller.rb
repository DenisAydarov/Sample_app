class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
	end

    def new
    	@user = User.new
    end

    def create
    	@user = User.new(user_params)
    	if @user.save
            log_in @user
    		flash[:success] = "Welcome to the Sample App!"
    		redirect_to @user
    	else
    		render 'new'
    	end
    end

    def edit
        @user = User.find(params[:id])
        if @user.update_attributes(user_params1)
            #processing successful update
        else
            render 'edit'
        end
    end

    def update                                    #разобраться с этой хуйней, в тестах users_edit_test запрашивает метод update а патч отсылает на edit
        @user = User.find(params[:id])
        if @user.update_attributes(user_params)
            #processing successful update
        else
            render 'edit'
        end
    end

    private

      def user_params
    	  params.require(:user).permit(:name, :email, :password, :password_confirmation)
      end

      def user_params1                                 #разобраться с этой хуйней, в тестах users_edit_test не работает обычные метод, работает только без require(:user) 
          params.permit(:name, :email, :password, :password_confirmation)
      end
end
