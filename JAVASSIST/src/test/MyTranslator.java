package test;

import javassist.CannotCompileException;
import javassist.ClassPool;
import javassist.CtClass;
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
		
		CtClass cc = pool.get(classname);
		
		CtField f = new CtField(CtClass.intType, "nbInstances", cc);
		f.setModifiers(Modifier.STATIC);
		f.setModifiers(Modifier.PRIVATE);
		cc.addField(f);

		CtMethod m = new CtMethod(CtClass.intType, "getNbInstances", null, cc);
		m.setModifiers(Modifier.STATIC);
		m.setModifiers(Modifier.PUBLIC);
		m.setBody("{return nbInstances;}");

		CtMethod mainMethod = cc.getDeclaredMethod("main");
		//mainMethod.insertAfter("");
		
		//CtClass memoInterface = pool.get("test.IMemoObject");
		//cc.addInterface(memoInterface);
	}

	/**
	 * Called when this event listener is added to the loader.
	 */
	@Override
	public void start(ClassPool arg0) throws NotFoundException, CannotCompileException {

	}

}
