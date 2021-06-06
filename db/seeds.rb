

4.times do |n|
  User.create!(
    name: "guest#{n}",
    email: "guest#{n}@guest.com",
    password: "123qwe",
    password_confirmation: "123qwe",
    admin: false
  )
end

User.create!(
  name: "admin-guest",
  email: "admin-guest@admin-guest.com",
  password: "123qwe",
  password_confirmation: "123qwe",
  admin: true
)

5.times do |n|
  Article.create!(
    title: "US-China tensions: Biden signs executive order expanding Trump-era ban on investments in some Chinese companies",
    link: "https://edition.cnn.com/2021/06/03/economy/biden-china-executive-order/index.html",
    image: "https://img-s-msn-com.akamaized.net/tenant/amp/entityid/BB1dXnyl.img?h=315&w=600&m=6&q=60&o=t&l=f&f=jpg&x=563&y=254",
    user_id: n+1
  )
end

5.times do |n|
  Comment.create!(
    article_id: 5,
    content: "コメント#{n}",
  )
end

5.times do |n|
  Favorite.create!(
    user_id: n+1,
    article_id: n+1
  )
end
