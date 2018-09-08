require 'socket'

class DataSocketServer
	def initialize hostname,port,logger
		@hostname = hostname
		@port = port
		@server = TCPServer.open( hostname, port)
		@logger = logger
	end

	def getData
		@logger.info "Server is initialized"
		begin
			loop do 
			  Thread.start(@server.accept) do |s| 
					@logger.info "Server is listening" 
			    data = s.read()
			    @logger.info "Received Message: #{data} " 
			    puts "Data received"
			    @logger.info "Client data received #{data} "
			    s.close
		   	end 
			end
			@server.close 
		rescue Exception => e
			@logger.error "Error: #{e.message} "
			@logger.debug "#{e.backtrace.inspect}"
		end
	end
end