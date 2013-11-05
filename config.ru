$LOAD_PATH.unshift(File.expand_path('.'))
require './app'
run Sinatra::Application

