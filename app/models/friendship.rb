class Friendship < ActiveRecord::Base
  belongs_to :from_character, polymorphic: true
  belongs_to :to_character, polymorphic: true
end
