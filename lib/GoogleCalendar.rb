require 'google/apis/calendar_v3'

class GoogleCalendar

  def initialize
    authorize
  end

  def service
    @service
  end

  def events(reload=false)
    # NOTE: This is just for demonstration purposes and not complete.
    # If you have more than 2500 results, you'll need to get more than    
    # one set of results.
    @events = nil if reload
    @events ||= service.list_events(calendar_id, max_results: 2500).items
  end



private

  def calendar_id
    @calendar_id ||= "4327m6pj3svbq2j8eek3iirifs@group.calendar.google.com"
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