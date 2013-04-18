linenoise_example: linenoise.h linenoise.c

linenoise_example: linenoise.c example.c
	$(CC) -Wall -W -Os -g -o linenoise_example linenoise.c example.c

clean:
	rm -f linenoise_example

linenoise_test: t/linenoise_test.h t/linenoise_test.c
	$(CC) -Wall -W -Os -g -o t/linenoise_test t/linenoise_test.c

test:
	prove -lrv t/*.t
