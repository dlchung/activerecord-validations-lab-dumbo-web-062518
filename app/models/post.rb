class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :is_clickbait?

  # def is_clickbait?
  #   is_clickbait = false
  #   if self.title
  #     clickbait_array = ["Won't Believe", "Secret", "Top", "Guess"]
  #     clickbait_array.each do |word|
  #       if !(self.title.include?(word))
  #         errors.add(:title, "This is not click-baity enough.")
  #         # return true
  #         is_clickbait = true
  #       end
  #     end
  #   end
  #
  #   if is_clickbait == false
  #     errors.add(:title, "This is not click-baity enough.")
  #   end
  # end

  def is_clickbait?
    clickbait_titles = ["Won't Believe", "Secret", "Top", "Guess"]
    if self.title
      if !clickbait_titles.any? {|cb| self.title.include?(cb)}
        errors.add(:title, "no click bait")
      end
    end
  end

end
