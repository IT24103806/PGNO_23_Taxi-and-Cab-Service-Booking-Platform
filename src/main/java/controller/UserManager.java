package controller;

import java.io.*;

public class UserManager {
    private static final String FILE_NAME = "users.txt";

    // Add a user
    public static void addUser(String id, String name, String email, String password, String role) throws IOException {
        FileWriter writer = new FileWriter(FILE_NAME, true);
        writer.write(id + "," + name + "," + email + "," + password + "," + role + "\n");
        writer.close();
    }

    // Remove a user
    public static void removeUser(String userId) throws IOException {
        File inputFile = new File(FILE_NAME);
        File tempFile = new File("temp.txt");

        BufferedReader reader = new BufferedReader(new FileReader(inputFile));
        BufferedWriter writer = new BufferedWriter(new FileWriter(tempFile));

        String line;
        while ((line = reader.readLine()) != null) {
            String[] data = line.split(",");
            if (data.length >= 5 && !data[0].equals(userId)) {
                writer.write(line + "\n");
            }
        }

        reader.close();
        writer.close();

        // Rename temp file to original file
        inputFile.delete();
        tempFile.renameTo(inputFile);
    }
}
