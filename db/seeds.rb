# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Cleaning database"
ChildGame.destroy_all
Game.destroy_all
Child.destroy_all
User.destroy_all

puts "Creating users..."

antoine = User.create!(
  first_name: 'Antoine',
  last_name: 'Delprat',
  email: 'antoine.delprat@timmy-games.fr',
  password: 'test1234'
)

fran = User.create!(
  first_name: 'Fran',
  last_name: 'Fine',
  email: 'fran.fine@timmy-games.fr',
  password: 'test1234'
)

puts "Creating children..."

alba = Child.create!(
  user: antoine,
  first_name: 'Alba',
  age: 4,
  alarm: true
)
file = File.open(Rails.root.join("db/seeds/children/fille.webp"))
alba.avatar.attach(io: file, filename: "fille.webp", content_type: "image/webp")

hugo = Child.create!(
  user: antoine,
  first_name: 'Hugo',
  age: 5,
  alarm: false
)
file = File.open(Rails.root.join("db/seeds/children/garcon.jpeg"))
hugo.avatar.attach(io: file, filename: "garcon.jpeg", content_type: "image/jpeg")

maggie = Child.create!(
  user: fran,
  first_name: 'Maggie',
  age: 4,
  alarm: true
)
file = File.open(Rails.root.join("db/seeds/children/fille.webp"))
maggie.avatar.attach(io: file, filename: "fille.webp", content_type: "image/webp")

arnold = Child.create!(
  user: fran,
  first_name: 'Arnold',
  age: 5,
  alarm: false
)
file = File.open(Rails.root.join("db/seeds/children/garcon.jpeg"))
arnold.avatar.attach(io: file, filename: "garcon.jpeg", content_type: "image/jpeg")

puts "Creating games..."

game_one = Game.create!(
  name: 'Jeu 1',
  description: 'Ce jeu de logique est super, venez l’essayer!'
)
file = File.open(Rails.root.join("db/seeds/games/game.jpeg"))
game_one.photo.attach(io: file, filename: "game.jpeg", content_type: "image/jpeg")

game_two = Game.create!(
  name: 'Jeu 2',
  description: 'Ce jeu de logique est super, venez l’essayer!'
)
file = File.open(Rails.root.join("db/seeds/games/game.jpeg"))
game_two.photo.attach(io: file, filename: "game.jpeg", content_type: "image/jpeg")

game_three = Game.create!(
  name: 'Jeu 3',
  description: 'Ce jeu de logique est super, venez l’essayer!'
)
file = File.open(Rails.root.join("db/seeds/games/game.jpeg"))
game_three.photo.attach(io: file, filename: "game.jpeg", content_type: "image/jpeg")

game_four = Game.create!(
  name: 'Jeu 4',
  description: 'Ce jeu de logique est super, venez l’essayer!'
)
file = File.open(Rails.root.join("db/seeds/games/game.jpeg"))
game_four.photo.attach(io: file, filename: "game.jpeg", content_type: "image/jpeg")

game_five = Game.create!(
  name: 'Jeu 5',
  description: 'Ce jeu de logique est super, venez l’essayer!'
)
file = File.open(Rails.root.join("db/seeds/games/game.jpeg"))
game_five.photo.attach(io: file, filename: "game.jpeg", content_type: "image/jpeg")

game_six = Game.create!(
  name: 'Jeu 6',
  description: 'Ce jeu de logique est super, venez l’essayer!'
)
file = File.open(Rails.root.join("db/seeds/games/game.jpeg"))
game_six.photo.attach(io: file, filename: "game.jpeg", content_type: "image/jpeg")

game_seven = Game.create!(
  name: 'Jeu 7',
  description: 'Ce jeu de logique est super, venez l’essayer!'
)
file = File.open(Rails.root.join("db/seeds/games/game.jpeg"))
game_seven.photo.attach(io: file, filename: "game.jpeg", content_type: "image/jpeg")

game_eight = Game.create!(
  name: 'Jeu 8',
  description: 'Ce jeu de logique est super, venez l’essayer!'
)
file = File.open(Rails.root.join("db/seeds/games/game.jpeg"))
game_eight.photo.attach(io: file, filename: "game.jpeg", content_type: "image/jpeg")

game_nine = Game.create!(
  name: 'Jeu 9',
  description: 'Ce jeu de logique est super, venez l’essayer!'
)
file = File.open(Rails.root.join("db/seeds/games/game.jpeg"))
game_nine.photo.attach(io: file, filename: "game.jpeg", content_type: "image/jpeg")

puts "Creating results..."

score_a = ChildGame.create!(
  child: alba,
  game: game_one,
  score: 25
)
score_b = ChildGame.create!(
  child: alba,
  game: game_three,
  score: 10
)
score_c = ChildGame.create!(
  child: alba,
  game: game_six,
  score: 60
)
score_d = ChildGame.create!(
  child: hugo,
  game: game_one,
  score: 30
)
score_e = ChildGame.create!(
  child: hugo,
  game: game_two,
  score: 35
)
score_f = ChildGame.create!(
  child: hugo,
  game: game_five,
  score: 50
)
score_g = ChildGame.create!(
  child: maggie,
  game: game_one,
  score: 25
)
score_h = ChildGame.create!(
  child: maggie,
  game: game_three,
  score: 10
)
score_i = ChildGame.create!(
  child: maggie,
  game: game_six,
  score: 60
)
score_j = ChildGame.create!(
  child: arnold,
  game: game_one,
  score: 30
)
score_k = ChildGame.create!(
  child: arnold,
  game: game_two,
  score: 35
)
score_l = ChildGame.create!(
  child: arnold,
  game: game_five,
  score: 50
)

puts "Seeds finished!"
