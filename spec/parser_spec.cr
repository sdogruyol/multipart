require "./spec_helper"

describe Multipart::Parser do

  it "init with boundary" do
    parser = Multipart::Parser.new
    parser.init_with_boundary("abc")
    parser.boundary.should eq "\r\n--abc"
    expected_bc = {'\r'=>true, '\n'=>true, '-'=>true, 'a'=>true, 'b'=>true, 'c'=>true}
    parser.boundary_chars.should eq expected_bc
  end

end
