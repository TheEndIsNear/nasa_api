defmodule NasaApi do
  @moduledoc """
  Documentation for `NasaApi`.
  """
  @base_url "https://api.nasa.gov/"
  @client if Mix.env() == :test, do: NasaAPI.Client.TestClient, else: NasaAPI.Client.WebClient

  def fetch_planetary_hd_picture(_opts \\ []) do
    (@base_url <> "planetary/apod?api_key=#{api_key()}")
    |> URI.encode()
    |> client().create_image()
    |> client().fetch_hd_image()
  end

  def fetch_planetary_picture(_opts \\ []) do
    (@base_url <> "planetary/apod?api_key=#{api_key()}")
    |> URI.encode()
    |> client().create_image()
    |> client().fetch_image()
  end

  defp api_key, do: Application.get_env(:nasa_api, :api_key, "DEMO_KEY")
  defp client(), do: @client
end
