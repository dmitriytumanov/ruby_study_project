require_relative 'menu'
require_relative 'accessors'

# menu = Menu.new
# menu.add_here

class Test
  include Accessors

  attr_accessor_with_history :a
  strong_attr_acessor :b, String
end

class FakeTest
end

test_1 = Test.new
test_1.a = 1
test_1.a = 2
test_1.a = 3
test_1.a = 4
puts "test_1.a = #{test_1.a}"
puts "test_1.a_history = #{test_1.a_history}"

test_2 = Test.new
test_2.b = "1"
puts "test_2.b = #{test_2.b}"
test_2.b = 2
