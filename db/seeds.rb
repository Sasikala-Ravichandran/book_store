# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Author.create!(first_name: "David", last_name: "Hasson")
Author.create!(first_name: "Jack", last_name: "Doe")
Author.create!(first_name: "John", last_name: "Walcher")
Author.create!(first_name: "Emanuel", last_name: "Plant")
Author.create!(first_name: "Mike", last_name: "Mitt")
Author.create!(first_name: "Andrew", last_name: "Maci")
Author.create!(first_name: "Apple", last_name: "Child")
Author.create!(first_name: "Greg", last_name: "Jordan")
Author.create!(first_name: "Livingston", last_name: "Obx")

Publisher.create!([
  { name: "Wiley" },
  { name: "PeachPit" },
  { name: "Addison Wiley" },
  { name: "McGraw-Hill" },
  { name: "Bakshi Publication" }
  ])  

Book.create!(title: "Book1", isbn: "983-12-098-345-123566", page_count: 345,
              price: 34.99, description: "A book on books", published_at: "2013-3-23",
              publisher_id: 2, 
              book_cover: File.open(File.join(Rails.root, 'app/assets/images/cover1.jpg')))

Book.create!(title: "Book2", isbn: "983-12-098-345-123566", page_count: 700,
              price: 43.99, description: "A book on books", published_at: "2013-3-23",
              publisher_id: 4, 
              book_cover: File.open(File.join(Rails.root, 'app/assets/images/cover1.jpg')))

Book.create!(title: "Book3", isbn: "983-12-098-345-123566", page_count: 1345,
              price: 134.99, description: "A book on books", published_at: "2013-3-23",
              publisher_id: 3, 
              book_cover: File.open(File.join(Rails.root, 'app/assets/images/cover1.jpg')))

Book.create!(title: "Book4", isbn: "983-12-098-345-123566", page_count: 745,
              price: 334.99, description: "A book on books", published_at: "2013-3-23",
              publisher_id: 1, 
              book_cover: File.open(File.join(Rails.root, 'app/assets/images/cover1.jpg')))