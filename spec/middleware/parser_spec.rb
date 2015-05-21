require 'spec_helper'

describe Statwing::Parser do
  let(:error_type) { 'AuthenticationFailure' }
  let(:error_msg)  { 'authentication failed for api key' }

  let(:error_env) do
    {
      body: <<-JSON
        {
          "error": {
            "type": "#{error_type}",
            "message": "#{error_msg}"
          }
        }
      JSON
    }
  end

  let(:success_env) do
    {
      body: <<-JSON
        {
          "datasets": [
            {
              "id": 1,
              "name": "data"
            }
          ]
        }
      JSON
    }
  end

  subject { Statwing::Parser.new }

  it 'raises error if response contains error' do
    'AuthenticationFailure: authentication failed for api key'
    expect do
      subject.on_complete(error_env)
    end.to raise_error(RuntimeError, "#{error_type}: #{error_msg}")
  end

  it 'formats response body as expected' do
    response = subject.on_complete(success_env)
    response.should include(:data)
    response[:data].should include(:datasets)
  end
end
