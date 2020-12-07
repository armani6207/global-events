class CLI
    @@prompt = TTY::Prompt.new
    def menu
        system "clear"
        greeting = "Welcome to the Global Events Center! Please select an option to continue."
        response = @@prompt.select(greeting, %w(Events Settings Exit))

        if response == "Events"
            system "clear"
            response = @@prompt.select("Please select which type of event you want to view.", %w(Severe_Storms Wildfires Earthquakes Volcanoes Main_Menu))
            if response == "Severe_Storms"
                system "clear"
                puts "Here are all of the Severe Storms reported in the past #{Settings.days} days:"
                puts Events.new.severe_storms
                response = @@prompt.select("", %w(Main_Menu))
                menu if response == "Main_Menu"
            elsif response == "Wildfires"
                system "clear"
                puts "Here are all of the Wildfires reported in the past #{Settings.days} days:"
                puts Events.new.wildfires
                response = @@prompt.select("", %w(Main_Menu))
                menu if response == "Main_Menu"
            elsif response == "Earthquakes"
                system "clear"
                puts "Here are all of the Earthquakes reported in the past #{Settings.days} days:"
                puts Events.new.earthquakes
                response = @@prompt.select("", %w(Main_Menu))
                menu if response == "Main_Menu"
            elsif response == "Volcanoes"
                system "clear"
                puts "Here is all Volcanic Activity reported in the past #{Settings.days} days:"
                puts Events.new.volcanoes
                response = @@prompt.select("", %w(Main_Menu))
                menu if response == "Main_Menu"
            elsif response == "Main_Menu"
                self.menu
            end
        elsif response == "Settings"
            system "clear"
            response = @@prompt.select("Please select the setting you want to modify:", %w(Reporting_Size Main_menu))
            if response == "Reporting_Size"
                system "clear"
                days = @@prompt.ask("Please enter the ammount of days you want the program to report. (Default is 30 days):")
                Settings.days=(days)
                system "clear"
                puts "The setting has been changed. Returning to Main Menu."
                sleep(1)
                menu
            elsif response == "Main_Menu"
                menu
            end
        elsif response == "Exit"
            system "clear"
            puts "Thank you for using the Global Events Center"
            exit
        end
    end

end