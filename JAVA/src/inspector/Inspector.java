package inspector;

import java.lang.reflect.Field;
import java.util.*;

public class Inspector {

    public Inspector() {

    }

    public void inspectAllFields(Object o) {
        Class c = o.getClass();
        Map<Class, Field[]> fieldsMap = new LinkedHashMap<Class, Field[]>();

        fieldsMap.put(c, c.getDeclaredFields());

        inspectFieldsOfSuperClass(fieldsMap, c);

        for (Class cl : fieldsMap.keySet()) {
            Field[] fields = fieldsMap.get(cl);

            System.out.println("\nClass : " + cl.getSimpleName());

            for (Field field : fields)
                try {
                    field.setAccessible(true);
                    System.out.println("\t" + field.toString() + " - value : " + field.get(o));
                } catch (IllegalAccessException e) {
                    e.printStackTrace();
                }
        }
    }

    public void inspectFieldsOfSuperClass (Map<Class, Field[]> map, Class c) {

        Class superC = c.getSuperclass();

        if(superC != null) {
            map.put(superC, superC.getDeclaredFields());
            inspectFieldsOfSuperClass(map, c.getSuperclass());
        }
    }
}
