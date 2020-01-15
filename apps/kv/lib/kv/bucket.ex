defmodule KV.Bucket do
  use Agent, restart: :temporary

  @doc """
  Start new bucket
  """

  def start_link(_opts) do
    Agent.start_link(fn -> %{} end)
  end

  @doc """
  Get key from bucket
  """

  def get(bucket, key) do
    Agent.get(bucket, &Map.get(&1, key))
  end

  @doc """
  Put key_value in bucket
  """

  def put(bucket, key, value) do
    Agent.update(bucket, &Map.put(&1, key, value))
  end

  @doc """
  Delete key_value in bucket
  """

  def delete(bucket, key) do
    Process.sleep(1000)
    Agent.get_and_update(bucket, fn bucket ->
      Process.sleep(1000)
      Map.pop(bucket, key)
    end)
  end
end
