10.times do 
  Post.create(title: Faker::Lorem.words.join(" "), body: Faker::Lorem.paragraphs.join("<br><br>"))
end


tags = %w{bliss having his cream reaper stuffed inside me again}

tags.each do |tag|
  Tag.create(name: tag)
end
