class PostsController < ApplicationController

  load_and_authorize_resource

  def index
    @posts = Post.paginate(page: params[:page]).per_page(5).order('created_at DESC')

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
                      :notice => 'Post publicado com sucesso!') }
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
    @posts = Post.all
    @post.destroy

    respond_to do |format|
      format.html { redirect_to(posts_path,
                    notice: 'Post deletado!') }
      format.json 
    end

  end

  # feed inspired (not to say copied)
  # from http://stackoverflow.com/questions/3951235/how-do-i-make-an-rss-atom-feed-in-rails-3?rq=1
  # This other link is an alternative solution
  # http://stackoverflow.com/questions/4827232/generating-rss-feed-in-rails-3
  def feed
    @posts = Post.all( select: 'title, content, id, created_at',
                       order: 'created_at DESC',
                       limit: 10 )

    respond_to do |format|
      format.html
      format.rss { render layout: false }
    end
  end

end