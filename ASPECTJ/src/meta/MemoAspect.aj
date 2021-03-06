package meta;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.HashSet;

public aspect MemoAspect  {
	
	private interface MemoClass {}
	declare parents: meta.* implements MemoClass;
		
    //static List meta.*.in = new ArrayList();
	
    static List Person.instances = new ArrayList();
    public  List Person.getInstances()  {
    	return instances; 
    }
    public void Person.register() {
    	instances.add(this);
    }
    
    static List Animal.instances = new ArrayList();
    public  List Animal.getInstances()  {
    	return instances; 
    }
    public void Animal.register() {
    	instances.add(this);
    }

    after(Object o) returning() : execution(new(..)) && this(o) && !within(MemoAspect) && !within(Main) {
        
    	if(o.getClass().equals(Person.class)) {
    		((Person) o).register();
    	}
    	else if(o.getClass().equals(Animal.class)) {
    		((Animal) o).register();
    	}
    	
    }
}
