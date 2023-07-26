# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"
puts "deleting messages"
Message.destroy_all
puts "deleting chatrooms"
Chatroom.destroy_all

if (Chatroom.first.present?)
  puts "failed to delete chatrooms"
else
  puts "deleted succesfyully"
end
puts "deleting reviews"
Review.destroy_all
puts "deleting profiles"
Profile.destroy_all

puts "deleting users"
User.destroy_all
puts User.all
puts "deleted users"

puts "creating 3 users"

# user1 = User.create(email: "test1@test.com", password: "123456", nickname: "Zoe", admin: true)

# user2 = User.create(email: "test2@test.com", password: "123456", nickname: "Rory", admin: false)

# user3 = User.create(email: "test3@test.com", password: "123456", nickname: "Orla", admin: false)


# file1 = URI.open("https://res.cloudinary.com/dfipoufmj/image/upload/v1683107312/pexels-buro-millennial-1438075_ob6gjy.jpg")
# user1.photo.attach(io: file1, filename: "nes.png", content_type: "image/png")
# user1.save!

# file2 = URI.open("https://res.cloudinary.com/dfipoufmj/image/upload/v1683107312/pexels-buro-millennial-1438075_ob6gjy.jpg")
# user2.photo.attach(io: file2, filename: "nes.png", content_type: "image/png")
# user2.save!

# file3 = URI.open("https://res.cloudinary.com/dfipoufmj/image/upload/v1683107312/pexels-buro-millennial-1438075_ob6gjy.jpg")
# user3.photo.attach(io: file3, filename: "nes.png", content_type: "image/png")
# user3.save!

# puts "creating 3 profiles"


# profile1 = Profile.create(name: "John",
#                           hours: "9-5",
#                           title: "Lawyer",
#                           how: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
#                           why: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
#                           what: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
#                           advice: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
#                           user_id: user1.id,
#                           address: "London, UK")

# if profile1.present?
#   puts "created a profile"
# end

# file4 = URI.open("https://res.cloudinary.com/dfipoufmj/image/upload/v1682014739/pexels-marcin-dampc-1684187_fsnjod.jpg")
# profile1.photo.attach(io: file4, filename: "nes.png", content_type: "image/png")
# profile1.save!

# profile2 = Profile.create(name: "Mike",
#                           hours: "9-5",
#                           title: "Nomad",
#                           how: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
#                           why: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
#                           what: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
#                           advice: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
#                           user_id: user2.id,
#                           address: "Paris, France")
# if profile2.present?
#   puts "created a profile"
# end

# file5 = URI.open("https://res.cloudinary.com/dfipoufmj/image/upload/v1682014739/pexels-marcin-dampc-1684187_fsnjod.jpg")
# profile2.photo.attach(io: file5, filename: "nes.png", content_type: "image/png")
# profile2.save!

# profile3 = Profile.create(name: "Sam",
#                           hours: "Shift",
#                           title: "Doctor",
#                           how: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
#                           why: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
#                           what: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
#                           advice: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
#                           user_id: user3.id,
#                           address: "Sydney, Australia")
# if profile3.present?
#   puts "created a profile"
# end

# file6 = URI.open("https://res.cloudinary.com/dfipoufmj/image/upload/v1682014739/pexels-marcin-dampc-1684187_fsnjod.jpg")
# profile3.photo.attach(io: file6, filename: "nes.png", content_type: "image/png")
# profile3.save!

job_categories = ["Administration and Management",
                  "Animals,
                  Land and Environment",
                  "Art and Design",
                  "Arts,
                  Social Sciences and Languages",
                  "Buying,
                  Selling and Related Work",
                  "Communications and Media",
                  "Computing and ICT",
                  "Construction",
                  "Engineering",
                  "Finance",
                  "Garage Services",
                  "Hairdressing,
                  Beauty and Wellbeing",
                  "Health and Medicine",
                  "Hospitality,
                  Leisure and Tourism",
                  "Housing,
                  Property and Facilities",
                  "Information,
                  Culture and Heritage",
                  "Law",
                  "Manufacturing Industries",
                  "Performing Arts",
                  "Personal and General Services",
                  "Science and Mathematics",
                  "Social,
                  Caring and Advisory Services",
                  "Sport",
                  "Teaching and Classroom Support",
                  "Transport and Distribution",
                  "Uniformed and Security Services",
                  "Personal Development"]
