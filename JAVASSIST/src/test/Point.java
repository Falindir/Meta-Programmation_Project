package test;

public class Point extends MemoObject {

	private int x;
	
	private int y;
	
	public Point() {
		this.x = 0;
		this.y = 0;
	}
	
	public int getX() {
		return this.x;
	}
	
	public int getY() {
		return this.y;
	}
	
	
	// Code instrumenté
	public static void main(String[] args) {
		Point p = new Point();
		System.out.println(p.getInstances());
		Point p2 = new Point();
		System.out.println(p2.getInstances());
		p.free();
		System.out.println(p2.getInstances());
	}
}
