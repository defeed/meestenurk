# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.delete_all

Category.create(
  name: "Safety Razors",
  description: "Safety razors use a single double-edge blade and were the first type of razor to use a replaceable blade in 1904. Today modern Merkur safety razors and Edwin Jagger safety razors are engineered to produce a smooth and close shave unlike any other. The solid metal safety razors will last you a lifetime and the low cost of replacement blades make these an economical alternative to other wet shaving methods."
)

Category.create(
  name: "Shaving Soaps",
  description: "High quality shaving soap used with a shaving brush will produce a smooth, rich and moisturising lather that can't be beaten. Our selection includes shaving soaps ranging from classic London soaps made to the same standards as they were over 100 years ago to modern shaving soaps with exciting new fragrance combinations."
)

Category.create(
  name: "Shaving Creams",
  description: "Use a shaving cream to produce a wonderfully rich, moisturising and lubricating lather. Shaving cream can be applied using the fingertips but the results are even better when used with a quality shaving brush. Meestenurk stocks some of the finest quality shaving creams available in the world."
)

Category.create(
  name: "Pre Shaves",
  description: "Prepare your face for the ultimate shave with one of our pre shave treatments. Designed to soften the beard and prepare the skin these pre shave treatments are available in oil and gel products."
)

Category.create(
  name: "After Shaves",
  description: "We sell a range of after shave treatments including after shave balms and after shave gels. Use these after your shave to sooth and moisturise your skin to keep it in good condition."
)

Category.create(
  name: "Shaving Brushes",
  description: "A badger shaving brush is essential to getting a close and comfortable shave. Badger shaving brushes are available in a range of different sizes and hair quality."
)

Category.create(
  name: "Razor Blades",
  description: "Double-edge razor blades for safety razors. These modern blades are ultra sharp and ideal for getting that super smooth finish. All the blades we stock are suitable for all types of safety razors."
)

Category.create(
  name: "Accessories",
  description: "Accessories that help you in your daily shaving process. Bowls, razor stands, mirrors, combs and many more."
)

Brand.delete_all

Brand.create(
  name: "Merkur",
  description: "Merkur of Solingen have been producing high quality safety razors and shaving equipment for over seventy years. Regardless of whether you prefer a thorough clean shave or want to give your beard the right contours, when you purchase Merkur products you acquire a piece of highest shaving culture for a cultivated start to the day. Merkur offers the right model and appropriate accessories for every beard type, thus ensuring the best conditions for an effective wet shave."
)

Brand.create(
  name: "Edwin Jagger",
  description: "Edwin Jagger specialise in hand made traditional and contemporary shaving product designs using quality materials and finishes. Edwin Jagger have recently launched a new range of 99.9% natural ingredient shaving soaps and creams that have quickly gained a reputation for providing a smooth and comfortable shave."
)

Brand.create(
  name: "Cyril R. Salter",
  description: "Cyril R. Salter is a family run shaving business based near London in the UK. Cyril R. Salter offer their own brand of luxury shaving cream, shaving bowls, shaving stands and other shaving products as well as supplying the industry with other well known and respected shaving brands including Taylor of Old Bond Street and Dovo."
)

Brand.create(
  name: "Proraso",
  description: "Behind the doors of Ludovico Martelli's factory came the first production of Proraso. Since that date until now the Proraso line has become internationally recognized as, 'simply the best'. These are products that embody the tradition and quality of Italy's oldest and most famous manufacturer of shaving products."
)

Brand.create(
  name: "Taylor of Old Bond Street",
  description: "Taylor of Old Bond Street produce some of the finest shaving soaps and shaving creams available as well as a full line in shaving accessories, aftershaves and colognes. Taylor of Old Bond Street offer a large variety of products from their signature scents including Mr Taylors, Eton College and St James to classic scents including Sandalwood, Lavender and Rose."
)

Brand.create(
  name: "D. R. Harris",
  description: "D. R. Harris & Co is one of London's oldest pharmacies. They have been based in St James's Street for over 200 years. The family-owned business holds the warrant to HRH The Prince of Wales and they are renowned for their range of high quality products for men and women. This includes soaps, colognes, bath and shaving products, skin care and aromatherapy oils. A large number of D. R. Harris products are still produced using traditional methods in their own premises in London."
)

Product.delete_all

Product.create(
  title: "Merkur Classic Open Comb 15C Safety Razor Chrome",
  description: "Merkur Classic Open Comb 15C safety razor in chrome finish. This is a classic Merkur safety razor with a 3-piece lightweight design. The open comb is especially suited to a heavy beard. Supplied with one Merkur razor blade.",
  price: 25.50,
  category_id: 1,
  brand_id: 1
)

Product.create(
  title: "Merkur Long Handle Open Comb 25C Safety Razor Chrome",
  description: "Merkur Long Handle Open Comb 25C safety razor in chrome finish. The 25C features a similar 3-piece light weight design to the 15C but features a longer handle. The open comb makes the razor suitable for heavy beard types. Supplied with one Merkur razor blade.",
  price: 27.80,
  category_id: 1,
  brand_id: 1
)

Product.create(
  title: "Merkur Classic 33C Safety Razor Chrome",
  description: "Merkur Classic 33C safety razor with chrome finish. This is the classic Merkur safety razor and one of the more popular designs available. Supplied with one Merkur razor blade.",
  price: 32.00,
  category_id: 1,
  brand_id: 1
)

Product.create(
  title: "Merkur HD 34C Safety Razor Chrome",
  description: "Merkur HD 34C safety razor in chrome. The famous Merkur classic HD (Heavy Duty) safety razor is know for both it's performance and simplicity. The short handle and weighted head offer perfect balance and are one of the reasons this razor is recommended so highly to beginners and experts alike. Supplied with one Merkur razor blade.",
  price: 29.90,
  category_id: 1,
  brand_id: 1
)

Product.create(
  title: "Merkur HD Barber Pole 38C Safety Razor Chrome",
  description: "Merkur HD 38C Barber Pole safety razor. The barber pole 38C safety razor is a longer handled version of the Merkur HD 34C. Built to the same high quality as the 34C the additional length alters the weight and balance of the razor.",
  price: 25.50,
  category_id: 1,
  brand_id: 1
)

Product.create(
  title: "Merkur Futur Safety Razor Chrome",
  description: "Merkur Futur safety razor in chrome finish. The Merkur Futur is a heavyweight safety razor. Beautifully balanced - this stylish modern razor is also adjustable allowing you to set the blade exposure to your exact taste. Ideal for those with sensitive or normal skin. Supplied with one Merkur razor blade.",
  price: 33.20,
  category_id: 1,
  brand_id: 1
)

PaymentMethod.delete_all
PaymentMethod.create(name: "Swedbank")
PaymentMethod.create(name: "SEB")
PaymentMethod.create(name: "Sampo Pank")

DeliveryMethod.delete_all
DeliveryMethod.create(name: "SmartPost")
DeliveryMethod.create(name: "Free Delivery (Tallinn)")
DeliveryMethod.create(name: "Self Pick-Up")