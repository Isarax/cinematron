class Ability
  include CanCan::Ability
 
  def initialize(user)
    user ||= User.new # guest user
 
    if user.role? :admin
      can :manage, :all
    elsif user.role? :moderator
      can :manage, [Movie, Person, Comment, Genre, Country, Profession]
      can :manage, User do |user|
        roles = user.roles.map { |role| role.name }
        !roles.include?(:admin) && !roles.include?(:moderator)
      end
    else#if user.role? :user
      can :read, [Movie, Person, Comment]
      can :create, Comment
      can :manage, Comment do |comment|
        comment.user == user
      end
    end
  end
end