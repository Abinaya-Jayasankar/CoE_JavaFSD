import java.util.*;

public class RoomScheduler {
    private Map<String, MeetingRoom> rooms = new HashMap<>();

    public void addMeetingRoom(MeetingRoom room) {
        rooms.put(room.getRoomId(), room);
        System.out.println("Room added: " + room.getRoomName() + ", ID: " + room.getRoomId());
    }

    public String bookRoom(String roomId, EnumSet<RoomFeature> requiredFeatures) {
        MeetingRoom room = rooms.get(roomId);
        if (room != null && room.hasFeatures(requiredFeatures)) {
            return "Room " + roomId + " booked successfully.";
        } else {
            return "Room " + roomId + " does not meet the requirements.";
        }
    }

    public List<String> listAvailableRooms(EnumSet<RoomFeature> requiredFeatures) {
        List<String> availableRooms = new ArrayList<>();
        for (MeetingRoom room : rooms.values()) {
            if (room.hasFeatures(requiredFeatures)) {
                availableRooms.add(room.getRoomName());
            }
        }
        System.out.println("Available rooms with " + requiredFeatures + ": " + availableRooms);
        return availableRooms;
    }
}
