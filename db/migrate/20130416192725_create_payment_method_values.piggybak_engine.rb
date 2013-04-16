# This migration comes from piggybak_engine (originally 20111228235853)
class CreatePaymentMethodValues < ActiveRecord::Migration
  def change
    create_table :payment_method_values do |t|
      t.references :payment_method
      t.string :key
      t.string :value
    end
  end
end
