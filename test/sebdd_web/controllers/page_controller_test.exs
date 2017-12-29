defmodule SebddWeb.PageControllerTest do
  use SebddWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Sebastian De Deyne"
  end
end
