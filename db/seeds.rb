# db/seeds.rb
require 'open-uri'
# destroy all users
User.destroy_all
puts "Destroyed all users"
# Create users

users = [
  { first_name: 'Mrinal', last_name: 'Verma', email: 'mrinalverma1993@gmail.com', password: '123123', address: 'The Hague' },
  { first_name: 'Thomas', last_name: 'Bruins', email: 'thomas.bruins12@gmail.com', password: '123123', address: 'Amsterdam' },
  { first_name: 'Carlijn', last_name: 'Driessen', email: 'carlijndriessen.dev@gmail.com', password: '123123', address: 'Limburg' },
  { first_name: 'Daniel', last_name: 'Suarez', email: 'ndanielmnv@gmail.com', password: '123123', address: 'Rotterdam' }
]

created_users = users.map { |user| User.create!(user) }

# Define listings
listings_data = [
  {
    title: 'Pottery Basics',
    category: 'Arts & Crafts',
    description: 'Dive into the world of pottery in this immersive beginner-friendly workshop. You’ll learn how to shape, glaze, and fire your own pieces to create something truly unique that you can be proud of. A perfect blend of creativity and mindfulness awaits you.',
    price: 50.0,
    images: [
      'https://plus.unsplash.com/premium_photo-1683121107354-804160f78eb8?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8cG90dGVyeXxlbnwwfHwwfHx8MA%3D%3D',
      'https://artincontext.org/wp-content/uploads/2023/05/What-is-Pottery-768x512.jpg',
      'https://thumbs.dreamstime.com/b/pottery-throwing-session-amidst-blooming-flowers-tranquil-garden-generative-ai-hands-expertly-shape-clay-bowl-356282970.jpg'
    ]
  },
  {
    title: 'Sourdough Bread Baking',
    category: 'Cooking',
    description: 'Join us for a hands-on sourdough workshop where you’ll learn to mix, ferment, and bake the perfect loaf. Understand the science behind sourdough and take home your own starter, so you can continue baking at home with confidence.',
    price: 60.0,
    images: [
      'https://www.farmhouseonboone.com/wp-content/uploads/2023/04/sourdough-for-beginners-27-scaled.jpg',
      'https://thefeatherednester.com/wp-content/uploads/2020/04/overnight-sourdough-bread.jpg',
      'https://ichef.bbci.co.uk/food/ic/food_16x9_1600/recipes/classic_sourdough_21029_16x9.jpg'
    ]
  },
  {
    title: 'Yoga for Beginners',
    category: 'Wellness',
    description: 'This gentle yoga class is designed to help you build strength, flexibility, and inner calm. Discover the foundational poses, breathwork, and mindfulness techniques to start your yoga journey on the right foot. Suitable for all levels.',
    price: 30.0,
    images: [
      'https://hips.hearstapps.com/hmg-prod/images/female-instructor-with-yoga-class-in-the-gym-royalty-free-image-700718696-1561407106.jpg',
      'https://inspireyoga.com/wp-content/uploads/2021/02/InspireYogaGV-032019_PRT-25-scaled.jpg',
      'https://images.squarespace-cdn.com/content/v1/61f7e7b2a3feff07fcdb6e0c/7f5eeaed-ff23-4c43-9367-69073ca654fd/JPCY22_asana-48.jpg'
    ]
  },
  {
    title: 'DIY Home Decor',
    category: 'Arts & Crafts',
    description: 'Transform your living space with this creative home decor workshop. Learn how to design and craft personalized decor pieces, from wall art to upcycled furniture, that reflect your unique style and flair. Get ready to roll up your sleeves!',
    price: 45.0,
    images: [
      'https://www.elephantstock.com/cdn/shop/articles/15-super-cool-diy-home-decor-ideas.jpg?v=1737994457',
      'https://miro.medium.com/v2/resize:fit:1000/1*2Lkv7QwyGil77VG5u0q21Q.jpeg',
      'https://static01.nyt.com/images/2021/02/28/realestate/26diyextra-slide-EVOY/26diyextra-slide-EVOY-superJumbo.jpg'
    ]
  },
  {
    title: 'Watercolor Painting',
    category: 'Arts & Crafts',
    description: 'Explore the expressive world of watercolor in this beginner-friendly class. Master color blending, layering techniques, and brush control to bring your own stunning compositions to life. Take home your original artwork and a newfound love for painting.',
    price: 55.0,
    images: [
      'https://shop.emilylex.com/cdn/shop/products/I8gPkvBRXqDjVGADkmC8_fruit.jpg?v=1714015839&width=1445',
      'https://s3-ap-southeast-2.amazonaws.com/ish-oncourse-scc/c5c28551-ca27-4aa5-ae4b-7549c90ec6de?versionId=OBxlAOz_WTMyy3WyINZ0qYnDbW.He7QY',
      'https://vac3.sgp1.digitaloceanspaces.com/wp-content/uploads/2019/06/11095020/Watercolour-Classes-in-Singapore-05-1024x758.png'
    ]
  },
  {
    title: 'Italian Pasta Making',
    category: 'Cooking',
    description: 'Immerse yourself in the flavors of Italy as you learn to make fresh pasta from scratch. Under the guidance of our expert chef, you’ll craft perfect pasta dough, shape it into traditional styles, and prepare delicious sauces. Buon appetito!',
    price: 70.0,
    images: [
      'https://giovannis-knutsford.co.uk/wp-content/uploads/2023/05/Italian-Pasta.jpg',
      'https://www.marthastewart.com/thmb/om3sU5xE8s06y-0GUKqASJGLAhI=/750x0/filters:no_upscale():max_bytes(150000):strip_icc()/cacio-e-pepe-opener-mld109436_horiz-1222-425e28fdf7d4403abe05b1f6ab24d106.jpg',
      'https://www.favfamilyrecipes.com/wp-content/uploads/2025/02/Nicks-Authentic-Italian-Spaghetti-ingredients.jpg'
    ]
  },
  {
    title: 'Salsa Dancing',
    category: 'Dance',
    description: 'Get ready to move and groove in this lively salsa class. Learn the basic steps, turns, and footwork while feeling the rhythm of the music. By the end, you’ll be ready to hit the dance floor with confidence and style.',
    price: 40.0,
    images: [
      'https://res.cloudinary.com/hz3gmuqw6/image/upload/c_fill,f_auto,q_60,w_750/v1/goldenapron/62321f5b3f382',
      'https://waterfrontparkseattle.org/wp-content/uploads/2022/07/2021-08-31_HL_DancingtilDusk_WebRes_AdamLu_HO3C1249-1440x960.jpg',
      'https://obby.co.uk/blog/content/images/2021/10/c870x524.jpeg'
    ]
  },
  {
    title: 'Digital Photography Basics',
    category: 'Photography',
    description: 'Unlock the potential of your digital camera with this comprehensive beginner’s class. Learn the fundamentals of composition, lighting, and camera settings to take professional-quality photos. Bring your creativity and leave with a portfolio of great shots.',
    price: 65.0,
    images: [
      'https://meganalter.com/wp-content/uploads/Basics-In-Amsterdam-1.png',
      'https://media.greatbigphotographyworld.com/wp-content/uploads/2021/10/beginner-photography-course-girl-camera-scaled.jpg',
      'https://mymodernmet.com/wp/wp-content/uploads/2020/02/online-photography-classes-thumbnail.jpg'
    ]
  },
  {
    title: 'Creative Writing Workshop',
    category: 'Writing',
    description: 'Unleash your inner author in this engaging creative writing session. Learn to develop compelling characters, craft engaging plots, and find your unique writing voice. Whether you’re a beginner or looking to hone your skills, this class is for you.',
    price: 35.0,
    images: [
      'https://cdn.prod.website-files.com/6703c45d648fece612410ecf/6720da7e50f3a8c9055ca504_green_chameleon_s9_CC_2_S_Ky_SJM_unsplash_2f56bedbc5.webp',
      'https://marvel-b1-cdn.bc0a.com/f00000000246364/olemiss.edu/programs/libarts/bachelor-fine-arts-creative-writing/assets/bfa-in-creative-writing-hero.jpg',
      'https://krieger.jhu.edu/writingseminars/wp-content/uploads/sites/34/2024/03/Writings-sems-2.jpg'
    ]
  },
  {
    title: 'Cocktail Masterclass',
    category: 'Beverages',
    description: 'Shake, stir, and sip your way through this fun cocktail-making workshop. Learn the secrets behind classic cocktails and modern mixology techniques from a seasoned bartender. Enjoy a curated selection of drinks you can recreate at home.',
    price: 50.0,
    images: [
      'https://cookingclassbkk.com/wp-content/uploads/2025/01/cocktail-masterclass.jpg',
      'https://www.xtremeevents.co.uk/wp-content/uploads/2019/04/cocktail-masterclass-thumb-min.jpg',
      'https://offloadmedia.feverup.com/secretldn.com/wp-content/uploads/2023/06/25122616/290432352_355933403164307_4661222174655465959_n-e1686222023568-1024x770.jpg'
    ]
  }
]


listings_data.each do |listing_data|
  listing = Listing.new(
    title: listing_data[:title],
    category: listing_data[:category],
    description: listing_data[:description],
    price: listing_data[:price],
    active: true,
    user: created_users.sample
  )

  listing_data[:images].each_with_index do |image_url, index|
    file = URI.open(image_url)
    listing.photos.attach(io: file, filename: "listing_#{listing.id}_image_#{index + 1}.jpg", content_type: 'image/jpeg')
  end

  listing.save!
end


puts "4 users and 10 listings created and linked!"
