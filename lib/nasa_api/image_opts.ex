defmodule NasaAPI.ImageOpts do
  use Ecto.Schema
  import Ecto.Changeset

  schema "image_opts" do
    field :date, :date
    field :start_date, :date
    field :end_date, :date, default: Date.utc_today()
    field :count, :integer, default: 0
    field :thumbs, :boolean, default: false
  end

  def create(params) do
    params
    |> changeset()
    |> apply_action(:insert)
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, [:date, :start_date, :end_date, :count, :thumbs])
    |> validate_exclusive_fields([:date, :start_date])
    |> validate_exclusive_fields([:date, :count])
    |> validate_exclusive_fields([:end_date, :count])
    |> validate_exclusive_fields([:start_date, :count])
  end

  defp validate_exclusive_fields(changeset, fields) do
    [field1, field2] = fields

    if get_change(changeset, field1) && get_change(changeset, field2) do
      add_error(changeset, field2, "cannot be present if #{field1} is also set")
    else
      changeset
    end
  end

  def encode_query(%__MODULE__{date: date, count: 0}), do: URI.encode_query(%{date: date})

  def encode_query(%__MODULE__{start_date: start_date, end_date: end_date}),
    do: URI.encode_query(%{start_date: start_date, end_date: end_date})
end
