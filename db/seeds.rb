# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "date"

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

# alba = Child.create!(
#   user: antoine,
#   first_name: 'Alba',
#   birth_date: DateTime.new(2019, 1, 30),
#   alarm: true
# )
# file = File.open(Rails.root.join("db/seeds/children/fille.webp"))
# alba.avatar.attach(io: file, filename: "fille.webp", content_type: "image/webp")

hugo = Child.create!(
  user: antoine,
  first_name: 'Hugo',
  birth_date: DateTime.new(2018, 4, 20),
  alarm: false
)
file = File.open(Rails.root.join("db/seeds/children/garcon.jpeg"))
hugo.avatar.attach(io: file, filename: "garcon.jpeg", content_type: "image/jpeg")

maggie = Child.create!(
  user: fran,
  first_name: 'Maggie',
  birth_date: DateTime.new(2019, 1, 15),
  alarm: true
)
file = File.open(Rails.root.join("db/seeds/children/fille.webp"))
maggie.avatar.attach(io: file, filename: "fille.webp", content_type: "image/webp")

arnold = Child.create!(
  user: fran,
  first_name: 'Arnold',
  birth_date: DateTime.new(2018, 4, 5),
  alarm: false
)
file = File.open(Rails.root.join("db/seeds/children/garcon.jpeg"))
arnold.avatar.attach(io: file, filename: "garcon.jpeg", content_type: "image/jpeg")

puts "Creating games..."

game_one = Game.create!(
  name: "Mémoire d'éléphant",
  description: "Jeu de mémoire avec des cartes. Retrouve les paires d'animaux!",
  category: 'Mémoire'
)
file = File.open(Rails.root.join("db/seeds/games/elephant.jpeg"))
game_one.photo.attach(io: file, filename: "elephant.jpeg", content_type: "image/jpeg")

game_two = Game.create!(
  name: 'Génie des maths',
  description: 'Jeu de calcul pour t\'entraîner aux opérations!',
  category: 'Calcul'
)
file = File.open(Rails.root.join("db/seeds/games/calcul.jpeg"))
game_two.photo.attach(io: file, filename: "calcul.jpeg", content_type: "image/jpeg")

game_three = Game.create!(
  name: 'Animaux en puzzle',
  description: 'Jeu de puzzle! Sauras-tu reconstituer l\'image?',
  category: 'Logique'
)
file = File.open(Rails.root.join("db/seeds/games/carte.jpeg"))
game_three.photo.attach(io: file, filename: "carte.jpeg", content_type: "image/jpeg")

game_four = Game.create!(
  name: 'Sons en folie',
  description: 'Trouve à quels animaux appartiennent ces bruits!',
  category: 'Éveil'
)
file = File.open(Rails.root.join("db/seeds/games/lions.jpeg"))
game_four.photo.attach(io: file, filename: "lions.jpeg", content_type: "image/jpeg")

game_five = Game.create!(
  name: 'Chasse aux papillons',
  description: 'Attrape un maximum de papillons dans ton filet!',
  category: 'Rapidité'
)
file = File.open(Rails.root.join("db/seeds/games/papillons.jpeg"))
game_five.photo.attach(io: file, filename: "papillons.jpeg", content_type: "image/jpeg")

game_six = Game.create!(
  name: 'Rebus',
  description: 'Apprends à écrire des nouveaux mots avec ce rebus!',
  category: 'Écriture'
)
file = File.open(Rails.root.join("db/seeds/games/rebus.jpeg"))
game_six.photo.attach(io: file, filename: "rebus.jpeg", content_type: "image/jpeg")

game_seven = Game.create!(
  name: 'Couleurs partout',
  description: 'Laisse parler ta créativité et colorie plein de dessins!',
  category: 'Éveil'
)
file = File.open(Rails.root.join("db/seeds/games/coloriage.jpeg"))
game_seven.photo.attach(io: file, filename: "coloriage.jpeg", content_type: "image/jpeg")

game_eight = Game.create!(
  name: 'Jeu de billes',
  description: 'Apprends à compter simplement avec ce jeu de billes!',
  category: 'Calcul'
)
file = File.open(Rails.root.join("db/seeds/games/billes.jpeg"))
game_eight.photo.attach(io: file, filename: "billes.jpeg", content_type: "image/jpeg")

game_nine = Game.create!(
  name: 'Trouve les lettres',
  description: 'Écris de nouveaux mots avec ce jeu simple d\'orthographe!',
  category: 'Écriture'
)
file = File.open(Rails.root.join("db/seeds/games/bus.jpeg"))
game_nine.photo.attach(io: file, filename: "bus.jpeg", content_type: "image/jpeg")

puts "Creating results..."

# score_a = ChildGame.create!(
#   child: alba,
#   game: game_one,
#   score: 25,
#   start_date: DateTime.new(2023, 5, 20, 16, 30, 0),
#   end_date: DateTime.new(2023, 5, 20, 16, 54, 0)
# )
# score_b = ChildGame.create!(
#   child: alba,
#   game: game_three,
#   score: 10,
#   start_date: DateTime.new(2023, 5, 23, 18, 7, 0),
#   end_date: DateTime.new(2023, 5, 23, 18, 32, 0)
# )
# score_c = ChildGame.create!(
#   child: alba,
#   game: game_six,
#   score: 60,
#   start_date: DateTime.new(2023, 5, 29, 11, 58, 0),
#   end_date: DateTime.new(2023, 5, 29, 12, 17, 0)
# )
score_d = ChildGame.create!(
  child: hugo,
  game: game_one,
  score: 30,
  start_date: DateTime.new(2023, 6, 6, 9, 58, 0),
  end_date: DateTime.new(2023, 6, 6, 10, 17, 0)
)
score_e = ChildGame.create!(
  child: hugo,
  game: game_eight,
  score: 35,
  start_date: DateTime.new(2023, 6, 10, 17, 7, 0),
  end_date: DateTime.new(2023, 6, 10, 17, 32, 0)
)
score_f = ChildGame.create!(
  child: hugo,
  game: game_nine,
  score: 50,
  start_date: DateTime.new(2023, 6, 11, 15, 58, 0),
  end_date: DateTime.new(2023, 6, 11, 16, 17, 0)
)
score_g = ChildGame.create!(
  child: maggie,
  game: game_one,
  score: 25,
  start_date: DateTime.new(2023, 5, 20, 16, 30, 0),
  end_date: DateTime.new(2023, 5, 20, 16, 54, 0)
)
score_h = ChildGame.create!(
  child: maggie,
  game: game_three,
  score: 10,
  start_date: DateTime.new(2023, 5, 23, 18, 7, 0),
  end_date: DateTime.new(2023, 5, 23, 18, 32, 0)
)
score_i = ChildGame.create!(
  child: maggie,
  game: game_six,
  score: 60,
  start_date: DateTime.new(2023, 5, 29, 11, 58, 0),
  end_date: DateTime.new(2023, 5, 29, 12, 17, 0)
)
score_j = ChildGame.create!(
  child: arnold,
  game: game_one,
  score: 30,
  start_date: DateTime.new(2023, 6, 6, 9, 58, 0),
  end_date: DateTime.new(2023, 6, 6, 10, 17, 0)
)
score_k = ChildGame.create!(
  child: arnold,
  game: game_two,
  score: 35,
  start_date: DateTime.new(2023, 6, 7, 17, 7, 0),
  end_date: DateTime.new(2023, 6, 7, 17, 32, 0)
)
score_l = ChildGame.create!(
  child: arnold,
  game: game_five,
  score: 50,
  start_date: DateTime.new(2023, 6, 2, 15, 58, 0),
  end_date: DateTime.new(2023, 6, 2, 16, 17, 0)
)
score_m = ChildGame.create!(
  child: maggie,
  game: game_one,
  score: 30,
  start_date: DateTime.new(2023, 5, 20, 16, 30, 0),
  end_date: DateTime.new(2023, 5, 20, 16, 54, 0)
)

score_n = ChildGame.create!(
  child: arnold,
  game: game_four,
  score: 40,
  start_date: DateTime.new(2023, 6, 2, 16, 30, 0),
  end_date: DateTime.new(2023, 6, 2, 16, 45, 0)
)

score_o = ChildGame.create!(
  child: arnold,
  game: game_six,
  score: 50,
  start_date: DateTime.new(2023, 5, 20, 16, 40, 0),
  end_date: DateTime.new(2023, 5, 20, 16, 54, 0)
)

score_p = ChildGame.create!(
  child: arnold,
  game: game_three,
  score: 20,
  start_date: DateTime.new(2023, 6, 10, 14, 30, 0),
  end_date: DateTime.new(2023, 6, 10, 14, 46, 0)
)

score_q = ChildGame.create!(
  child: arnold,
  game: game_seven,
  score: 25,
  start_date: DateTime.new(2023, 6, 10, 14, 30, 0),
  end_date: DateTime.new(2023, 6, 10, 14, 46, 0)
)

score_r = ChildGame.create!(
  child: arnold,
  game: game_eight,
  score: 15,
  start_date: DateTime.new(2023, 6, 10, 15, 30, 0),
  end_date: DateTime.new(2023, 6, 10, 15, 55, 0)
)

score_s = ChildGame.create!(
  child: arnold,
  game: game_nine,
  score: 30,
  start_date: DateTime.new(2023, 6, 10, 16, 30, 0),
  end_date: DateTime.new(2023, 6, 10, 16, 45, 0)
)

puts "Seeds finished!"
