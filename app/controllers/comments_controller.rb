class CommentsController < ApplicationController
  before_filter :load_commentable
  load_and_authorize_resource :commentable
  load_and_authorize_resource :through => :commentable

  def create
    @comment = Comment.new(params[:comment])
    @commentable.comments << @comment

    respond_to do |format|
      if @comment.save
        #@commentable.comments << @comment
        #format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
        format.js
        #format.json { render json: @movie, status: :created, location: @movie }
      #else
        #format.js
        #@countries = Country.all
        #format.html { render action: "new" }
        #format.json { render json: @movie.errors, status: :unprocessable_entity }
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

  def get_commentable
    @commentable = params[:commentable].classify.constantize.find(commentable_id)
  end

  def commentable_id
    params[(params[:commentable].singularize + "_id").to_sym]
  end
end
