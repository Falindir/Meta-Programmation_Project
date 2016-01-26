package memos;

public abstract class MemoObject {

	public MemoObject() {
		init();
	}
	
	public void init() {
		System.out.println("Init Class MemoObject");
	}
	
	public abstract void whoamI();
}
