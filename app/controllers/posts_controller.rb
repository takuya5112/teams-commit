class PostsController < ApplicationController
  before_action :set_group
  
  def index
    @posts = @group.posts.includes(:user)
  end

  
  def new 
    @post = Post.new
  end

  def create
    @post = @group.posts.new(post_params)
    if @post.save
      redirect_to group_posts_path(@group), notice: '投稿が完了しました！'
    else
      @posts = @group.posts.includes(:user)
      redirect_to new_group_post_path(@group), alert: 'テキストを入力して下さい'
      
   end
 end

 def destroy
  post = @group.posts.find(params[:id])
  if post.user != current_user
    redirect_to request.referer
  else
    post.destroy
    redirect_to group_posts_path(@group), alert: '投稿を削除しました。'
  end
 end

 def show
  @post = @group.posts.find(params[:id])
  @comment = Comment.new
  @comments = @post.comments.includes(:user)
  @like = Like.new
 end


  private

  def post_params
    params.require(:post).permit(:title, :text, :image).merge(user_id: current_user.id)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

end
