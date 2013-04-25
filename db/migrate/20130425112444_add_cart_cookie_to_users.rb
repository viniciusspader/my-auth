class AddCartCookieToUsers < ActiveRecord::Migration
  def change
    add_column :users, :cart_cookie, :string
  end
end
