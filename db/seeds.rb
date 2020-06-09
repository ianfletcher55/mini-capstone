# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Image.create([
  { url: "https://tse3.mm.bing.net/th?id=OIP.a6-0dkr-ubmr6FWUFl7B1QHaF0&pid=Api&P=0&w=193&h=152", product_id: 2 },
  { url: "https://guitar.com/wp-content/uploads/2016/10/Guitar-Bass-October-32.jpg", product_id: 4 },
  { url: "https://tse2.explicit.bing.net/th?id=OIP.xkupKOxv7KaKBtJyVE0wEwHaHa&pid=Api&P=0&w=300&h=300", product_id: 5 },
  { url: "https://images.reverb.com/image/upload/s--U52qtw8B--/f_auto,t_supersize/v1563386499/nven9vqiznsuyzj7u6go.jpg", product_id: 10 },
  { url: "https://s3-us-west-2.amazonaws.com/static.music-man.com/website/images/headers/header-255.jpg?1585167544", product_id: 12 }
])