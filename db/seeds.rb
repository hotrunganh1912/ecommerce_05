# Category.delete_all
Categorie.create! name:"Book"
Categorie.create! name:"Phone"
Categorie.create! name:"Car"
Categorie.create! name:"Laptop"

# Product.delete_all
Product.create!(categorie_id: 3,
                name:"car",
                description_sort:"car",
                description_long:"new",
                name_image:"1",
                color:"red",
                price_in:"30000",
                price_out:"30000",
                price_sale:"0",
                new:"true",
                quantity: 1,
                trend:"false")

20.times do |n|
  name = "car-#{n+1}"
  image = "car#{n+1}"
  Product.create!(categorie_id: 3,
                name: name,
                description_sort:"car",
                description_long:"new",
                name_image: image,
                color:"red",
                price_in:30000,
                price_out:30000,
                price_sale:0,
                new:"true",
                quantity: 1,
                trend:"false")
end

20.times do |c|
  Product.create!(categorie_id: 1,
                name: "Book-#{c+1}",
                description_sort:"Book",
                description_long:"new",
                name_image: "Book#{c+1}",
                color:"red",
                price_in:30000 + c,
                price_sale:10,
                price_out:30000 * 10 / 100,
                new:"true",
                quantity: 1,
                trend:"false")
end

20.times do |d|
  Product.create!(categorie_id: 1,
                name: "samsung galaxy S#{d+1}",
                description_sort:"samsung phone",
                description_long:"new",
                name_image: "samsung phone#{d+1}",
                color:"red",
                price_in:1000 + d,
                price_sale:10,
                price_out:1000 * 10 / 100,
                new:"true",
                quantity: 1,
                trend:"false")
end
