package memo;

import java.util.Set;

public abstract class MemoObject {

    public MemoObject() {
        register();
    }

    protected abstract void register();

    public abstract Set<? extends MemoObject> getInstance();

    protected abstract void free();

    public void print(String name) {
        System.out.println(name + " : " + this);
    }

}
