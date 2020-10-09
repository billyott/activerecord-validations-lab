class Post < ActiveRecord::Base
    include ActiveModel::Validations
    validates_with TitleValidator
    validates_with ContentValidator
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
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
