package test;

import memos.MemoObject;

public class A extends MemoObject{

	public A() {
		super();
	}
	
	public void init() {
		System.out.println("Init Class A");
	}

	public void whoamI() {
		System.out.println("Class A");
	}

	public static void main(String[] args) {
		A a = new A();
		a.whoamI();
		A a2 = new A();
		a2.whoamI();
		
		a.free();
		a2.whoamI();
	}
}
