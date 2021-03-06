class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  def is_admin?
    is_admin
  end

  def full_name
    [first_name, last_name].compact.collect(&:capitalize).join(' ').strip
  end
end
