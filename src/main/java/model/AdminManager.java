package model;

import java.io.*;

public class AdminManager {
    private static final String FILE_NAME = "users.txt";

    public static void deleteCustomer(String customerId) {
        try {
            BufferedReader reader = new BufferedReader(new FileReader(FILE_NAME));
            BufferedWriter writer = new BufferedWriter(new FileWriter("temp.txt"));

            String line;
            while ((line = reader.readLine()) != null) {
                String[] data = line.split(",");
                if (!data[0].equals(customerId) && data[4].equals("customer")) {
                    writer.write(line);
                    writer.newLine();
                }
            }

            reader.close();
            writer.close();

            File oldFile = new File(FILE_NAME);
            File tempFile = new File("temp.txt");

            if (oldFile.delete()) {
                if (!tempFile.renameTo(oldFile)) {
                    System.out.println("Error renaming file.");
                }
            } else {
                System.out.println("Error deleting file.");
            }

        } catch (IOException e) {
            System.out.println("An error occurred while deleting the customer: " + e.getMessage());
        }
    }
}
