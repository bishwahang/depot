require 'spec_helper'

describe Product do
  before do
    @product=FactoryGirl.build(:product)
  end
  subject { @product }
  it {should respond_to(:title)}
  it {should respond_to(:description)}
  it {should respond_to(:image_url)}
  it {should respond_to(:price)}
  it { should be_valid }
  describe "when title is not present" do
    before { @product.title=" "}
    it { should_not be_valid}
  end

  describe "when description is not given" do
    before {@product.description = " "}
    it {should_not be_valid}
  end

  describe "Product Price must be positive and greater than 0" do

    describe "when price is negative" do
      before {@product.price = -1}
      it {should_not be_valid}
    end

    describe "when price is 0" do
      before {@product.price = 0}
      it {should_not be_valid}
    end
  end

  describe "Image format must be gif|png|jpg" do
    ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg http://a.b.c/x/y/z/fred.gif }
    bad = %w{ fred.doc fred.gif/more fred.gif.more }
    
    describe "testing valid urls" do

      ok.each do |url|
        before {@product.image_url = url}
        it {should be_valid}
      end
    end
    
    describe "testing invalid urls" do
      bad.each do |url|
        before {@product.image_url = url}
        it {should_not be_valid}
      end
    end
  end
  

  describe "product title must be unique" do
    before do
      product_with_same_title = @product.dup
      product_with_same_title.save
    end
    it {should_not be_valid}
  end

  describe "finally saving the Product" do
    before do
      @product.title="New title"
    end
    it {should be_valid}
    it "should save and increase count " do
      expect { @product.save }.to change(Product, :count).by(1)
    end

  end

end
