# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Movie.create(title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)
# Movie.create(title: "The Shawshank Redemption", overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7)
# Movie.create(title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: 7.9)
# Movie.create(title: "Ocean's Eight", overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)
require "json"
require "open-uri"

url = "https://tmdb.lewagon.com/movie/top_rated"
top_rated = URI.open(url).read
movies = JSON.parse(top_rated)
array = movies['results']

array.each do |a|
  movie = Movie.new(
    title: a["title"],
    overview: a["overview"],
    poster_url: "https://image.tmdb.org/t/p/w500/#{a['poster_path']}",
    rating: a["vote_average"].to_f * 10
  )
  movie.save!
end

alice = List.new(name: "Alice's List")
picture = File.open("#{Rails.root}/app/assets/images/alilist.jpg")
alice.photo.attach(io: picture, filename: 'alice.png', content_type: 'image/png')
p alice.save ? 'Alice saved successfully' : 'Alice failed to save'

# jules = List.new(name: "Jules's List")
# jules.save!
jules = List.new(name: "Jules's List")
picture = File.open("#{Rails.root}/app/assets/images/juleslist2.JPG")
jules.photo.attach(io: picture, filename: 'jules.png', content_type: 'image/png')
p jules.save ? 'Jules saved successfully' : 'Jules failed to save'

# kipkip = List.new(name: "Kipkip's List")
# kipkip.save!
kipkip = List.new(name: "Kipkip's List")
picture = File.open("#{Rails.root}/app/assets/images/kiplist.jpg")
kipkip.photo.attach(io: picture, filename: 'kipkip.png', content_type: 'image/png')
p kipkip.save ? 'Kipkip saved successfully' : 'Kipkip failed to save'
