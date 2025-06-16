public class Logger {
    // Step 1: private static instance (eager initialization)
    private static Logger instance = new Logger();

    // Step 2: private constructor
    private Logger() {
        System.out.println("Logger instance created.");
    }

    // Step 3: public method to return the same instance
    public static Logger getInstance() {
        return instance;
    }

    // Logger functionality
    public void log(String message) {
        System.out.println("[LOG] " + message);
    }
}
