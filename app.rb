require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word')
require('./lib/definition')

get('/') do
  @words = Word.all()
  erb(:index)
end

post('/') do
  new_word = params.fetch('new_word')
  word_adding = Word.new('new_word')
  word_adding.save()
  @words = Word.all()
  erb(:index)
end

get('/definition/:id') do
  @word = Word.find(params.fetch('id').to_i())
  erb(:definition)
end

get('/add_word') do
  erb(:add_word)
end
