require 'spec_helper'

describe Statwing::Dataset do
  before do
    stub_api_for(Statwing::Dataset) do |stub|
      stub.get("/api/p0/datasets") do |env|
        [
          200,
          {},
          {datasets:
          [
            { id: 1, name: "Realty Properties" },
            { id: 2, name: "Planets" }
          ]
          }.to_json
        ]
      end
    end
  end

  it 'returns all datasets' do
    datasets = Statwing::Dataset.all.to_a
    expect(datasets.count).to eq(2)
    expect(datasets.map(&:class).uniq).to eq([Statwing::Dataset])
  end
end
