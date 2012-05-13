# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.delete_all

Product.create(
  title: "Merkur Classic Open Comb 15C Safety Razor Chrome",
  description: "Merkur Classic Open Comb 15C safety razor in chrome finish. This is a classic Merkur safety razor with a 3-piece lightweight design. The open comb is especially suited to a heavy beard. Supplied with one Merkur razor blade.",
  price: 25.50
)

Product.create(
  title: "Merkur Long Handle Open Comb 25C Safety Razor Chrome",
  description: "Merkur Long Handle Open Comb 25C safety razor in chrome finish. The 25C features a similar 3-piece light weight design to the 15C but features a longer handle. The open comb makes the razor suitable for heavy beard types. Supplied with one Merkur razor blade.",
  price: 27.80
)

Product.create(
  title: "Merkur Classic 33C Safety Razor Chrome",
  description: "Merkur Classic 33C safety razor with chrome finish. This is the classic Merkur safety razor and one of the more popular designs available. Supplied with one Merkur razor blade.",
  price: 32.00
)

Product.create(
  title: "Merkur HD 34C Safety Razor Chrome",
  description: "Merkur HD 34C safety razor in chrome. The famous Merkur classic HD (Heavy Duty) safety razor is know for both it's performance and simplicity. The short handle and weighted head offer perfect balance and are one of the reasons this razor is recommended so highly to beginners and experts alike. Supplied with one Merkur razor blade.",
  price: 29.90
)

Product.create(
  title: "Merkur HD Barber Pole 38C Safety Razor Chrome",
  description: "Merkur HD 38C Barber Pole safety razor. The barber pole 38C safety razor is a longer handled version of the Merkur HD 34C. Built to the same high quality as the 34C the additional length alters the weight and balance of the razor.",
  price: 25.50
)

Product.create(
  title: "Merkur Futur Safety Razor Chrome",
  description: "Merkur Futur safety razor in chrome finish. The Merkur Futur is a heavyweight safety razor. Beautifully balanced - this stylish modern razor is also adjustable allowing you to set the blade exposure to your exact taste. Ideal for those with sensitive or normal skin. Supplied with one Merkur razor blade.",
  price: 33.20
)
