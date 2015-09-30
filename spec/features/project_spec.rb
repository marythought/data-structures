require "spec_helper"
require "project.rb"

describe 'project' do
  it "returns a valid result" do
    assert_equal project(0), 0
  end

  it "returns an error with a negative number" do
    proc { project(-1) }.must_raise ArgumentError
  end
end


