require('sinatra')
require('sinatra/reloader')
also_reload('.lib/**/*.rb')
require('./lib/rectangle')
require('./lib/cube')




get('/') do
  erb(:index)
end

get('/result') do
  length = params.fetch('length').to_i()
  width = params.fetch('width').to_i()
  @rectangle = Rectangle.new(length, width)
  if @rectangle.square?()
    @cube = Cube.new(@rectangle)
  end
  erb(:result)

end
