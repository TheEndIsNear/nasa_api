defmodule NasaAPI.Client.NasaClients do
  @moduledoc """
  Behvaior for describing the functions needed for the NASA API
  """
  alias NasaAPI.Image

  @callback create_image(url :: String.t()) ::
              {:ok, image :: Image.t()} | {:error, exception :: Exception.t()}

  @callback fetch_hd_image(image :: Image.t()) ::
              {:ok, image_file :: binary} | {:error, exception :: Exception.t()}

  @callback fetch_image(image :: Image.t()) ::
              {:ok, image_file :: binary()} | {:error, exception :: Exception.t()}
end
