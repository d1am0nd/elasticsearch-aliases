defmodule ESAliases.IndexManagement.ApplyTwoAliases do
  def run() do
    req = Req.new(
      url: "http://localhost:9200/_aliases",
      headers: %{"content-type": "application/json"},
      json: %{
        actions: [
          %{add: %{index: "test_index", alias: "alias_1"}},
          %{add: %{index: "test_index", alias: "alias_2"}}
        ]
      }
    )

    Req.post!(req)
  end
end

ESAliases.IndexManagement.ApplyTwoAliases.run()
