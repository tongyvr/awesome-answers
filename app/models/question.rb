class Question < ActiveRecord::Base
  #the dependent option takes values like 'destroy' and 'nullify'
  # destroy will make Rails automatically delete associated answers before deleting the question
  # nullify will make Rails turn 'question_id' values of associated records to 'Null' before deleting the question.
  has_many :answers, dependent: :destroy
  belongs_to :category
  belongs_to :user 

  validates(:title,{presence: {message: "must be present!"}, uniqueness: true})
  validates :body,presence:   true,
                  length:     {minimum: 7},
                  uniqueness: {scope: :title}
  validates :view_count, numericality: {greater_than_or_equal_to: 0}

 #  VALID_EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
 # validates :email, format: VALID_EMAIL_REGEX


   validate :no_monkey
   validate :no_repeat_title

   after_initialize :set_defaults
   before_validation :cap_title, :cap_squeeze

  #  scope :recent, lambda {|count| where("created_at > ?", 3.day.ago).limit(count)}
   def self.recent(count)
     where("created_at > ?", 3.day.ago).limit(count)
  end

   scope :search, lambda {|word| where("body ILIKE ? OR title ILIKE ?")}
  #  def self.search(word)
  #    where("body ILIKE '%#{word}%' OR title ILIKE '%#{word}%'")
  # end


   def new_first_answers
     answers.order(created_at: :DESC)
   end

   private

   def cap_title
     self.title = title.capitalize
   end
   def cap_squeeze
     self.title = title.squeeze(" ")
     self.body.squeeze!(" ")

   end

   def set_defaults
     self.view_count ||= 0
   end

   def no_monkey
     if title && title.downcase.include?("monkey")
       errors.add(:title, "No monkey please!")
     end
   end
   def no_repeat_title
     if body && body.downcase.include?(title)
       errors.add(:body, "Do not repeat title!")
     end
   end

end
