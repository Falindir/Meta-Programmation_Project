package inspector;

public class Main {

    public static void main(String[] args) {

        AAA a = new AAA();

        Inspector inspect = new Inspector();

        System.out.println("Inspector :");
        inspect.inspectAllFields(a);
    }
}
