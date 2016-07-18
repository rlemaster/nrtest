class EventsController < ApplicationController
  def log_it
    logger.info ("log_it reached")
    @event = Event.new()
    @event.action=(params[:host_action])
    @event.hostname=(params[:host_name])
    host =  Host.find_by_name(params[:host_name])
    if host.nil?
      render text: 'hostname = ' + params[:host_name] + ' not valid host on system.  Please check your host name or register host if host name is correct.'
      return
    else
      @event.org_id = Host.find_by_name(params[:host_name]).org_id
    end
    if @event.save
      logger.info("Successfully created event.")
    else
      logger.info("Warning event not created")
    end
    render text: 'Successful event save </br>' + 'hostname = ' + params[:host_name] + '</br> action = ' + params[:host_action]
  end

  def show
    render text: 'Malformed Url request for events.  Please check your syntax and try again'
  end

  def events_for_org
    @events = Event.where(org_id: params[:id])
    @events = @events.sort {|a,b| b.created_at <=> a.created_at}
    @events = @events.first(params[:count].to_i)
    @org = Org.find(params[:id])
    respond_to do |format|
      format.html
      format.json {
        render :json, partial: "events/events_for_org.json.jbuilder", :locals => { :org_name => @org.name}
      }
    end
  end

  def events_for_host
    @events = Event.where(hostname: params[:host_name])
    @events = @events.sort {|a,b| b.created_at <=> a.created_at}
    @events = @events.first(params[:count].to_i)
    respond_to do |format|
      format.html
      format.json {
        render :json, partial: "events/events_for_host.json.jbuilder", :locals => { :host_name => params[:host_name]}
      }
    end
  end

end