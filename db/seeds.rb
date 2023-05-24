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
      email: 'test@gmail.com',
      password: '00000000',
      first_name: '有希',
      last_name:  '西本',
      first_name_kana: 'ユウキ',
      last_name_kana: 'ニシモト',
      phone_number: '09011110000',
      postal_code: '0009999',
      address: '滋賀県大津市におの浜1-1-1-1-1'
    }
  ]
)

10.times do |n|
  Customer.create!(
    email: "customer#{n}@gmail.com",
    password: "000000",
    first_name: "test#{n}",
    last_name:  "customer",
    first_name_kana: 'マー',
    last_name_kana: 'カスタ',
    phone_number: "09011110000",
    postal_code: "0009999",
    address: "滋賀県大津市におの浜1-1-1-1-1"
  )
end

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
    {
      name: "ケーキ",
      is_active: true
    },
    {
      name: "焼き菓子",
      is_active: true
    },
    {
      name: "プリン",
      is_active: true
    },
    {
      name: "キャンディ",
      is_active: true
    }
  ]
)

item = Item.create!(
  name: "イチゴミルフィーユ",
  description: "サクサクのパイ生地にフレッシュなイチゴを挟んだミルフィーユ。おあがりよ！",
  genre_id: 1,
  price: 1100
)
item.image.attach(io: File.open(Rails.root.join('db/samples/sample1.png')), filename: 'sample1.png')

item = Item.create!(
  name: "マリトッツォ",
  description: "今はどこに行ってしまったんだろう。おいしいんだけどなあ。",
  genre_id: 2,
  price: 1000
)
item.image.attach(io: File.open(Rails.root.join('db/samples/sample2.png')), filename: 'sample2.png')

item = Item.create!(
  name: "フォンダンショコラ",
  description: "中からトロッとチョコレート。たぶん500Wで30秒。",
  genre_id: 1,
  price: 2500
)
item.image.attach(io: File.open(Rails.root.join('db/samples/sample3.png')), filename: 'sample3.png')

item = Item.create!(
  name: "チョコムース",
  description: "チョコレートムース。昔見た映画でちょっとトラウマ。",
  genre_id: 1,
  price: 500
)
item.image.attach(io: File.open(Rails.root.join('db/samples/sample4.png')), filename: 'sample4.png')

item = Item.create!(
  name: "パンナコッタ",
  description: "／(^o^)＼ﾅﾝﾃｺｯﾀｲ",
  genre_id: 3,
  price: 300
)
item.image.attach(io: File.open(Rails.root.join('db/samples/sample5.png')), filename: 'sample5.png')

item = Item.create!(
  name: "フロランタン",
  description: "サクサクで語感がいい。バターいっぱいのがおいしいよね。",
  genre_id: 2,
  price: 250
)
item.image.attach(io: File.open(Rails.root.join('db/samples/sample6.png')), filename: 'sample6.png')

item = Item.create!(
  name: "月餅",
  description: "台湾のやつだと思う。あんまり食べたことはない。お祝い事で食べそう。",
  genre_id: 2,
  price: 500
)
item.image.attach(io: File.open(Rails.root.join('db/samples/sample7.png')), filename: 'sample7.png')

item = Item.create!(
  name: "マンゴープリン",
  description: "こんなんまずいわけがない。",
  genre_id: 3,
  price: 100
)
item.image.attach(io: File.open(Rails.root.join('db/samples/sample8.png')), filename: 'sample8.png')

item = Item.create!(
  name: "プリン",
  description: "ぷっちんできないけどおいしいです。",
  genre_id: 3,
  price: 600
)
item.image.attach(io: File.open(Rails.root.join('db/samples/sample9.png')), filename: 'sample9.png')

item = Item.create!(
  name: "タイ焼きパフェ",
  description: "ちょっとグロい。けど考えた人は天才だよ。",
  genre_id: 1,
  price: 1500
)
item.image.attach(io: File.open(Rails.root.join('db/samples/sample10.png')), filename: 'sample10.png')

item = Item.create!(
  name: "バター飴",
  description: "こういうのでいいんだよ。前の職場で一生舐めてた。",
  genre_id: 4,
  price: 6000
)
item.image.attach(io: File.open(Rails.root.join('db/samples/sample11.png')), filename: 'sample11.png')

item = Item.create!(
  name: "グラブジャムン",
  description: "甘い甘い甘い甘い甘い甘い甘い甘い甘い甘い甘い甘い甘い甘い甘い甘い甘い甘い",
  genre_id: 1,
  price: 700
)
item.image.attach(io: File.open(Rails.root.join('db/samples/sample12.png')), filename: 'sample12.png')


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

Order.create!(
  [
    {
      customer_id: 1,
      payment_method: 1,
      total_cost: 4320,
      shipping_cost: 800,
      postal_code: "5200801",
      address: "sigaken otusi nionohama",
      name: "西本有希"
    }
  ]
)

OrderDetail.create!(
  [
    {
      order_id: 1,
      item_id: 1,
      price: 1210,
      quantity: 2,
      making_status: 0
    },
    {
      order_id: 1,
      item_id: 2,
      price: 1100,
      quantity: 1,
      making_status: 0
    }
  ]
)