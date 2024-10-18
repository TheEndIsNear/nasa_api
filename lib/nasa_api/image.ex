defmodule NasaAPI.Image do
  @moduledoc """
  Struct for holding the information contained within the NASA image values
  """
  defstruct ~w(copyright date explanation hd_url media_type service_version title url)a

  alias NasaAPI.Image

  @type t() :: %__MODULE__{
          copyright: String.t(),
          date: Date.t(),
          explanation: String.t(),
          hd_url: String.t(),
          media_type: String.t(),
          service_version: String.t(),
          title: String.t(),
          url: String.t()
        }

  @spec create(map()) :: Image.t()
  def create(%{
        "copyright" => copyright,
        "date" => date,
        "explanation" => explanation,
        "hd_url" => hd_url,
        "media_type" => media_type,
        "service_version" => service_version,
        "title" => title,
        "url" => url
      }) do
    %Image{
      copyright: copyright,
      date: Date.from_iso8601!(date),
      explanation: explanation,
      hd_url: hd_url,
      media_type: media_type,
      service_version: service_version,
      title: title,
      url: url
    }
  end
end
