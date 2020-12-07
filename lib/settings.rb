class Settings
    @@days = 30

    def self.days=(number)
        @@days = number
    end

    def self.days
        @@days
    end
end