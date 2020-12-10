class Events
    attr_accessor :category, :title, :coordinates, :date_detected 

    @@all = []

    def initialize(title, category, coordinates, date_detected)
        @@all << self
        @title = title
        @category = category
        @coordinates = coordinates
        @date_detected = date_detected
    end

    def self.get_event(category)
        @@all.find_all{|x| x.category == category}
    end

    def self.populate_events
        API.new.generate_events if @@all == []
    end

    def  self.earthquakes
        self.populate_events
        self.get_event("Earthquakes")
    end

    def self.volcanoes
        self.populate_events
        self.get_event("Volcanoes")
    end

    def self.severe_storms
        self.populate_events
        self.get_event("Severe Storms")
    end

    def self.wildfires
        self.populate_events
        self.get_event("Wildfires")
    end

    def self.reset
        @@all.clear
    end
end