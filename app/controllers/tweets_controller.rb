class TweetsController < ApplicationController
  
  get '/tweets' do
    if logged_in?
      @tweets = Tweet.all
      erb :'tweets/index'
    else
      redirect to '/login'
    end
  end
  
   get '/tweets/new' do
    if logged_in?
      erb :'tweets/new'
    else
      redirect to '/login'
    end
  end

  post '/tweets' do
    if params[:content] == ""
      redirect to "/tweets/new"
    else
      @tweet = current_user.tweets.create(content: params[:content])
      redirect to "/tweets/#{@tweet.id}"
    end
  end



end
