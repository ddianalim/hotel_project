require_relative "room"

class Hotel
    def initialize(name, hash)
        @name = name
        @rooms = Hash.new { |k, v| hash[k] = Room.initialize(v) }
    end

    def name
        @name.split(" ").map(&:capitalize).join(" ")
    end

    def rooms
        @rooms
    end
    
    def room_exists?(room_name)
        @rooms.has_key?(room_name)
    end

    def check_in(person, room_name)
        if !room_exists?(room_name)
            p "sorry, room does not exist"
        else
            room_name.add_occupant(person)
            if room_name.add_occupant(person)
                p "check in successful"
            else
                p "sorry, room is full"
            end
        end
    end
end
