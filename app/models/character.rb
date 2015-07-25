module Character
  EPISODES = {
    4 => "NEWHOPE",
    5 => "EMPIRE",
    6 => "JEDI",
  }

  extend ActiveSupport::Concern
  included do
    serialize :appears_in, JSON

    def friends
      Friendship.where(from_character_id: id).map(&:to_character)
    end
  end
end
