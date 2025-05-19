public class Review {
    private String reviewId;
    private String userId;
    private String driverId;
    private String comment;
    private int rating;

    public Review(String reviewId, String userId, String driverId, String comment, int rating) {
        this.reviewId = reviewId;
        this.userId = userId;
        this.driverId = driverId;
        this.comment = comment;
        this.rating = rating;
    }

    public String getReviewId() { return reviewId; }
    public String getUserId() { return userId; }
    public String getDriverId() { return driverId; }
    public String getComment() { return comment; }
    public int getRating() { return rating; }

    public void displayReview() {
        System.out.println("Review by " + userId + " for Driver " + driverId + ": [" + rating + "/5] " + comment);
    }
}