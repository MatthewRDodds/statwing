require 'spec_helper'

describe Statwing::Authentication do
  let(:api_key) { 'api_key' }

  before { Statwing.configure { |c| c.api_key = api_key } }

  it "adds an Authorization header" do
    base64 = Base64.encode64(api_key).gsub!("\n", '')

    described_class.new.add_header({}).tap do |headers|
      headers["Authorization"].should == "Basic #{base64}:"
    end
  end
end
