#include <iostream>

extern "C"
{
    void* md5sum()
    {
  		std::cout << "plop from plugin" << std::endl;
    }
}
