require 'yaml'
require 'mash'
require_relative 'spec_helper'
require_relative '../app/client'
require_relative '../app/server'
require_relative '../lib/logger'


describe DataSocketClient do
  describe "#sendData" do

    before do   
    	settings = Mash.new(YAML.load(IO.read(File.dirname(File.expand_path('../', __FILE__)) + '/config/settings.yml')))[:development]
			@hostname = settings[:socket_details][:hostname]
			@port = settings[:socket_details][:port]
			@logger = CustomLogger.new "SocketApp"
      @client = DataSocketClient.new(@hostname,@port,@logger)
      @data = "sample_data"
		end

    describe "sendData" do
      it "sends data to server through socket" do
        allow_any_instance_of(DataSocketClient).to receive(:puts).and_return(true)
        expect(@client.sendData(@data)).to eql(true)
      end
    end

    describe "sendData" do
      it "unable to send data, to server through socket" do
        allow_any_instance_of(DataSocketClient).to receive(:puts).and_return(false)
        expect(@client.sendData(@data)).to eql(true)
      end
    end

    describe "makeData" do
      it "generate server message data to be sent" do
        @data = ""
        expect(@client.makeData).to eql(!@data)
      end
    end

  end
end