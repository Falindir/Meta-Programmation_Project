package test;

public class Point {

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
		Point p2 = new Point();
	}
}
