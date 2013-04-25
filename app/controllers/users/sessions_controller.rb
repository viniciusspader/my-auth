class Users::SessionsController < Devise::SessionsController

  def create
    super
    if !current_user.cart_cookie.nil?
      cookies['cart'] = { value: current_user.cart_cookie, path: '/' }
    end
  end

  def destroy
    current_user.add_cart_cookie(cookies['cart'], current_user.password)
    cookies['cart'] = { value: '', path: '/' }
    super
  end
end