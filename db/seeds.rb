tags = %w{bliss having his cream reaper stuffed inside me again}

tags.each do |tag|
  Tag.find_or_create_by_name(name: tag)
end


10.times do  
  post = Post.create(title: Faker::Lorem.words.join(" "), body: Faker::Lorem.paragraphs.join("<br><br>"))
  rand(1..8).times do |num|
    post.tags << Tag.find(num + 1)
  end
end


