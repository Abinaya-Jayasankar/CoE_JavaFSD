import java.util.EnumSet;

public class MeetingRoom {
    private String roomId;
    private String roomName;
    private int capacity;
    private EnumSet<RoomFeature> features;

    public MeetingRoom(String roomId, String roomName, int capacity, EnumSet<RoomFeature> features) {
        this.roomId = roomId;
        this.roomName = roomName;
        this.capacity = capacity;
        this.features = features;
    }

    public boolean hasFeatures(EnumSet<RoomFeature> requiredFeatures) {
        return features.containsAll(requiredFeatures);
    }

    public String getRoomId() {
        return roomId;
    }

    public String getRoomName() {
        return roomName;
    }

    @Override
    public String toString() {
        return roomName;
    }
}
