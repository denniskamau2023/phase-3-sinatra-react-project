class ApplicationController < Sinatra::Base

  set :default_content_type, 'application/json'

  get '/users' do
    users = User.all.order(created_at: :asc)
    users.to_json
  end
  delete '/users/:id' do
    user = User.find(params[:id])
    user.destroy
    user.to_json
  end
  patch '/users/:id' do
    user = User.find(params[:id])
    user.update(
      phone: params[:phone],
    )
    user.to_json
  end

  post '/users' do
    user = User.create(
        name: params[:name],
      phone: params[:phone],
      email: params[:email],
    )
    user.to_json
  end
end
