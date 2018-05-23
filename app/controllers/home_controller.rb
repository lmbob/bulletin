class HomeController < ApplicationController
  def index
    @list_post=Post.all
  end

  def new
  end

  def show
    @show_post = Post.find(params[:p_id])
  end

  def create
    new_p = Post.new(title: params[:title], editor: params[:editor], content: params[:content])
    new_p.save
    
    redirect_to "/"
    
  end

  def destroy
    Post.find(params[:p_id]).destroy
  end

  def edit
    @edit_post = Post.find(params[:p_id])
  end

  def update
    update_post = Post.find(params[:p_id])
    update_post.title = params[:title]
    update_post.editor = params[:editor]
    update_post.content = params[:content]
    update_post.save
    
    redirect_to '/home/show/'+ params[:p_id].to_s
  end
end
