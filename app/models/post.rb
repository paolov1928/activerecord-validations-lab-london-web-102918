class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"]}
  validate :is_clickbait?

  CLICKBAIT_PATTERNS = [
    /Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i
  ]

  def is_clickbait?
    if CLICKBAIT_PATTERNS.none? { |pat| pat.match title }
      errors.add(:title, "must be clickbait")
    end
  end
end

  # def clickbaity
  #   # if title.include? "Won't Believe" || title.include? "Secret" || title.include? "Top"|| title.include? "Guess"
  # if title != nil
  #
  #   if title.include? "Won't Believe"
  #     true
  #   elsif title.include? "Secret"
  #     true
  #   elsif title.include? "Top"
  #     true
  #   elsif title.include? "Guess"
  #     true
  #   else
  #     false
  #   end
  # end
  # end
# end
