class CommentsController < ApplicationController
  before_filter :load_commentable
  load_and_authorize_resource :commentable
  load_and_authorize_resource :through => :commentable

  def create
    @comment = Comment.new(params[:comment])
    @commentable.comments << @comment

    respond_to do |format|
      if @comment.save
        format.js
      end
    end
  end

  def destroy
    @comment = Comment.destroy(params[:id])
    
    respond_to do |format|
      format.js
    end
  end
  
  private

  def load_commentable
    resource, id = request.path.split('/')[1, 2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end
end
