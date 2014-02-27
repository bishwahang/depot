FactoryGirl.define do
  factory :product do
    title     "A brief history of Time"
    description     %{<p>Unravel the mysteries of Universe. The space,time and beyond...</p>}
    image_url "image1.jpg"
    price 99.99
  end
end