class SessionsController < ApplicationController
  def new
  end

  def create
    @gamer = Gamer.find_by(gamertag: params[:gamertag])

    if @gamer
      if @gamer.authenticate(params[:password])
        session[:gamer_id] = @gamer.id
        redirect_to "/"
      else
        return redirect_to "/signin"
      end
    else
      return redirect_to "/signin"
    end
  end

  def destroy
    session.delete :gamer_id

    redirect_to signin_path
  end
end