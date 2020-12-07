class API
    URL = "https://eonet.sci.gsfc.nasa.gov/api/v2.1/categories"

    def initialize
        @days = Settings.days
    end

    def get_events(event_type)
        uri = URI.parse("#{URL}/#{event_type}?days=#{@days}")
        response = Net::HTTP.get_response(uri)
        response.body
    end

    def event_titles(event_type)
        ret_array = []
        events = JSON.parse(self.get_events(event_type))
        events['events'].collect do |event|
            event["title"]
        end
    end

end