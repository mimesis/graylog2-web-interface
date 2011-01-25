require "#{Rails.root}/lib/livetail_server.rb"

general_config = YAML::load(File.read(Rails.root.to_s + "/config/general.yml"))
mongodb_config = YAML::load(File.read(Rails.root.to_s + "/config/mongodb.yml"))

begin
  if general_config["livetail"] and mongodb_config[Rails.env]
    livetail_config = general_config["livetail"]
    mongodb_config = mongodb_config[Rails.env]
    
    # Start server only if configured so.
    if !livetail_config.blank? and !livetail_config["enable"].blank? and livetail_config["enable"] == true
      args = {
        :mongo_host => mongodb_config["hostname"],
        :mongo_port => mongodb_config["port"],
        :mongo_database => mongodb_config["database"],
        :mongo_use_auth => mongodb_config["authenticate"],
        :mongo_user => mongodb_config["username"],
        :mongo_password => mongodb_config["password"],
        :port => livetail_config["port"] || 12500
      }

      # Check if livetail secret is set.
      unless livetail_config["secret"].blank?
        unless Rails.env == "test"
          fork do
            server = LiveTail::Server.new(args)

            begin
              server.run(livetail_config["secret"]);
            rescue RuntimeError => e
              unless e.message == "no acceptor"
                raise e
              end
            end
          end
        end
      else
        puts "NO LIVETAIL SECRET SET! NOT STARTING!"
      end
    end
  end
rescue => e
  puts "ERROR (live tail): #{e}"
  puts e.backtrace
  exit
end
