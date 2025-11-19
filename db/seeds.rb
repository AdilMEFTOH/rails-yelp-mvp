# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb

puts "Nettoyage de la base de données..."
Restaurant.destroy_all
Review.destroy_all

puts "Création des restaurants..."

restaurants_data = [
  {
    name: "Dragon Palace",
    address: "56 Rue de la Soif, 75008 Paris",
    phone_number: "01 42 68 95 47",
    category: "chinese",
    reviews: [
      { rating: 4, content: "Délicieux canard laqué et nouilles sautées authentiques. Service rapide et ambiance agréable." },
      { rating: 5, content: "Meilleur restaurant chinois de Paris ! Les dim sums sont à tomber." },
      { rating: 3, content: "Correct mais un peu bruyant. Les plats sont bons mais manquent d'originalité." }
    ]
  },
  {
    name: "La Trattoria",
    address: "123 Avenue des Champs-Élysées, 75008 Paris",
    phone_number: "01 53 75 22 89",
    category: "italian",
    reviews: [
      { rating: 5, content: "Pasta maison exceptionnelle ! La carbonara est divine. Service impeccable." },
      { rating: 4, content: "Très bon restaurant italien. Les antipasti sont délicieux, seul bémol : les prix un peu élevés." },
      { rating: 2, content: "Déçu par la pizza, pâte trop épaisse. Le tiramisu était bon cependant." }
    ]
  },
  {
    name: "Sakura Sushi",
    address: "78 Boulevard Saint-Germain, 75006 Paris",
    phone_number: "01 46 33 78 54",
    category: "japanese",
    reviews: [
      { rating: 5, content: "Sushi frais et préparés avec soin. Le chef est un artiste !" },
      { rating: 4, content: "Excellent rapport qualité-prix. Les makis californiens sont délicieux." },
      { rating: 5, content: "Authentique et raffiné. Le bento du midi est une très bonne affaire." },
      { rating: 3, content: "Bon mais l'attente était longue. Les sushis valent le coup cependant." }
    ]
  },
  {
    name: "Le Bistrot Français",
    address: "45 Rue du Faubourg Saint-Honoré, 75008 Paris",
    phone_number: "01 42 65 98 32",
    category: "french",
    reviews: [
      { rating: 4, content: "Cuisson parfaite du steak frites. Sauce au poivre maison délicieuse." },
      { rating: 5, content: "Cadre typiquement parisien, plats traditionnels excellents. À recommander !" },
      { rating: 3, content: "Bonne cuisine bourgeoise mais manque un peu d'originalité. Service correct." }
    ]
  },
  {
    name: "Frites Folies",
    address: "29 Rue de la Montagne, 1000 Bruxelles",
    phone_number: "+32 2 548 76 43",
    category: "belgian",
    reviews: [
      { rating: 5, content: "Les meilleures frites de Bruxelles ! Sauce andalouse parfaite." },
      { rating: 4, content: "Cadre chaleureux, bières belges excellentes. Les moules sont délicieuses." },
      { rating: 2, content: "Trop de monde, service lent. Les frites étaient bonnes mais froides." },
      { rating: 5, content: "Authentique et convivial. La carbonnade flamande est un régal !" }
    ]
  }
]

restaurants_data.each do |restaurant_data|
  reviews_data = restaurant_data.delete(:reviews)

  restaurant = Restaurant.create!(restaurant_data)
  puts "✅ Restaurant créé : #{restaurant.name}"

  reviews_data.each do |review_data|
    restaurant.reviews.create!(review_data)
    puts "   📝 Avis créé : #{review_data[:rating]}/5"
  end
end

puts "🎉 Seed terminé ! #{Restaurant.count} restaurants et #{Review.count} avis créés."
