# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string(255)      default(""), not null
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  role_id                :integer
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ajaxful_rater

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :role_id, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  validates :name, presence: true, uniqueness: true

  belongs_to :role
  has_many :comments
  has_many :reviews

  after_create :default_role

  def role?(rolename)
    if role.nil?
      false
    else
      role.name == rolename
    end
  end

  private

  def default_role
    self.role ||= Role.where(name: 'user').first
    self.save
  end
end
