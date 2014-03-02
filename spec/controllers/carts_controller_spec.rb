require 'spec_helper'

describe CartsController do
  let!(:cart) { Cart.create! }
  
  describe "Delete Destroy Cart" do
    it "should delete and decrease count" do 
      expect do
        session[:cart_id]=cart.id
        delete :destroy, id: cart
      end.to change(Cart, :count).by(-1)
    end

    it "redirects to store#index" do 
      delete :destroy, id: cart
      response.should redirect_to store_url
    end
  end
end
