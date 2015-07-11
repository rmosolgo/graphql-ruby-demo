Human.delete_all
Droid.delete_all
Friendship.delete_all

luke = {
  id: '1000',
  name: 'Luke Skywalker',
  friends: ['1002', '1003', '2000', '2001'],
  appears_in: [4, 5, 6],
  home_planet: 'Tatooine',
}

vader = {
  id: '1001',
  name: 'Darth Vader',
  friends: ['1004'],
  appears_in: [4, 5, 6],
  home_planet: 'Tatooine',
};

han = {
  id: '1002',
  name: 'Han Solo',
  friends: ['1000', '1003', '2001'],
  appears_in: [4, 5, 6],
};

leia = {
  id: '1003',
  name: 'Leia Organa',
  friends: ['1000', '1002', '2000', '2001'],
  appears_in: [4, 5, 6],
  home_planet: 'Alderaan',
};

tarkin = {
  id: '1004',
  name: 'Wilhuff Tarkin',
  friends: ['1001'],
  appears_in: [4],
};

threepio = {
  id: '2000',
  name: 'C-3PO',
  friends: ['1000', '1002', '1003', '2001'],
  appears_in: [4, 5, 6],
  primary_function: 'Protocol',
};

artoo = {
  id: '2001',
  name: 'R2-D2',
  friends: ['1000', '1002', '1003'],
  appears_in: [4, 5, 6],
  primary_function: 'Astromech',
};

def type_for_id(id)
  id < 2000 ? "Human" : "Droid"
end

def create_friendship(from_id, to_id)
  from_id = from_id.to_i
  to_id =   to_id.to_i
  from_type = type_for_id(from_id)
  to_type = type_for_id(to_id)
  Friendship.create!({
    from_character_id: from_id,
    from_character_type: from_type,
    to_character_id: to_id,
    to_character_type: to_type,
  })
end
DROIDS = [threepio, artoo]
HUMANS = [luke, leia, han, vader, tarkin]

DROIDS.each do |droid|
  friend_ids = droid.delete(:friends)
  friend_ids.map { |to_id| create_friendship(droid[:id], to_id) }
  Droid.create!(droid)
end
HUMANS.each do |human|
  friend_ids = human.delete(:friends)
  friend_ids.map { |to_id| create_friendship(human[:id], to_id) }
  Human.create!(human)
end
