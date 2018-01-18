defmodule TypeChecked.User do
  alias TypeChecked.User

  @type t :: %User{
          first_name: String.t(),
          last_name: String.t(),
          phone: integer
        }

  defstruct [:first_name, :last_name, :phone]

  @spec me() :: t()
  def me do
    %User{first_name: "Will", last_name: "Ockelmann-Wagner", phone: 555_123_1234}
  end

  @spec full_name(t()) :: String.t()
  def full_name(user = %User{}) do
    "#{user.first_name()} #{user.last_name()}"
  end

  @spec format_phone(t()) :: String.t()
  def format_phone(%User{phone: phone}) do
    format_phone_number(phone)
  end

  @spec format_phone_number(integer) :: String.t()
  defp format_phone_number(phone) do
    # phone = Integer.to_string(phone)
    with {area_code, rest} <- String.split_at(phone, 3),
         {first_three, last_four} <- String.split_at(rest, 3) do
      "(#{area_code}) #{first_three}-#{last_four}"
    end
  end
end