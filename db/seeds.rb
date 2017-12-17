Image.create!([
  {url: "url", name: "whatever", product_id: 3}
])
Product.create!([
  {name: "Bloom", price: "15.0", description: "Beach House", supplier_id: 2},
  {name: "Let's Dance", price: "40.0", description: "David Bowie", supplier_id: 2},
  {name: "Turn on the Bright Lights", price: "30.0", description: "Interpol", supplier_id: 3},
  {name: "What's the Story Morning Glory?", price: "20.0", description: "Oasis", supplier_id: 1},
  {name: "Teen Dream", price: "14.0", description: "Beach House", supplier_id: 1}
])
Supplier.create!([
  {name: "Rick's goods", email: "rick@gmail.com", phone_number: "333-3333"},
  {name: "Bob's", email: "bob@gmail.com", phone_number: "555-5555"},
  {name: "Linda's stuff", email: "linda@gmail.com", phone_number: "111-1111"},
  {name: nil, email: nil, phone_number: nil},
  {name: nil, email: nil, phone_number: nil}
])
