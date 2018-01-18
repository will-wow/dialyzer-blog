defmodule DialyzerBlogTest do
  use ExUnit.Case
  doctest DialyzerBlog

  test "greets the world" do
    assert DialyzerBlog.hello() == :world
  end
end
