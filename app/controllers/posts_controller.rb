class PostsController < ApplicationController

  def index
    @posts = Post.all.order(created_at: :desc)
    

  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = @post.user

  end

  def new
    @post =Post.new
  end

  def create
    @post =Post.new(job: params[:job], region: params[:region],
      allowance: params[:allowance], detail:params[:detail],
      user_id: @current_user.id)

      if @post.save
       flash[:notice] = "投稿を作成しました"
       redirect_to("/posts/index")
     else
       render("posts/new")
     end
   end

  def edit
    @post = Post.find_by(id: params[:id])

  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.job = params[:job]
    @post.region = params[:region]
    @post.allowance = params[:allowance]
    @post.detail = params[:detail]

    if @post.save
        flash[:notice]="投稿を編集しました"
        redirect_to("/posts/index")
     else
        render("posts/edit")
    end

  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice]="投稿を削除しました"
    redirect_to("/posts/index")

  end

end
