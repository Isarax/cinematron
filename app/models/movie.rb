# == Schema Information
#
# Table name: movies
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  poster       :string(255)
#  trailer      :string(255)
#  min_age      :integer
#  length       :integer
#  release_date :integer
#  budget       :integer
#  info         :text
#  country_id   :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Movie < ActiveRecord::Base
  acts_as_commentable
  ajaxful_rateable stars: 10, allow_update: true
  
  attr_accessible :name, :poster, :trailer, :min_age, :release_date, :length, \
                  :budget, :info, :country_id, :country_attributes, \
                  :genre_movie_joins_attributes, :creators_attributes

  validates :name, presence: true, length: { maximum: 50 }
  validates :min_age, presence: true, numericality: { only_integer: true }, inclusion: { in: 0..21 }
  validates :release_date, presence: true
  validates :length, presence: true, numericality: { only_integer: true }, inclusion: { in: 0..400 }
  validates :budget, presence: true, numericality: { only_integer: true }

  belongs_to :country
  has_many :genre_movie_joins
  has_many :genres, through: :genre_movie_joins
  has_many :creators
  has_many :people, through: :creators
  has_many :comments, as: :commentable
  has_many :reviews, as: :reviewable

  accepts_nested_attributes_for :country
  accepts_nested_attributes_for :genre_movie_joins, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :creators, :reject_if => :all_blank, :allow_destroy => true

  def people_with_profession(name)
    Person.joins(:movies).where('creators.profession_id = (?)', Profession.where(name: name).first.id).where(movies: { name: self.name })
  end

  def self.search(params)
    movies = Movie.order(:name)
    movies = movies.where('name ilike ?', "%#{params[:name]}%") if params[:name].present?
    movies = movies.where("min_age #{params[:min_age_op]} ?", params[:min_age]) if params[:min_age].present?
    movies = movies.where("release_date #{params[:year_op]} ?", params[:year]) if params[:year].present?

    if params[:movie].present? && params[:movie][:country_id].present?
      movies = movies.where('country_id = ?', params[:movie][:country_id])
    end

    if params[:movie].present? && params[:movie][:genre_id].present?
      g = Genre.find(params[:movie][:genre_id])
      movies = movies.select { |m| m.genres.include? g }
    end

    if params[:movie].present? && params[:movie][:person_id].present?
      p = Person.find(params[:movie][:person_id])
      movies = movies.select { |m| m.people.include? p }
    end

    return movies
  end
end
