# encoding: utf-8

class PubController < ApplicationController

  before_filter :admin_only, :only => [:disable, :enable]
  before_filter :registered_only, :except => :index

  def index
    @pubs = Publicacao.all
  end

  def new
    @type =
      if Publicacao.types.include? params[:type]
      then params[:type]
      else Publicacao.types.first
      end
  end

  def show
    @pub = Publicacao.find params[:id]
  end
  
  def update
    pub = Publicacao.find params[:id]
    params[:publicacao][:autores] = params[:autores]
    pub.fill_with(params[:publicacao])
    pub.save    
    redirect_to pub_index_path, :flash => {success: "A publicação #{pub.titulo} foi atualizada com sucesso!"}
  end

  def destroy
    pub = Publicacao.find params[:id]
    pub.delete
    redirect_to pub_index_path, :flash => {success: "A publicação #{pub.titulo} foi removida com sucesso!"}
  end

  def create
    pub = Publicacao.get_instance_of_type params[:_type]
    params[:publicacao][:autores] = params[:autores]
    pub.fill_with(params[:publicacao])
    pub.save
    redirect_to pub_index_path, :flash => {success: "A publicação #{pub.titulo} foi cadastrada com sucesso!"}
  end

  def disable
    pub = Publicacao.find params[:id] 
    pub.enabled = false
    pub.save
    redirect_to pub_path(pub), :flash => {success: "A publicação #{pub.titulo} foi <b>desativada</b>"}
  end

  def enable
    pub = Publicacao.find params[:id] 
    pub.enabled = true
    pub.save
    redirect_to pub_path(pub), :flash => {success: "A publicação #{pub.titulo} foi <b>reativada</b>"}
  end

end