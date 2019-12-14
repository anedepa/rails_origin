


10.times do |i|
  Article.create(title: "by seed#{i+1}", img_name: "by seed i-name #{i+1}", contents: "by seed con #{i+1}")
end

articles = Article.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  articles.each { |article| article.coments.create!(content: content) }
end
