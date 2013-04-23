class Product < ActiveRecord::Base

  acts_as_sellable

  attr_accessible :name, :piggybak_sellable_attributes

  validates_presence_of :name

  # RailsAdmin interface configuration
  rails_admin do
    label do
      'Produtos'
    end

    list do
      sort_by :created_at

      field :id do
        sort_reverse false
      end
      field :name do
        label 'Nome do Produto'
      end
      field :created_at do
        label 'Criado em'
      end
      field :updated_at do
        label 'Atualizado em'
      end
    end

    edit do
      field :name do
        label 'Nome do Produto'
      end
      field :piggybak_sellable
    end
  end
end
