import java.util.*;

class Task implements Comparable<Task> {
    String id;
    String description;
    int priority;

    public Task(String id, String description, int priority) {
        this.id = id;
        this.description = description;
        this.priority = priority;
    }

    @Override
    public int compareTo(Task other) {
        return Integer.compare(other.priority, this.priority);
    }

    @Override
    public String toString() {
        return "Task{id='" + id + "', description='" + description + "', priority=" + priority + "}";
    }
}

class TaskManager {
    private PriorityQueue<Task> taskQueue;
    private Map<String, Task> taskMap;

    public TaskManager() {
        taskQueue = new PriorityQueue<>();
        taskMap = new HashMap<>();
    }

    public void addTask(String id, String description, int priority) {
        Task newTask = new Task(id, description, priority);
        taskQueue.offer(newTask);
        taskMap.put(id, newTask);
    }

    public void removeTask(String id) {
        Task taskToRemove = taskMap.get(id);
        if (taskToRemove != null) {
            taskQueue.remove(taskToRemove);
            taskMap.remove(id);
            System.out.println("Task with ID '" + id + "' removed successfully.");
        } else {
            System.out.println("Task with ID '" + id + "' not found.");
        }
    }

    public Task getHighestPriorityTask() {
        return taskQueue.peek();
    }
}

public class Main1 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        TaskManager taskManager = new TaskManager();

        System.out.println("Enter the number of tasks to add:");
        int numTasks = scanner.nextInt();
        scanner.nextLine();

        for (int i = 0; i < numTasks; i++) {
            System.out.println("Enter task ID:");
            String id = scanner.nextLine();
            System.out.println("Enter task description:");
            String description = scanner.nextLine();
            System.out.println("Enter task priority:");
            int priority = scanner.nextInt();
            scanner.nextLine();
            taskManager.addTask(id, description, priority);
        }

        Task highestPriorityTask = taskManager.getHighestPriorityTask();
        System.out.println("Highest priority task: " + highestPriorityTask);

        System.out.println("Enter task ID to remove:");
        String removeId = scanner.nextLine();
        taskManager.removeTask(removeId);

        Task newHighestPriorityTask = taskManager.getHighestPriorityTask();
        System.out.println("New highest priority task: " + newHighestPriorityTask);
    }
}
