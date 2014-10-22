json.array!(@game_threads) do |game_thread|
  json.extract! game_thread, :id, :thread_name, :genre
  json.url game_thread_url(game_thread, format: :json)
end
