class PostsController < ApplicationController

  load_and_authorize_resource

  def index
    @posts = Post.all

    respond_to do |format|
      format.html
      format.json { render json: @posts}
    end
  end

  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @post}
    end
  end

  def new
    @post = Post.new

    respond_to do |format|
      format.html
      format.json { render json: @post}
    end

  end

  def create
    @post = Post.new(params[:post])
   
    respond_to do |format|
      if @post.save
        format.html  { redirect_to(posts_path,
                      :notice => 'Postagem publicada com sucesso!') }
        format.json  { render :json => @post,
                      :status => :created, :location => @post }
      else
        format.html  { render :action => "new" }
        format.json  { render :json => @post.errors,
                      :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
  end

end