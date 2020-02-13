require 'google/apis/calendar_v3'

class GoogleCalendar

  def initialize
    authorize
  end

  def service
    @service
  end

  def events(reload=false)
    @events = nil if reload
    @events ||= service.list_events(calendar_id, max_results: 2500).items
  end

  def insert_event(event)
    service.insert_event("41uih86oej4uhvbnaonesl0s3o@group.calendar.google.com", event)
  end


private

  def calendar_id
    @calendar_id ||= "41uih86oej4uhvbnaonesl0s3o@group.calendar.google.com"
  end

  def authorize
    calendar = Google::Apis::CalendarV3::CalendarService.new
    calendar.client_options.application_name = 'App Name' # This is optional
    calendar.client_options.application_version = 'App Version' # This is optional

    # An alternative to the following line is to set the ENV variable directly 
    # in the environment or use a gem that turns a YAML file into ENV variables
    ENV['GOOGLE_APPLICATION_CREDENTIALS'] = "./google_api.json"
    scopes = [Google::Apis::CalendarV3::AUTH_CALENDAR]
    calendar.authorization = Google::Auth.get_application_default(scopes)

    @service = calendar
  end
end