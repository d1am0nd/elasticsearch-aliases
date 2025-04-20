defmodule ESAliases.IndexManagement.CreateIndices do
  def run(index_name) do
    req = Req.new(
      url: "http://localhost:9200/" <> index_name,
      headers: %{"content-type": "application/json"},
      json: %{settings: %{number_of_replicas: 0}}
    )

    Req.put!(req)
  end
end

ESAliases.IndexManagement.CreateIndices.run("test_index")
ESAliases.IndexManagement.CreateIndices.run("test_index2")
