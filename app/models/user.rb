class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable
  # :registerable,:recoverable and :omniauthable

  devise :database_authenticatable, :rememberable, :validatable

  attr_writer :login

  def login
    @login || username || email
  end
end
