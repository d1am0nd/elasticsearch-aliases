defmodule ESAliases.IndexManagement.FailTwoAliases do
  def run() do
    req =
      Req.new(
        url: "http://localhost:9200/_aliases",
        headers: %{"content-type": "application/json"},
        json: %{
          actions: [
            %{add: %{index: "test_index", alias: "alias_3"}},
            %{add: %{index: "index_doesnt_exist", alias: "alias_4"}}
          ]
        }
      )

    IO.inspect(Req.post!(req))
  end
end

ESAliases.IndexManagement.FailTwoAliases.run()
