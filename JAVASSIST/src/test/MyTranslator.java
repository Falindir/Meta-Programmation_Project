package test;

import javassist.CannotCompileException;
import javassist.ClassPool;
import javassist.CtClass;
import javassist.CtConstructor;
import javassist.CtField;
import javassist.CtMethod;
import javassist.CtNewMethod;
import javassist.Modifier;
import javassist.NotFoundException;
import javassist.Translator;

/**
 * Listener notified when the class loader loads a class.
 */
public class MyTranslator implements Translator {

	/**
	 * Called before the loader loads a class
	 * Can modify the definition of the loaded class
	 * Does not have to call toBytecode() or writeFile()
	 * since javassist.Loader calls these methods to obtain a class file.
	 */
	@Override
	public void onLoad(ClassPool pool, String classname) throws NotFoundException, CannotCompileException {
		
		if (classname.equals("test.MemoObject")) {
			return;
		}
		
		CtClass cc = pool.get(classname);

		CtClass setClass = ClassPool.getDefault().get("java.util.Set");
		CtClass hashSetClass = ClassPool.getDefault().get("java.util.HashSet");
		
		// Add of instances set attribute
		CtField f = new CtField(setClass, "instances", cc);
		f.setModifiers(Modifier.STATIC | Modifier.PRIVATE);
		cc.addField(f, CtField.Initializer.byNew(hashSetClass));

		// Registration of objects
		CtConstructor[] constructors = cc.getConstructors();
		for (CtConstructor constr : constructors) {
			constr.insertAfter("instances.add(this);");
		}
		
		// Override of free method
		CtMethod freeMethod = new CtMethod(CtClass.voidType, "free", null, cc);
		freeMethod.setModifiers(Modifier.PUBLIC);
		freeMethod.setBody("instances.remove(this);");
		cc.addMethod(freeMethod);

		// Override of getInstances method
		CtMethod getInstancesMethod = new CtMethod(setClass, "getInstances", null, cc);
		getInstancesMethod.setModifiers(Modifier.PUBLIC);
		getInstancesMethod.setBody("return instances;");
		cc.addMethod(getInstancesMethod);
	}

	/**
	 * Called when this event listener is added to the loader.
	 */
	@Override
	public void start(ClassPool arg0) throws NotFoundException, CannotCompileException {

	}

}
