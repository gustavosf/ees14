# encoding: utf-8

class PubController < ApplicationController

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
    redirect_to pub_index_path, notice: "A publicação #{pub.titulo} foi atualizada com sucesso!"
  end

  def destroy
    pub = Publicacao.find params[:id]
    pub.delete
    redirect_to pub_index_path, notice: "A publicação #{pub.titulo} foi removida com sucesso!"
  end

  def create
    pub = Publicacao.get_instance_of_type params[:_type]
    params[:publicacao][:autores] = params[:autores]
    pub.fill_with(params[:publicacao])
    pub.save
    redirect_to pub_index_path, notice: "A publicação #{pub.titulo} foi cadastrada com sucesso!"
  end

end