module testMeta

redef class Sys

	var instances = new HashMap [ String , Array [MemoObject] ]
	
end	

class MemoObject
	
	init
	do
		register
	end
	
	fun getInstance : Array[ MemoObject ] is abstract 
	fun register is abstract
	fun free is abstract
	
	fun getClassName : String is abstract
	
end

class Person
	super MemoObject
		
	init
	do
		print "Creation d'un object Person  : {self}"
	end
	
	redef fun register
	do 	
		if not sys.instances.has_key(getClassName) then
			sys.instances[getClassName] = new Array[ MemoObject ]
			#print "false"
		else
			#print "true"	
		end
		
		sys.instances[getClassName].add(self)
	end
	
	redef fun free
	do
		print "Free instance {self}"
		sys.instances[getClassName].remove(self)
	end
	
	redef fun getInstance
	do
		return sys.instances[getClassName]
	end
	
	redef fun getClassName : String 
	do
		return "Person"
	end
	
end		
		
var mo1 = new Person
print "Instances Person {mo1.getInstance}"

print ""

var mo2 = new Person
print "Instances Person {mo2.getInstance}"

print ""

mo1.free
print "Instances Person {mo2.getInstance}"

print "\nEND"

