[CCode (cname="dlopen")]
extern unowned void *dlopen(string filename, int flag);
[CCode (cname="dlerror")]
extern unowned string dlerror();
[CCode (cname="dlsym")]
extern unowned void *dlsym(void *handle, string symbol);

const int RTLD_LAZY = 0x00001; /* Lazy function call binding. */

delegate unowned uchar*Chksum();
Chksum md5sum = null;

int main(string[] args) {

	// dynamic load from shared library
	
    // begin load and link
    string md5sum_lib_path = "./md5sum.so";

    stdout.printf("Load %s\n", md5sum_lib_path);
 
    var module = dlopen(md5sum_lib_path, RTLD_LAZY);
    if (module == null) {
        stdout.printf("error: %s\n", dlerror());
        return 1;
    }
 
    md5sum = (Chksum) dlsym(module, "md5sum");
    if (md5sum == null) {
        stdout.printf("error: %s\n", dlerror());
        return 1;
    }
    // end load and link
  
    stdout.printf("1[%s]\n", (string) md5sum() );
    return 0;
}