package meta;


public class Main {

	 public static void main (String[] args){
		 
		 Person p1 = new Person("P1");
		 System.out.println("p1 : " + p1);
		 
		 System.out.println("Instance PERSON : " + p1.getInstances());

		 Animal a1 = new Animal("A1");
		 System.out.println("a1 : " + a1);
		 
		 System.out.println("Instance ANIMAL : " + a1.getInstances());
		 
		 Person p2 = new Person("P2");
		 System.out.println("p2 : " + p2);
		 
		 System.out.println("Instance PERSON : " + p2.getInstances());		 
		    
	 }
}
