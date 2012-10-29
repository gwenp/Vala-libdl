[CCode (cname="dlopen")]
extern unowned void *dlopen(string filename, int flag);
[CCode (cname="dlerror")]
extern unowned string dlerror();
[CCode (cname="dlsym")]
extern unowned void *dlsym(void *handle, string symbol);

const int RTLD_LAZY = 0x00001; /* Lazy function call binding. */

delegate unowned uchar*EchoTest();
EchoTest echoTest = null;

int main(string[] args) {

	// dynamic load from shared library
	
    // begin load and link
    string plugin_path = "./plugin.so";

    stdout.printf("Load %s\n", plugin_path);
 
    var module = dlopen(plugin_path, RTLD_LAZY);
    if (module == null) {
        stdout.printf("error: %s\n", dlerror());
        return 1;
    }
 
    echoTest = (EchoTest) dlsym(module, "echoTest");
    if (echoTest == null) {
        stdout.printf("error: %s\n", dlerror());
        return 1;
    }
    // end load and link
  
    echoTest();
    return 0;
}