public class LinkedList {
    static class Node {
        int value;
        Node next;
        
        public Node(int value) {
            this.value = value;
            this.next = null;
        }
    }

    public boolean hasCycle(Node head) {
        if (head == null) {
            return false;
        }

        Node slow = head;
        Node fast = head;

        while (fast != null && fast.next != null) {
            slow = slow.next;
            fast = fast.next.next;

            if (slow == fast) {
                return true;
            }
        }

        return false;
    }

    public static void main(String[] args) {
        LinkedList list = new LinkedList();

        Node head = new Node(1);
        head.next = new Node(2);
        head.next.next = new Node(3);
        head.next.next.next = new Node(4);

        boolean hasCycle = list.hasCycle(head);
        System.out.println("Has cycle: " + hasCycle);
    }
}
