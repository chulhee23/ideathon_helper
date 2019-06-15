class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to :team, required: false

  #vote
  has_many :votes
  has_many :liked_teams, through: :votes, source: :team

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    validates_uniqueness_of :name
end
