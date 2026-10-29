
public class App {
    public static void main(String[] args) {
        while (true) {
            System.out.println("Car Service System Running...");
            try {
                Thread.sleep(5000);
            } catch (InterruptedException e) {
                System.err.println("Execution interrupted: " + e.getMessage());
                Thread.currentThread().interrupt();
                break;
            }
        }
    }
}
