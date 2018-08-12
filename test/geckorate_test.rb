require "test_helper"

class IntegerDecorator < Geckorate::Decorator
  def decorate
    {
      num: digit_to_name(to_i)
    }
  end

  private

  def digit_to_name(digit)
    {
      1 => "one",
      2 => "two",
      3 => "three"
    }[digit]
  end
end

class GeckorateTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Geckorate::VERSION
  end

  def test_decorate_returns_decorated_object
    assert IntegerDecorator.new(3).decorate == { num: "three" }
  end

  def test_decorate_collection_returns_empty_array_if_empty
    assert Geckorate::Decorator.decorate_collection([]), []
  end

  def test_decorate_collection_returns_array_of_decorated_objects
    assert(IntegerDecorator.decorate_collection([1, 2, 3]) ==
           [{:num=>"one"}, {:num=>"two"}, {:num=>"three"}])
  end

  def test_decorate_collection_raises_name_error_if_decorator_not_defined
    assert_raises NameError do
      Geckorate::Decorator.decorate_collection(["hi", "there"])
    end
  end
end
