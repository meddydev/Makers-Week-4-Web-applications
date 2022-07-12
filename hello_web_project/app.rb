require "sinatra/base"

class Application < Sinatra::Base
  get "/names" do
    return "Julia, Mary, Karim"
  end

  post "/sort-names" do
    names = params[:names]

    names.split(",").sort.join(",")
  end

  get "/hello" do
    return erb(:index)
  end

  post "/submit" do
    name = params[:name]
    message = params[:message]

    return "Thanks #{name}, you sent this message: '#{message}'"
  end
end
