defmodule NasaApiTest do
  use ExUnit.Case
  doctest NasaApi

  test "greets the world" do
    assert NasaApi.hello() == :world
  end
end
