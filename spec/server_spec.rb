require 'yaml'
require 'mash'
require_relative '../app/server'
require_relative '../lib/logger'


describe DataSocketServer do
  describe "#getData" do

    before do   
    	settings = Mash.new(YAML.load(IO.read(File.dirname(File.expand_path('../', __FILE__)) + '/config/settings.yml')))[:development]
			@hostname = settings[:socket_details][:hostname]
			@port = settings[:socket_details][:port]
			@server = double(DataSocketServer)
      @logger = CustomLogger.new "SocketApp"
		end

    describe "getData" do
      it "reads data from client through socket" do
			  allow_any_instance_of(DataSocketServer).to receive(:getData).and_return(true)
        expect(@server.getData).to eql(true)
      end
    end

    describe "getData" do
      it "dosent read data from server through socket" do
        allow_any_instance_of(DataSocketServer).to receive(:getData).and_return(false)
        expect(@server.getData).to eql(false)
      end
    end

  end
end