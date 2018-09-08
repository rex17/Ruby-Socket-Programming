require 'logger'
require 'securerandom'
require_relative 'spec_helper'
require_relative '../lib/logger'


describe CustomLogger do
  describe "#loggermethods" do

    before do   
			@logger = double(CustomLogger)
		end

    describe "log_app_started" do
      it "logs app start time" do
        allow_any_instance_of(CustomLogger).to receive(:info).and_return(true)
        expect(@logger.log_app_started).to eql(true)
      end
    end

  end
end