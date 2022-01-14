class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  get "/messages" do
    message = Message.all.order(:created_at)
    message.to_json
  end
  
  post "/messages" do
    message = Message.create(
      body: params[:body],
      username: params[:username],
      created_at: params[:created_at]
    )
    message.to_json
  end

  patch "/message/:id" do
    message = Message.all.find(params[:id])
    message.update(
      body: params[:body]
    ) 
    message.to_json
  end

  delete "/messages/:id" do
    message = Message.all.find(params[:id])
    message.destroy
    message.to_json
  end
end
