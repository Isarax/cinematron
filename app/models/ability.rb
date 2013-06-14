class Ability
  include CanCan::Ability
 
  def initialize(user)
    user ||= User.new # guest user
 
    if user.role? 'admin'
      can :manage, :all
    elsif user.role? 'moderator'
      can :manage, [Movie, Person, Comment, Genre, Country, Profession]
      can :manage, User do |user|
        #roles = user.roles.map { |role| role.name }
        #!roles.include?(:admin) && !roles.include?(:moderator)
        !user.role?('admin') && user.role?('moderator')
      end
    elsif user.role? 'user'
      can :read, [Movie, Person, Comment, Review]
      can :create, [Comment, Review]
      can :manage, Comment do |comment|
        comment.user == user
      end
      can :manage, Review do |review|
        review.user == user
      end
      can :rate, Movie
    else
      can :read, [Movie, Person, Comment, Review]
    end
  end
end