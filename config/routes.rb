Rails.application.routes.draw do

# This is responsible for calling the rails_admin files when there is a request
# for the path home/admin. Instead of pointing to your controllers it redirects
# to the internal files
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

# This is responsible not only for the route but also for the authentication and
# authorization parts. After the user is considered good to go, blazer pops up.
  authenticate :user, ->(user) { user.admin? } do
    mount Blazer::Engine, at: "blazer"
  end


  devise_for :users
  root to: 'pages#home'

end
