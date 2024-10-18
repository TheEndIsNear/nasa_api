defmodule NasaAPI.Client.WebClient do
  @moduledoc """
    Web Client for fetching data from the NASA API 
  """
  @behaviour NasaAPI.Client.NasaClients

  alias NasaAPI.Image

  @impl true
  def create_image(nasa_image_url) do
    case Req.get(nasa_image_url) do
      {:ok, %Req.Response{status: 200, body: body}} ->
        Image.create(body)

      {:ok, %Req.Response{status: 404}} ->
        {:error, raise("Not Found")}

      {:error, reason} ->
        {:error, reason}
    end
  end

  @impl true
  def fetch_hd_image(image) do
    case Req.get(image.hd_url) do
      {:ok, %{body: image}} -> image
      {:error, reason} -> {:error, reason}
    end
  end

  @impl true
  def fetch_image(image) do
    case Req.get(image.url) do
      {:ok, %{body: image}} -> image
      {:error, reason} -> {:error, reason}
    end
  end
end
