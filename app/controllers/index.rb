get '/' do
  @events = Event.all
  erb :index
end

get '/events/:id/show' do |id|
  @event = Event.find(id)
  erb :event_show
end

get '/events/new' do
  
  erb :create_event
end

post '/events/create' do
  new_event = Event.new(params)

  if new_event.save
    redirect to '/'
  else
    @failed_creation_message = new_event.errors.messages
  
    @name   = params[:organizer_name]
    @email  = params[:organizer_email]
    @title  = params[:title]
    @date   = params[:date]
    erb :create_event
  end

end
