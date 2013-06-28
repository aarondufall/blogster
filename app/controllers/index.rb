require 'json'

get '/' do
  @posts = Post.all
  @tags = Tag.all
  erb :index
end

get '/new_post' do
  erb :new_post
end

post '/new_post' do
  puts params.inspect
   erb :new_post
  post = Post.new(params[:post])
  if post.save
    redirect '/'
  else
    erb :new_post
  end
end

get '/tags/:id' do
  tag = Tag.find(params[:id])
  @posts = tag.posts.all
  erb :index 
end

get '/posts/:id' do
  post = Post.find(params[:id])
  erb :_post, locals: { post: post }
end

get '/posts/edit/:id' do
  @post = Post.find(params[:id])
  @tag_data = @post.tags.map(&:to_autocomplete_hash).to_json
  erb :edit_post
end

post '/posts/edit/:id' do
  @post = Post.find(params[:id])
  @post.update_attributes(params[:post])
  @post.save
  redirect to '/'
end


get '/tags.json' do
  content_type :json
  matches = Tag.search_for_autocomplete(current_query).map(&:to_autocomplete_hash)
  puts matches
  matches.to_json
end

delete '/posts/:id' do
  @post = Post.find(params[:id])
  @post.destroy
  redirect '/'
end

def current_query
  params[:q].to_s
end




