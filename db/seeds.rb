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
                price_out:"3000000000",
                price_sale:"0",
                new:"true",
                quantity: 1,
                trend:"false")

20.times do |n|
    arr1 = ["Simply contact your preferred dealer to book a test drive.
    You can discuss all the details,
    then buy direct with a full Viet Nam warranty.",
    "You can be confident of always getting fantastic value for money at our
    dealerships in Tewkesbury and Gloucester. Whether you are buying a brand
    new Peugeot."]
  description_long = arr1[rand(arr1.count)]
  arr = ["Stafe","5008","508","Triton","BMW"]
  name = arr[rand(arr.count)]
  image = "not found"
  if name == "Stafe"
    image = "car1"
    description_sort = "Satafe 2019 "
    price_out="1300000000"
  elsif name == "5008"
    image = "car3"
    description_sort = "5008 2019 "
    price_out="1340000000"
  elsif name == "508"
    image = "car4"
    description_sort = "508 2019 "
    price_out="1600000000"
  elsif name == "BMW"
    image = "car0"
    price_out="2300000000"
    description_sort = "BMW 2019 "
  elsif name == "Triton"
    description_sort = "Triton 2019 "
    image = "car2"
    price_out="854000000"
  end
  Product.create!(categorie_id: 3,
                name: name,
                description_sort: description_sort,
                description_long: description_long,
                name_image: image,
                color:"red",
                price_in:30000,
                price_out:price_out,
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
                description_sort:"samsungphone",
                description_long:"new",
                name_image: "samsungphone#{d+1}",
                color:"red",
                price_in:1000 + d,
                price_sale:10,
                price_out:1000 * 10 / 100,
                new:"true",
                quantity: 1,
                trend:"false")
end
