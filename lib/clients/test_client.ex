defmodule NasaAPI.Client.TestClient do
  @moduledoc """
  Test client for mocking the behavior
  """
  @behaviour NasaAPI.Client.NasaClients

  alias NasaAPI.Image

  def create_image(_url) do
    {:ok, %Image{}}
  end

  def fetch_hd_image(_image) do
  end

  def fetch_image(_image) do
  end
end
