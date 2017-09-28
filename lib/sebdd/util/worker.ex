defmodule Sebdd.Util.Worker do
  defmacro __using__(_opts) do
    quote do
      def start_link do
        GenServer.start_link(__MODULE__, :ok, name: __MODULE__)
      end

      def terminate(reason, _state) do
        throw reason
      end
    end
  end
end
