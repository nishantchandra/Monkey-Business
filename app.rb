$LOAD_PATH.unshift(File.expand_path('.'))
require 'sinatra'
require 'sinatra/activerecord'

get '/' do
  erb :home
end

post '/' do
  search = params[:search]
  type = params[:engine]
  search_engine = downcase_query(type)
  new_search = search.gsub(" ", "+" )
  values = downcase_query(new_search)
  if search_engine == "google"
    redirect "http://google.com/#psj=1&q=#{values}"
  elsif search_engine == "yahoo"
    redirect "http://search.yahoo.com/search;_ylt=AsKUgzFcijruR5cptee6fNWbvZx4?p=#{values}"
  elsif search_engine == "bing"
    redirect "http://www.bing.com/search?q=#{values}"
  elsif search_engine == "ask"
    redirect "http://www.ask.com/web?qsrc=1&o=0&l=dir&q=#{values}"
  elsif search_engine == "baidu"
    redirect "http://www.baidu.com/s?wd=#{values}"
  elsif search_engine == "youtube"
     redirect "http://www.youtube.com/results?search_query=#{values}"
  elsif search_engine == "pinterest"
    redirect "http://www.pinterest.com/search/pins/?q=#{values}"
  elsif search_engine == "reddit"
     redirect "http://www.reddit.com/search?q=#{values}"
  elsif search_engine == "stack"
     redirect "http://stackoverflow.com/search?q=#{values}"
  else
    redirect "/"
  end
end

def downcase_query(string)
  return string.downcase
end
