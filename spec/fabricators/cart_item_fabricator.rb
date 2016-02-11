Fabricator(:cart_item) do
  cart #foreign key field
  book
  price { Faker::Commerce.price }
  quantity { Faker::Number.number(1) }
end