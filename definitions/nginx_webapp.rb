define :nginx_webapp, :template => "nginx_webapp.conf.erb", :enable => true do

  application_name = params[:name]

  template "#{node[:nginx][:dir]}/sites-available/#{application_name}" do
    source params[:template]
    owner "root"
    group "root"
    mode 0644
    if params[:cookbook]
      cookbook params[:cookbook]
    end
    variables(
      :application_name => application_name,
      :params => params
    )
    if ::File.exists?("#{node[:nginx][:dir]}/sites-enabled/#{application_name}.conf")
      notifies :reload, resources(:service => "nginx"), :delayed
    end
  end

  nginx_site "#{params[:name]}" do
    enable params[:enable]
  end
end