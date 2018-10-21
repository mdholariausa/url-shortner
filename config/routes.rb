Rails.application.routes.draw do
  root to: "shorten_url#index"
  get "/:short_url", to: "shorten_url#show"
  get "#shorten/:short_url", to: "shorten_url#shortened", as: :shortened
  post "/shorten_url/create"
  get "/shorten_url/fetch_original_url"
end
