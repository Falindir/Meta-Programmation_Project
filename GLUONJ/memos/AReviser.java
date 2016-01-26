package memos;

import test.A;
import java.util.HashSet;
import java.util.Set;

public reviser AReviser extends A {

	private static Set<A> instances = new HashSet<A>();

	/**
	 * java -jar GluonJCompiler.jar test/A.java memos/AReviser.java
	 * java -jar gluonj.jar test/A.class memos/AReviser.class
	 * java test.A
	 */

	public void whoamI() {
		System.out.println("Class A reviser");
		System.out.println(instances.toString());
	}
	
	public void init() {
		super.init();
		register();
	}

	public void register() {
		instances.add(this);
	}

	public void free() {
		instances.remove(this);
	}
}