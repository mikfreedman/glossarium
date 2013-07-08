Glossarium::Application.routes.draw do
  resources :collections do
    resources :entries
  end

  root :to => redirect("/collections")
end
