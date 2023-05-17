# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: ENV['ADMIN_EMAIL'],
  password: ENV['ADMIN_PASS']
)

Customer.create!(
  [
    {
      email: 'yuukinishimoto1109@gmail.com',
      password: '191d423d',
      first_name: '有希',
      last_name:  '西本',
      first_name_kana: 'ユウキ',
      last_name_kana: 'ニシモト',
      phone_number: '00000000000',
      postal_code: '0009999',
      address: '滋賀県大津市におの浜1-1-1-1-1'
    }
  ]
)

Address.create!(
  [
    {
      customer_id: 1,
      name: 'YuukiNishimoto',
      postal_code: '0009999',
      address: 'adress1-1-1-1'
    }
  ]
)

Genre.create!(
  [
    {name: "ケーキ"},{name: "プリン"}
  ]
)

item = Item.create!(
  name: "sample1",
  description: "this is sample1",
  genre_id: 1,
  price: 100
)
item.image.attach(io: File.open(Rails.root.join('app/assets/images/no_image.jpg')), filename: 'sample.jpg')

item = Item.create!(
  name: "sample2",
  description: "this is sample2",
  genre_id: 2,
  price: 1100
)
item.image.attach(io: File.open(Rails.root.join('app/assets/images/no_image.jpg')), filename: 'sample.jpg')

CartItem.create!(
  [
    {
      customer_id: 1,
      item_id: 1,
      amount: 1
    },
    {
      customer_id: 1,
      item_id: 2,
      amount: 1
    }
  ]
)