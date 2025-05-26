# db/seeds.rb

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
listings = [
  { title: 'Pottery Basics', category: 'Arts & Crafts', description: 'Dive into the world of pottery in this immersive beginner-friendly workshop. You’ll learn how to shape, glaze, and fire your own pieces to create something truly unique that you can be proud of. A perfect blend of creativity and mindfulness awaits you.', price: 50.0 },
  { title: 'Sourdough Bread Baking', category: 'Cooking', description: 'Join us for a hands-on sourdough workshop where you’ll learn to mix, ferment, and bake the perfect loaf. Understand the science behind sourdough and take home your own starter, so you can continue baking at home with confidence.', price: 60.0 },
  { title: 'Yoga for Beginners', category: 'Wellness', description: 'This gentle yoga class is designed to help you build strength, flexibility, and inner calm. Discover the foundational poses, breathwork, and mindfulness techniques to start your yoga journey on the right foot. Suitable for all levels.', price: 30.0 },
  { title: 'DIY Home Decor', category: 'Arts & Crafts', description: 'Transform your living space with this creative home decor workshop. Learn how to design and craft personalized decor pieces, from wall art to upcycled furniture, that reflect your unique style and flair. Get ready to roll up your sleeves!', price: 45.0 },
  { title: 'Watercolor Painting', category: 'Arts & Crafts', description: 'Explore the expressive world of watercolor in this beginner-friendly class. Master color blending, layering techniques, and brush control to bring your own stunning compositions to life. Take home your original artwork and a newfound love for painting.', price: 55.0 },
  { title: 'Italian Pasta Making', category: 'Cooking', description: 'Immerse yourself in the flavors of Italy as you learn to make fresh pasta from scratch. Under the guidance of our expert chef, you’ll craft perfect pasta dough, shape it into traditional styles, and prepare delicious sauces. Buon appetito!', price: 70.0 },
  { title: 'Salsa Dancing', category: 'Dance', description: 'Get ready to move and groove in this lively salsa class. Learn the basic steps, turns, and footwork while feeling the rhythm of the music. By the end, you’ll be ready to hit the dance floor with confidence and style.', price: 40.0 },
  { title: 'Digital Photography Basics', category: 'Photography', description: 'Unlock the potential of your digital camera with this comprehensive beginner’s class. Learn the fundamentals of composition, lighting, and camera settings to take professional-quality photos. Bring your creativity and leave with a portfolio of great shots.', price: 65.0 },
  { title: 'Creative Writing Workshop', category: 'Writing', description: 'Unleash your inner author in this engaging creative writing session. Learn to develop compelling characters, craft engaging plots, and find your unique writing voice. Whether you’re a beginner or looking to hone your skills, this class is for you.', price: 35.0 },
  { title: 'Cocktail Masterclass', category: 'Beverages', description: 'Shake, stir, and sip your way through this fun cocktail-making workshop. Learn the secrets behind classic cocktails and modern mixology techniques from a seasoned bartender. Enjoy a curated selection of drinks you can recreate at home.', price: 50.0 },
  { title: 'Herbal Tea Blending', category: 'Wellness', description: 'Discover the art of blending your own herbal teas using fresh, organic ingredients. Learn about the health benefits of various herbs and create personalized blends to take home. Perfect for tea lovers seeking relaxation and creativity.', price: 25.0 },
  { title: 'DIY Candle Making', category: 'Arts & Crafts', description: 'Craft your own beautiful, fragrant candles in this hands-on workshop. Learn the essentials of wax melting, fragrance blending, and wick placement. Create candles that make perfect gifts or add a cozy glow to your space.', price: 40.0 },
  { title: 'Advanced Pottery Techniques', category: 'Arts & Crafts', description: 'Take your pottery skills to the next level with this advanced class. Learn complex hand-building and wheel techniques, experiment with unique glazing methods, and create intricate pieces that showcase your talent and creativity.', price: 75.0 },
  { title: 'Photography: Portraits', category: 'Photography', description: 'Master the art of portrait photography with natural light in this immersive workshop. Learn how to work with your subject, set up the perfect shot, and capture the essence of personality through your lens. A must for aspiring photographers.', price: 70.0 },
  { title: 'Street Food Secrets', category: 'Cooking', description: 'Explore the world of street food with this dynamic cooking class. Learn to prepare authentic, flavorful street eats from around the globe. From bold spices to secret sauces, you’ll take home a wealth of delicious recipes and techniques.', price: 55.0 },
  { title: 'Jazz Guitar Basics', category: 'Music', description: 'Learn the essentials of jazz guitar in this relaxed yet focused session. From basic chords to smooth improvisation, you’ll build a strong foundation to start playing your favorite jazz tunes with confidence and flair.', price: 60.0 },
  { title: 'Woodworking Essentials', category: 'DIY', description: 'Get hands-on with woodworking in this essential skills workshop. Learn how to safely use tools, work with different types of wood, and complete a small project to take home. Perfect for those who love working with their hands.', price: 80.0 },
  { title: 'Floral Arrangement Class', category: 'Arts & Crafts', description: 'Create stunning floral arrangements that will brighten any space. Learn professional techniques for selecting and arranging flowers, from simple bouquets to elaborate centerpieces. Take home your creation and a newfound passion for florals.', price: 50.0 },
  { title: 'Cake Decorating Workshop', category: 'Cooking', description: 'Take your cakes to the next level with this fun decorating workshop. Learn piping techniques, fondant handling, and how to create show-stopping designs. Bring your sweet tooth and leave with a beautifully decorated cake!', price: 65.0 },
  { title: 'Mindfulness Meditation', category: 'Wellness', description: 'Cultivate inner peace and clarity with this guided mindfulness meditation session. Learn practical techniques to manage stress, improve focus, and connect with the present moment. Suitable for all levels, including complete beginners.', price: 20.0 }
]

listings.each do |listing|
  Listing.create!(
    title: listing[:title],
    category: listing[:category],
    description: listing[:description],
    price: listing[:price],
    active: true,
    user_id: created_users.sample.id
  )
end

puts "4 users and 20 listings created and linked!"
