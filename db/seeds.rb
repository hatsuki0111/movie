# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@movie = Movie.new
@movie.name = 'ハリーポッター'
@movie.year = '2001'
@movie.description = '魔法学校の映画'
@movie.image_url = 'HarryPotter.jpg'
@movie.is_showing = true
@movie.save

