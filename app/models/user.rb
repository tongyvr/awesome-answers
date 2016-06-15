class User < ActiveRecord::Base
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
