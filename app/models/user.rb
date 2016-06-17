class User < ActiveRecord::Base
#has_secure_password will give us functionalities needed for user authentication: it will add attribute accessors: password, password_confiramtion
#it will add a validation for password presence and length of password (4..72)
#if password_confiramtion is set, it will validate that it's the same as password
# if will add handy methods for us to automatically hash the password to the password_digest field and compare a given password
  has_secure_password
  has_many :questions, dependent: :nullify
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true,
                    uniqueness: true
                    # format:


  def full_name
     "#{first_name} #{last_name}"
  end

  def self.search(word)
     where("first_name ILIKE '%#{word}%' OR last_name ILIKE '%#{word}%' OR email ILIKE '%#{word}%'")
  end

  def self.search_exact(word)
     where("first_name LIKE '#{word}' OR last_name LIKE '#{word}' OR email LIKE '#{word}'")
  end

  def self.find_john
    where("first_name != 'John' AND last_name != 'John'")
  end


#   Write a scope that takes a parameter and return all users created after given date...
#
# For example, I can call something like: User.created_after(10.days.ago)

scope :created_after, lambda {|date| where("created_at > ?",date)}





end
