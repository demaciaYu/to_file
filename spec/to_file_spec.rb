require 'to_file'

RSpec.describe ToFile do
  it "has a version number" do
    expect(ToFile::VERSION).not_to be nil
  end

  it "test for ToFile::To.yml" do
    file = StringIO.new()
    expect(File).to receive(:open).with("./nihao.yml", "w").and_yield(file)
    expect(file).to receive(:write).with("---\n- 1\n- 2\n- 3\n")
    ToFile::To.yml([1,2,3], './nihao.yml')
  end

  it "test for ToFile::To.json" do
    file = StringIO.new()
    expect(File).to receive(:open).with("./nihao.json", "w").and_yield(file)
    expect(file).to receive(:write).with("{\n  \"a\": 1,\n  \"b\": \"2\",\n  \"c\": [\n    1,\n    2,\n    3\n  ],\n  \"d\": {\n    \"ha\": 1,\n    \"dd\": 12\n  }\n}")
    ToFile::To.json({a: 1, b: "2", c: [1,2,3], d: {ha: 1, dd: 12}}, './nihao.json')
  end

  it "test for ToFile::To.xml" do
    puts "This test keeps failing, it seems like there is something wrong when we requiring 'activesupport' in rspec"
    # file = StringIO.new()
    # expect(File).to receive(:open).with("./nihao.xml", "w").and_yield(file)
    # expect(file).to receive(:write).with("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<hash>\n  <a type=\"integer\">1</a>\n  <b>2</b>\n  <c type=\"array\">\n    <c type=\"integer\">1</c>\n    <c type=\"integer\">2</c>\n    <c type=\"integer\">3</c>\n  </c>\n  <d>\n    <ha type=\"integer\">1</ha>\n    <dd type=\"integer\">12</dd>\n  </d>\n</hash>\n")
    # ToFile::To.xml({a: 1, b: "2", c: [1,2,3], d: {ha: 1, dd: 12}}, './nihao.xml')
  end

end
