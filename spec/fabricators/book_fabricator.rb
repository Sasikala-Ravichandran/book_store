Fabricator(:book) do
  title { Faker::Book.title }
  isbn { Faker::Code.isbn }
  description { Faker::Lorem.paragraph }
  published_at 1.year.ago
  publisher
  page_count { Faker::Number.number(4) }
  price{  Faker::Commerce.price }
  
end