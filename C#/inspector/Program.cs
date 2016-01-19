using System;
using System.Reflection;
using System.Collections.Generic;

namespace MetaProg
{
	class MainClass
	{
		public static void Main (string[] args)
		{
			AAA a = new AAA ();
			Console.WriteLine ("Inspector : ");

			Inspector i = new Inspector ();
			i.inspectAllFields (a);
		}
	}

	public class Inspector
	{
		public Inspector ()
		{

		}

		public void inspectAllFields (Object o) {

			Type t = o.GetType();
		
			Dictionary<Type, FieldInfo[]> fieldsD = new Dictionary<Type, FieldInfo[]>();

			var flags = BindingFlags.DeclaredOnly | BindingFlags.Instance | BindingFlags.Public | BindingFlags.NonPublic ;

			FieldInfo[] fields = t.GetFields(flags); 

			fieldsD.Add (t, fields);

			inspectFieldsOfSuperClass (fieldsD, t);

			foreach (var item in fieldsD) {

				Console.WriteLine ("\n\nType : " + item.Key.Name);

				foreach (FieldInfo f in item.Value) {
					Console.Write ("\n\t" + f.ToString() + " - value : " + f.GetValue(o));
				}
			}
		}

		public void inspectFieldsOfSuperClass(Dictionary<Type, FieldInfo[]> fieldsD, Type t) {
				
			Type superT = t.BaseType;

			if (superT != null) {
				var flags = BindingFlags.DeclaredOnly | BindingFlags.Instance | BindingFlags.Public | BindingFlags.NonPublic;
				FieldInfo[] fields = superT.GetFields(flags); 
				fieldsD.Add (superT, fields);
				inspectFieldsOfSuperClass (fieldsD, superT);
			}
		}
	}

	class A
	{
		private int a1 = 0;
		public int a2 = 23;
		protected int a3 = 42;
		int a4 = 2342;
	}

	class AA : A 
	{
		private String aa1 = "super_private";
		public String aa2 = "super_public";
	}

	class AAA : AA
	{
		private String aaa1 = "test_private";
		protected String aaa2 = "test_protected";
		public String aaa3 = "test_public";
		String aaa4 = "package";
	}
}
