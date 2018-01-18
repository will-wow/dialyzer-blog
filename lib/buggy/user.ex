defmodule Buggy.User do
  alias Buggy.User

  defstruct [:first_name, :last_name, :phone]

  def me do
    %User{
      first_name: "Will",
      last_name: "Ockelmann-Wagner",
      phone: 555_123_1234
    }
  end

  def full_name(user = %User{}) do
    "#{user.first_name} #{user.last_name}"
  end

  def format_phone(%User{phone: phone}) do
    format_phone_number(phone)
  end

  defp format_phone_number(phone) do
    with {area_code, rest} <- String.split_at(phone, 3),
         {first_three, last_four} <- String.split_at(rest, 3) do
      "(#{area_code}) #{first_three}-#{last_four}"
    end
  end
end