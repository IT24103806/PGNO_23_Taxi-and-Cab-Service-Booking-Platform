import model.Booking;

import java.util.LinkedList;
import java.util.Queue;

public class BookingQueue {
    private Queue<Booking> queue;

    public BookingQueue() {
        queue = new LinkedList<>();
    }

    public void addBooking(Booking booking) {
        queue.add(booking);
    }

    public Booking processNextBooking() {
        return queue.poll(); // FIFO
    }

    public boolean isEmpty() {
        return queue.isEmpty();
    }

    public int size() {
        return queue.size();
    }
}