package util;

import model.Driver;

public class DriverRatingSorter {
    public static void bubbleSort(Driver[] drivers) {
        int n = drivers.length;
        for (int i = 0; i < n - 1; i++) {
            for (int j = 0; j < n - i - 1; j++) {
                if (drivers[j].getRating() < drivers[j + 1].getRating()) {
                    Driver temp = drivers[j];
                    drivers[j] = drivers[j + 1];
                    drivers[j + 1] = temp;
                }
            }
        }
    }
}