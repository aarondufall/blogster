get '/' do
  puts "[LOG] Getting /"
  puts "[LOG] Params: #{params.inspect}"
  erb :index
end

get '/cool_url' do
  puts "[LOG] Getting /cool_url"
  puts "[LOG] Params: #{params.inspect}"
  @text = params[:user_input]
  @check = params[:check]
  erb :get_cool_url
end

post '/cool_url' do
  puts "[LOG] Posting to /cool_url"
  puts "[LOG] Params: #{params.inspect}"
  @request = request   # => '/hello-world'
  @textarea = params[:text_area]
  @textfield = params[:text_field]
  erb :post_cool_url#,:layout => false
end

get '/splat/*' do
  @value = params[:splat]
  erb :get_cool_url
end
