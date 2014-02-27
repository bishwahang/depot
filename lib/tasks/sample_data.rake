namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    Product.create(:title => 'Web Design for Developers',
    :description => 
      %{<p>
          <em>Web Design for Developers</em> will show you how to make your
          web-based application look professionally designed. We'll help you
          learn how to pick the right colors and fonts, avoid costly interface
          and accessibility mistakes -- your application will really come alive.
          We'll also walk you through some common Photoshop and CSS techniques
          and work through a web site redesign, taking a new design from concept
          all the way to implementation.
        </p>},
    :image_url =>   'wd4d.jpg',    
    :price => 42.95)
    5.times do |n|
      title = Faker::Lorem.sentence(9)
      description = %{<p>#{Faker::Lorem.paragraph}</p>}
      image_url = "image#{n+1}.jpg"
      price = rand(0.01..99999999).round(2)
      Product.create!(:title => title,
      :description =>description,
      :image_url =>image_url,    
      :price =>price)
    end
  end
end