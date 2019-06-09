class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to :team, required: false
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    validates_uniqueness_of :name
end
