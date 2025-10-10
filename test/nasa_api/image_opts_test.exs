defmodule NasaAPI.ImageOptsTest do
  use ExUnit.Case
  alias NasaAPI.ImageOpts

  describe "create/1" do
    test "creates a valid struct when given default params" do
      assert {:ok, %ImageOpts{}} = ImageOpts.create(%{})
    end

    test "fails to create if both a date and start date are given" do
      assert {:error,
              %Ecto.Changeset{errors: [start_date: {"cannot be present if date is also set", []}]}} =
               ImageOpts.create(%{
                 date: Date.utc_today(),
                 start_date: Date.from_iso8601!("2025-02-04")
               })
    end

    test "fails to create if both a start date and a count are given" do
      assert {:error,
              %Ecto.Changeset{
                errors: [count: {"cannot be present if start_date is also set", []}]
              }} =
               ImageOpts.create(%{
                 count: 10,
                 start_date: Date.from_iso8601!("2025-02-04")
               })
    end
  end
end
