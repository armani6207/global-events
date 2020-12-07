class Events

    def get_info(id)
        API.new.event_titles(id)
    end

    def  earthquakes
        self.get_info(6)
    end

    def volcanoes
        self.get_info(12)
    end

    def severe_storms
        self.get_info(10)
    end

    def wildfires
        self.get_info(8)
    end
end