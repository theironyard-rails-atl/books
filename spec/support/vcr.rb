VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
end

RSpec.configure do |c|
  c.around :each, vcr: true do |example|
    ex_description = example.metadata[:full_description]
    # replace all whitespace with _s
    cassette_name = ex_description.gsub /\s+/, '_'
    VCR.use_cassette cassette_name, re_record_interval: 7.days do
      example.run
    end
  end
end
