class Personality < ApplicationRecord
  has_many :users
  has_attached_file :info
  do_not_validate_attachment_file_type :info
  def self.find_by_scores(assessment)
    personality_array = []
    Assessment::AVATAR_CATEGORIES.each do |category|
      if assessment[category].negative?
        personality_array << category.to_s.split('').second
      else
        personality_array << category.to_s.split('').first
      end
    end
    personality = Personality.find_by_code(personality_array.join('').upcase)
    return personality
  end
end
