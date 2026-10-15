test6bis:
	jjdoc test6bis.jj
	javacc test6bis.jj
	javac *.java
	java -cp . asig2maqPila
test6:
	jjdoc test6.jj
	javacc test6.jj
	javac *.java
	java -cp . expr2maqPila
test5:
	jjdoc test5.jj
	javacc test5.jj
	javac *.java
	java -cp . expr2post
test4:
	jjdoc test4.jj
	javacc test4.jj
	javac *.java
	java -cp . exprEval
test3bis:
	jjdoc test3bis.jj
	javacc test3bis.jj
	javac *.java
	java -cp . exprRead2
test3:
	jjdoc test3.jj
	javacc test3.jj
	javac *.java
	java -cp . exprRead
test2:
	jjdoc test2.jj
	javacc test2.jj
	javac *.java
	java -cp . par2llaves
test1:
	jjdoc test1.jj
	javacc test1.jj
	javac *.java
	java -cp . parEqui
clean:
	$(RM) *.class
	$(RM) *.java
	$(RM) *~
run1:
	java -cp . parEqui
run2:
	java -cp . par2llaves
run3:
	java -cp . exprRead 
run3bis:
	java -cp . exprRead2 
run4:
	java -cp . exprEval 
run5:
	java -cp . expr2post
run6:
	java -cp . expr2maqPila
run7:
	java -cp . sent2maqPila
run7bis:
	java -cp . sent2maqPila
