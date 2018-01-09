CartedProduct.create!([
  {user_id: 1, product_id: 3, quantity: 3, status: "carted", order_id: nil}
])
Category.create!([
  {name: "Shoegaze"},
  {name: "Rock"},
  {name: "Alternative"},
  {name: "Lo-fi"}
])
CategoryProduct.create!([
  {product_id: 2, category_id: 2},
  {product_id: 3, category_id: 3},
  {product_id: 4, category_id: 4}
])
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
User.create!([
  {name: "Jane", email: "jane@gmail.com", password_digest: "$2a$10$6Uon1LiiR2gBpSLtklthWeP.6Ln4m3Nr45hLY4dOkYhLVtUqIq83S", admin: false},
  {name: "Leveon", email: "leveon@gmail.com", password_digest: "$2a$10$QlRHa7MYRBxGTvwaJZe.hOpc93.1Wf5B1hebr8Qy/zgIC89G2GkC6", admin: true},
  {name: "Dak", email: "dak@gmail.com", password_digest: "$2a$10$CHi3/41X4szlncLiqL3nLeef1P9jHJ2qfQQ5KH1REqthySAiTyQsq", admin: true},
  {name: "j", email: "j@h", password_digest: "$2a$10$VW7j1IewgN.Iik39SHf8IOvGvmqr3nDkcsCdo962V9B3TKrZ79R/u", admin: nil},
  {name: "j", email: "j@j", password_digest: "$2a$10$Kbbc/59G3MsP.AnqHI9tBOZiPN/mKyfSbmcSLl8/687HIC2tLfBza", admin: nil}
])
