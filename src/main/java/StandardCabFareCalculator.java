package service;

public class StandardCabFareCalculator extends FareCalculator {
    @Override
    public double calculateFare(double distance) {
        return 50 + (distance * 10);
    }
}