# How to build SDL applications on Windows
build.bat will get you started compiling an [SDL](http://libsdl.org) application with Visual C++. Make sure you create your `main()` function like so:

`int main(int argc, char* argv[])`

If you want explanations...

### vcvars64.bat
This sets necessary environment variables for running the `cl.exe` compiler. The location of this file can vary, so you might have to search around for yours. There are other choices, but for standard 64bit builds, this is my go-to.

### copy
Putting the .lib files in your build directory is the easiest way to ensure successful compilation. Likewise, putting the .dll files there is the easiest way to ensure your generated .exe runs successfully.

### /I
This tells the compiler where to find the SDL header files. Without it, you'll get something like:

`fatal error C1083: Cannot open include file: 'SDL.h': No such file or directory`

### /link
This tells the compiler to tell the linker to generate either a Windows (`/Subsystem:Windows`) or Console (`/Subsystem:Console`) application. (The latter will let you see the output of things like `printf()`) Without this, the linker might default to an unsuccessful configuration, giving you an error like:

`LINK : fatal error LNK1561: entry point must be defined`

### SDL2.lib
This links against the core SDL2 library. Without it you might see something like:

`error LNK2019: unresolved external symbol SDL_Init`

### SDL2main.lib
This links against the SDL2main library, which uses some sleight-of-hand to ensure your `main()` function works (the aforementioned required definition ensures the magic works). Without it you might see something like:

`error LNK2019: unresolved external symbol WinMain`

### Shell32.lib
This links against the Windows library for `shellapi.h`, which [SDL now uses](https://hg.libsdl.org/SDL/rev/a1917148d38a) for parsing command line arguments. Without it you might see something like:

`error LNK2019: unresolved external symbol __imp_CommandLineToArgvW referenced in function main_getcmdline`




