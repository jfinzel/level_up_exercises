require_relative 'test_helper'

describe DataConversionLoader do
  let(:data) { conversion_data }
  let(:data_a) { conversion_data_a }

  it "should parse a JSON file", :happy do
    expect(data).to be_an(Array)
  end

  it "should be able to parse the correct fields", :happy do
    expect(data[0].keys).to eq(DATA_FIELDS)
  end

  it "should have the same number of array elements as JSON elements", :happy do
    elements = JSON.parse(File.read("source_data.json")).length
    expect(data.length).to eq(elements)
  end

  it "should understand how to filter by sample", :happy do
    expect(data_a).to be_an(Array)
  end

  it "should keep the same fields after filter", :happy do
    expect(data_a[0].keys).to eq(DATA_FIELDS)
  end
end