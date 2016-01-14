package memo;

public class Main {

    public static void main(String[] args) {

        A a1 = new A();
        a1.print("A1");
        A a2 = new A();
        a2.print("A2");
        A a3 = new A();
        a3.print("A3");
        B b1 = new B();
        b1.print("B1");
        B b2 = new B();
        b2.print("B2");

        System.out.println("\nInstances : ");

        System.out.println("A instances : " + a3.getIntance());
        System.out.println("B instances : " + b1.getIntance());

        System.out.println("");
        a2.free();
        b2.free();

        System.out.println("\nInstances : ");
        System.out.println("A instances : " + a3.getIntance());
        System.out.println("B instances : " + b1.getIntance());
    }
}
