require 'test_helper'

class EC2toolTest < MiniTest::Unit::TestCase
  def setup
    config = stub_everything('EC2Tool::Config')
    @tool = EC2Tool::EC2Tool.new(config)
  end

  def test_util_initialises_with_config
    assert true
  end
end
