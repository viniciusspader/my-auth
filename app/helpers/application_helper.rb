module ApplicationHelper

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def link_to_cart
    cart = Piggybak::Cart.new(request.cookies['cart'])
    link_to "Carrinho (#{cart.sellables.length})", piggybak.cart_url
  end

  def cart_empty?
    cart = Piggybak::Cart.new(request.cookies['cart'])
    cart.sellables.empty?
  end

end
