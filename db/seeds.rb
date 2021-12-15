# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#管理者
Admin.create!(
  email: 'admin@dmin',
  password: 'adminadmin'
)

#会員
15.times do |n|
  Customer.create!(
    email:"hanako#{n + 1}@test.com",
    password:"111111",
    last_name: "山田",
    first_name: "花子#{n + 1}",
    last_name_kana: "ヤマダ",
    first_name_kana: "ハナコ",
    address: "東京都渋谷区ちぇるちぇるランド",
    postal_code: "0000000",
    phone_number: "09012345678"
  )
end

#配送先
Deliverie.create!(
  customer_id: 1,
  name: "山田一郎",
  address: "東京都渋谷区こりん星",
  postal_code: "1111111"
)

#ジャンル
Genre.create!(
  name:"ケーキ")

Genre.create!(
  name:"キャンディ")

Gnere.create!(
  name:"焼き菓子")

Gnere.create!(
  name:"プリン")

#商品

Product.create!(
  genre_id: 1,
  name:"チョコレートケーキ",
  detail:"ベルギー産高級チョコレートと北海道産生クリームを使用した、食べ応えのある生チョコケーキです。",
  image: File.open("#{Rails.root}/app/assets/images/chocolate_cake.jpeg"),
  is_active: true,
  tax_excluded_price: 3500
)

Product.create!(
  genre_id: 1,
  name:"ショートケーキ（6ヶ入）",
  detail:"可愛いミニサイズのカップケーキ。お洒落なカップケーキが女子会の主役に♪",
  image: File.open("#{Rails.root}/app/assets/images/cupcake.jpg"),
  is_active: true,
  tax_excluded_price: 1500
)


Product.create!(
  genre_id: 2,
  name:"カラフルキャンディー（12ヶ入）",
  detail:"味はソーダ、イチゴ、オレンジ、メロンの4種類です。",
  image: File.open("#{Rails.root}/app/assets/images/candy.jpeg"),
  is_active: true,
  tax_excluded_price: 200
)

Product.create!(
  genre_id: 3,
  name:"マカロン（5ヶ入）",
  detail:"「今まで食べた中で1番です！」とリピーターさん続出のクリオロのマカロン。",
  image: File.open("#{Rails.root}/app/assets/images/makaron.jpg"),
  is_active: true,
  tax_excluded_price: 1000
)

Product.create!(
  genre_id: 4,
  name:"キャラメルプリン",
  detail:"生クリームとキャラメルが重なりあう、コク深い風味のプリンです。",
  image: File.open("#{Rails.root}/app/assets/images/pudding.jpg"),
  is_active: true,
  tax_excluded_price: 250
)

#カート商品
15.times do |n|
  CarProduct.create!(
    customer_id: 15 - n,
    product_id: 1,
    quantity:2
  )

  #注文
  Order.create!(
    customer_id: 15 - n,
    postage: 800,
    name: "山田花子",
    address: "東京都渋谷区ちぇるちぇるランド",
    postal_code: "0000000",
    total_price: "2500",
    payment_method: 0,
    status: 4,
    created_at: (15 - n).day.ago
  )
end