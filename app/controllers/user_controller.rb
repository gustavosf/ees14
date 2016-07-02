# encoding: utf-8

class UserController < ApplicationController

  before_filter :admin_only

  # def new
  # 	print "kdoekdoeakdoea"
  # end

  def index
    @users = User.all
  end

  def show
    @user = User.find params[:id]
  end
  
  def update
    user = User.find params[:id]
    user.name = params[:user][:name]
    user.email = params[:user][:email]
    user.access = params[:user][:access]
    user.save
    redirect_to user_index_path, :flash => {success: "O usuário #{user.name} foi atualizado com sucesso!"}
  end

  def destroy
    user = User.find params[:id]
    user.delete
    redirect_to user_index_path, :flash => {success: "O usuário #{user.name} foi removido com sucesso!"}
  end

  def create
    if User.where(email: params[:user][:email]).exists? then
      redirect_to new_user_path, :flash => {error: "O e-mail #{params[:user][:email]} já está cadastrado no sistema!"}
      return
    end

    user = User.new
    user.name = params[:user][:name]
    user.email = params[:user][:email]
    user.access = params[:user][:access]
    user.save
    redirect_to user_index_path, :flash => {success: "O usuário #{user.name} foi cadastrado com sucesso!"}
  end
end