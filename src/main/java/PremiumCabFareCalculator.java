package service;

public class PremiumCabFareCalculator extends FareCalculator {
    @Override
    public double calculateFare(double distance) {
        return 100 + (distance * 15);
    }
}