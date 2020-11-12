require_relative "room"

class Hotel
    def initialize(name, capacities)
        @name = name
        @rooms = {}

        capacities.each do |room_name, capacity| 
            @rooms[room_name] = Room.new(capacity)
        end
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
            puts "sorry, room does not exist"
        else
            if @rooms[room_name].add_occupant(person)
                puts "check in successful"
            else
                puts "sorry, room is full"
            end
        end
    end

    def has_vacancy?
        @rooms.each_key do |room_name|
            if !@rooms[room_name].full?
                return true
            end
        end
        false
    end

    def list_rooms
        @rooms.each_key do |room_name|
            puts room_name + " " + @rooms[room_name].available_space.to_s
        end
    end
end
