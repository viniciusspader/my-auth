ActiveAdmin.register User do

  config.sort_order = "id_asc"

  index do
    column :id
    column :email do |user|
      link_to user.email, admin_user_path(user)
    end
    column :role

    column :actions do |resource|
      links = ''.html_safe
      if controller.action_methods.include?('edit')
        links << link_to(I18n.t('active_admin.edit'), edit_resource_path(resource), :class => "member_link edit_link")
      end
      if controller.action_methods.include?('destroy')
        links << link_to(I18n.t('active_admin.delete'), resource_path(resource), :method => :delete, :data => {:confirm => I18n.t('active_admin.delete_confirmation')}, :class => "member_link delete_link")
      end
      links
    end

  end

  filter :id
  filter :email
  filter :role, :as => :check_boxes, :collection => proc { User.all }

  show :title => :email do
    panel "User" do

    end
  end


end
