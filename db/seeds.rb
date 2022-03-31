require "csv"

Game.delete_all
Publisher.delete_all
Page.delete_all

filename = Rails.root.join("db/games.csv")
#puts "Loading Games from the csv file: #{filename}"
csv_data = File.read(filename)

games = CSV.parse(csv_data, headers: true, encoding: "utf-8")

games.each do |m|
  # puts m["genre"]
  publisher = Publisher.find_or_create_by(name: m["publisher"])
  # publisher = Publisher.create(name: m["publisher"])

  if publisher && publisher.valid?
    game = publisher.games.create(
      name: m["name"],
      description:  m["description"],
      price:        m["price"],
      role:         m["roles"],
      publisher_id:     publisher["id"]
    )
  else

  end
end
Page.create(
  title:     "About the website",
  content:   "The data powering this game website was provided by nintendo."
)

Page.create(
  title:     "Contact Me",
  content:   "If you like this website and would like to reach out, please email me at 2519663066h@gmail.com"
)

puts "Created #{Publisher.count} Publishers."
puts "Created #{Game.count} Games."
puts "Created #{Page.count} Pages."