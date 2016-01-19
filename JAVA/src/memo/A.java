package memo;

import java.util.HashSet;
import java.util.Set;

public class A extends MemoObject {

    private static Set<A> instances = new HashSet<A>();

    @Override
    protected void register() {
        instances.add(this);
    }

    @Override
    public Set<? extends A> getIntance() {
        return instances;
    }

    @Override
    protected void free() {
        System.out.println("Free instance " + this);
        instances.remove(this);
    }


}
