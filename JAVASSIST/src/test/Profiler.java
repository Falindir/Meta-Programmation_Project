package test;

import javassist.ClassPool;

import javassist.Loader;
import javassist.Translator;

public class Profiler {

    public static void main(String[] args) throws Throwable {
    
    	/**
    	 * Doc : http://jboss-javassist.github.io/javassist/tutorial/tutorial.html
    	 * Instrumentation : http://artisan.karma-lab.net/javassist-et-instrumentation-dynamique
    	 * 
    	 * export CLASSPATH=.:javassist.jar
    	 * Compilation : javac *.java
    	 * Exécution : java test.Profiler
    	 */
    	
    	Translator t = new MyTranslator();
    	ClassPool pool = ClassPool.getDefault();
    	
        Loader cl = new Loader();
        //cl.loadClass("test.Point");
        
        cl.addTranslator(pool, t);
        cl.run("test.Point", args);
    }
}
