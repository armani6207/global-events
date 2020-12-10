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

    def event_creator(event_type)
        events = JSON.parse(self.get_events(event_type))
        events['events'].each do |event|
            title = event["title"]
            category = event["categories"].first["title"]
            coordinates = event["geometries"].first["coordinates"]
            date_detected = event["geometries"].first["date"].slice(0..(9))
            Events.new(title, category, coordinates, date_detected)
        end
    end

    def generate_events
        [6, 12, 10, 8].each{|x| self.event_creator(x)}
    end

end