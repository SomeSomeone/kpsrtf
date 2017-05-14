workers 2

threads 1, 6

app_dir = File.expand_path("../..", __FILE__)
shared_dir = "/home/hm/web/yourhm.com.ua/kpsrtf/shared"

rails_env = ENV['RAILS_ENV'] || "production"
environment rails_env

bind "unix:///home/hm/web/yourhm.com.ua/kpsrtf/shared/sockets/puma.sock"

stdout_redirect "/home/hm/web/yourhm.com.ua/kpsrtf/log/puma.stdout.log", "/home/hm/web/yourhm.com.ua/kpsrtf/log/puma.stderr.log", true

pidfile "/home/hm/web/yourhm.com.ua/kpsrtf/shared/pids/puma.pid"
state_path "/home/hm/web/yourhm.com.ua/kpsrtf/shared/pids/puma.state"
activate_control_app

on_worker_boot do
  require "active_record"
  ActiveRecord::Base.connection.disconnect! rescue ActiveRecord::ConnectionNotEstablished
  ActiveRecord::Base.establish_connection(YAML.load_file("/home/hm/web/yourhm.com.ua/kpsrtf/config/database.yml")[rails_env])
end
