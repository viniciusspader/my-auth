ActiveAdmin.register_page "Dashboard" do

  controller do
  end

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    div :class => "blank_slate_container", :id => "dashboard_default_message" do
#       span :class => "blank_slate" do
#       span I18n.t("active_admin.dashboard_welcome.welcome")
#       small I18n.t("active_admin.dashboard_welcome.call_to_action")
      @users_count = User.group('DATE(created_at)').count.map do |d,c| {date: d, count: c} end.to_json
      render :partial => 'user_chart', :locals => { :users_count => @users_count }
    end
  end #content
end
