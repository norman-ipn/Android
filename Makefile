run: android
	./android

android: lex.yy.o gramatica.tab.o
	gcc lex.yy.o gramatica.tab.o -o android -ll -ly 


lex.yy.c: tokens.l
	flex tokens.l

gramatica.tab.c: gramatica.y
	bison -d gramatica.y

gramatica.tab.h: gramatica.y
	bison -d gramatica.y

lex.yy.o: lex.yy.c gramatica.tab.h
	gcc -c lex.yy.c

gramatica.tab.o: gramatica.tab.c
	gcc -c gramatica.tab.c


clean:
	rm lex.yy.c
	rm lex.yy.o
	rm gramatica.tab.c
	rm gramatica.tab.h
	rm gramatica.tab.o
	rm android
	
