package singleton;

public class Main {

    public static void main(String[] args) {

        Singleton s1 = Singleton.getInstance();
        System.out.println("S1 : " + s1);

        Singleton s2 = Singleton.getInstance();
        System.out.println("S2 : " + s2);

        //Singleton s3 = new Singleton();

    }

}
