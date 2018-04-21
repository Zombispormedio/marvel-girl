defmodule Utils do
  def get_secret_key() do
    case System.get_env("SECRET_KEY_BASE") do
      nil -> "${SECRET_KEY_BASE}"
      x -> x
    end
  end
end
