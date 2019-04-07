package threadInfo;

public class ThreadDemo {
    public static void main(String[] args) {
        for (int i = 0; i < 100; i++) {
            Thread thread = new Thread(new ThreadInfo());
            User instance = User.getInstance();
            System.out.println(instance);
            thread.start();
        }
    }
}
