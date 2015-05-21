require 'spec_helper'

describe Statwing::User do
  before do
    stub_api_for(Statwing::User) do |stub|
      stub.get("/api/p0/users") do |env|
        [
          200,
          {},
          {users:
          [
            { id: 1, name: "Michael Scott" },
            { id: 2, name: "Dwight Shrute" }
          ]
          }.to_json
        ]
      end
    end
  end

  it 'returns all users' do
    users = Statwing::User.all.to_a
    expect(users.count).to eq(2)
    expect(users.map(&:class).uniq).to eq([Statwing::User])
  end
end
