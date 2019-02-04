class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :clickbait

  def clickbait
    # byebug
    n = [/Won't Believe/, /Secret/, /Top [0-9]/, /Guess/]
    if self.title != nil
      if n.find {|nn| self.title.match(nn)} == nil
          errors.add(:title, "Not enough clickbait")
      end
    end
    # n = ["Won't Believe", "Secret", "Top [0-9]", "Guess"]
    # if self.title != nil
    #   if n.size == (n - self.title.split).size
    #       errors.add(:title, "Not enough clickbait")
    #   end
    # else false
    # end
  end

end
