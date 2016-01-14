package memo;

import java.util.HashSet;
import java.util.Set;

public class B extends A {

    private static Set<B> instances = new HashSet<B>();

    @Override
    protected void register() {
        instances.add(this);
    }

    @Override
    public Set<? extends B> getIntance() {
        return instances;
    }

    @Override
    protected void free() {
        System.out.println("Free instance " + this);
        instances.remove(this);
    }

}
