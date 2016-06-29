# encoding: utf-8

class SessionController < ApplicationController

  skip_before_filter :require_login

  def new
    @users = User.all
  end

  def create
    user = User.where(email: params[:email]).first
    if user && user.authenticate(params[:password])
      session[:user] = user
      redirect_to root_url
    else
      flash.now[:error] = "Usuário ou senha inválido(s)!"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url, :notice => "Você foi deslogado"
  end

end