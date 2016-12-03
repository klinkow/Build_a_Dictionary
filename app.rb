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
  word_adding = Word.new(:word => new_word)
  word_adding.save()
  @words = Word.all()
  erb(:index)
end

get('/definition/:id') do
  @word = Word.find(params.fetch('id').to_i())
  erb(:definition)
end

post('/definition') do
  @word = Word.find(params.fetch("word_id").to_i())
  new_definition = params.fetch("new_definition")
  new_definition_object = Definition.new(:definition => new_definition)
  @word.add_definition(new_definition_object)
  erb(:definition)
end
