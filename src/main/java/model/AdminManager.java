package model;

import java.io.*;

public class AdminManager {
    private static final String FILE_NAME = "users.txt";

    public static void deleteCustomer(String customerId) throws IOException {
        BufferedReader reader = new BufferedReader(new FileReader(FILE_NAME));
        BufferedWriter writer = new BufferedWriter(new FileWriter("temp.txt"));

        String line;
        while ((line = reader.readLine()) != null) {
            String[] data = line.split(",");
            if (!data[0].equals(customerId) && data[4].equals("customer")) {
                writer.write(line + "\n");
            }
        }

        reader.close();
        writer.close();

        new File(FILE_NAME).delete();
        new File("temp.txt").renameTo(new File(FILE_NAME));
    }
}