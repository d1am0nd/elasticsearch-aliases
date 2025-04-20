defmodule ESAliases.IndexManagement.AliasConcurrentWriteIndex do
  def run(index_name) do
    req =
      Req.new(
        url: "http://localhost:9200/_aliases",
        headers: %{"content-type": "application/json"},
        json: %{
          actions: [
            %{remove: %{index: "*", alias: "alias_1"}},
            %{add: %{index: index_name, alias: "alias_1", is_write_index: true}}
          ]
        }
      )

    IO.inspect(Req.post!(req))
  end
end

tasks = []

tasks = [
  Task.async(fn -> ESAliases.IndexManagement.AliasConcurrentWriteIndex.run("test_index") end)
  | tasks
]

tasks = [
  Task.async(fn -> ESAliases.IndexManagement.AliasConcurrentWriteIndex.run("test_index2") end)
  | tasks
]

Task.await_many(tasks)
