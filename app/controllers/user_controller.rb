class UserController < ApplicationController
<<<<<<< HEAD

    def menu

    end

=======
  
>>>>>>> refs/remotes/origin/master

  def new
    @user = User.new(name:nil ,email:params[:email])
    @user.save
  end


#--------------------------------追加----------------------------
  def request
      @user = User.find_by(id: session[:user_id])
      @dogs = Dog.where(user_id: params[:id])
  end


  def test
    @user = User.find_by(id: session[:user_id])
    @request = Request.new(adress: params[:adress],
                           walk: params[:walk],
                           walk_time: params[:walk_time],
                           bait: params[:bait],
                           snack: params[:snack],
                           toilet: params[:toilet],
                           comment_ok: params[:comment_ok],
                           caretaker: params[:caretaker],
                           child: params[:child],
                           native: params[:native],
                           animal: params[:animal],
                           comment_ng: params[:comment_ng]
    )
    @request.save

    params[:dog_choice].each do | di1,di2 |
      if di2 == "1"
          if @request.dog_choice == nil
              @request.dog_choice = "#{di1}"
          else
              @request.dog_choice = "#{@request.dog_choice}" + "," + "#{di1}"
          end
      end
    end

    @request.save
    redirect_to("/post/request/#{@user.id}")
  end

#--------------------------------追加----------------------------

end
