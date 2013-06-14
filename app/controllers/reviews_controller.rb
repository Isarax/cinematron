class ReviewsController < ApplicationController
  before_filter :load_reviewable
  load_and_authorize_resource :reviewable
  load_and_authorize_resource :through => :reviewable

  def create
    @review = Review.new(params[:review])
    @reviewable.reviews << @review

    respond_to do |format|
      if @review.save
        format.js
      end
    end
  end

  def edit
    @review = Review.find(params[:id])

    respond_to do |format|
      format.js
    end
  end

  def update
    @review = Review.find(params[:id])

    respond_to do |format|
      if @review.update_attributes(params[:review])
        format.js
      end
    end
  end

  def destroy
    @review = Review.destroy(params[:id])
    @new_review = Review.new
    
    respond_to do |format|
      format.js
    end
  end
  
  private

  def load_reviewable
    resource, id = request.path.split('/')[1, 2]
    @reviewable = resource.singularize.classify.constantize.find(id)
  end

  #def get_reviewable
  #  @reviewable = params[:reviewable].classify.constantize.find(reviewable_id)
  #end

  #def reviewable_id
  #  params[(params[:reviewable].singularize + "_id").to_sym]
  #end
end
