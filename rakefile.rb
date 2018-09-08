require 'yaml'
require 'mash'
require_relative 'app/client'
require_relative 'app/server'
require_relative 'lib/logger'

@logger = CustomLogger.new "SocketApp"

desc 'to start socket_app_server'
task :socket_app_server do
  @logger.log_app_started

  @logger.info "socket_app_server rake task initiated"
  env = ENV['ENV'].nil? ? :development : ENV['ENV']
  settings = Mash.new(YAML.load(IO.read(File.dirname(File.expand_path('', __FILE__)) + '/config/settings.yml')))[env]
  hostname = settings[:socket_details][:hostname]
  port  = settings[:socket_details][:port]

  @logger.info 'Invoking Server'
  server = DataSocketServer.new(hostname,port,@logger)
  server.getData

  @logger.info "socket_app_server rake task completed"

  @logger.log_app_ended
end

desc 'to start socket_app_client'
task :socket_app_client do
  @logger.info "socket_app_client rake task initiated"

  env = ENV['ENV'].nil? ? :development : ENV['ENV']

  settings = Mash.new(YAML.load(IO.read(File.dirname(File.expand_path('', __FILE__)) + '/config/settings.yml')))[env]
  hostname = settings[:socket_details][:hostname]
  port  = settings[:socket_details][:port]
  
  @logger.info 'Invoking Client'
  client = DataSocketClient.new(hostname,port,@logger)

  client.sendData(client.makeData)
  
  @logger.info "socket_app_client rake task completed"
end