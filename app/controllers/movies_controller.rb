class MoviesController < ApplicationController
  load_and_authorize_resource

  # GET /movies
  # GET /movies.json
  def index
    @movies = Movie.page(params[:page]).per(8).order('release_date DESC')

    respond_to do |format|
      format.html # index.html.erb
      format.js
      format.json { render json: @movies }
    end
  end

  # GET /movies/1
  # GET /movies/1.json
  def show
    @comment = Comment.new
    @review = Review.new
    @movie = Movie.find(params[:id])
    @commentable = @movie
    @comments = @commentable.comments.order(:created_at)
    @reviewable = @movie
    @reviews = @reviewable.reviews.order(:created_at)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @movie }
    end
  end

  # GET /movies/new
  # GET /movies/new.json
  def new
    @movie = Movie.new
    @genres = Genre.all
    @countries = Country.all
    @professions = Profession.all
    @people = Person.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @movie }
    end
  end

  # GET /movies/1/edit
  def edit
    @movie = Movie.find(params[:id])
    @genres = Genre.all
    @countries = Country.all
    @professions = Profession.all
    @people = Person.all
  end

  # POST /movies
  # POST /movies.json
  def create
    @movie = Movie.new(params[:movie])
    @genres = Genre.all
    @countries = Country.all
    @professions = Profession.all
    @people = Person.all

    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
        format.json { render json: @movie, status: :created, location: @movie }
      else
        @countries = Country.all
        format.html { render action: "new" }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /movies/1
  # PUT /movies/1.json
  def update
    @movie = Movie.find(params[:id])
    @genres = Genre.all
    @countries = Country.all
    @professions = Profession.all
    @people = Person.all

    respond_to do |format|
      if @movie.update_attributes(params[:movie])
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy

    respond_to do |format|
      format.html { redirect_to movies_url }
      format.json { head :no_content }
    end
  end

  def rate
    @movie = Movie.find(params[:id])
    @movie.rate(params[:stars], current_user, params[:dimension])
    
    respond_to do |format|
      format.js
    end
  end

  def search
    @movies = Movie.search(params)
    @countries = Country.all
    @genres = Genre.all
    @people = Person.all
  end
end