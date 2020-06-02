gcc -c 00-struct-sizes-1.c `pkg-config --cflags webkit2gtk-4.0` -o 00-struct-sizes-1.o
gcc -c 00-struct-sizes-2.c `pkg-config --cflags webkit2gtk-4.0` -o 00-struct-sizes-2.o
gcc -shared -o 00-struct-sizes.so 00*.o `pkg-config --libs javascriptcoregtk-4.0` `pkg-config --libs webkit2gtk-4.0`
