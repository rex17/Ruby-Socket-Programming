require 'socket'  

class DataSocketClient
	def initialize hostname,port,logger
		@hostname = hostname
		@port = port
		@client = TCPSocket.open( hostname, port)
		@logger = logger
	end

	def sendData(data)
		begin
			@logger.info "Client is Connecting "			
			puts "Data Sent"
			@client.puts(data)
			@logger.debug "Data sent: #{data} "
			@client.close
			@logger.info "Data sent successfully"
		rescue Exception => e  
		  @logger.error "Error while starting server: #{e.message} "
		  @logger.debug "#{e.backtrace.inspect}"
		end
	end

	def makeData
		File.open("/dev/urandom",File::RDONLY || File::NONBLOCK || File::NOCTTY) do |f|
		  text = f.readpartial(1024)
		  @data = text.encode('UTF-8', :invalid => :replace, :undef => :replace).gsub(" ","*")
		end
		@data
	end
end