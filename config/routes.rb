Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 resources :events do
   collection do
     get :log_it
     get :events_for_org
     get :events_for_host
   end
 end

end
