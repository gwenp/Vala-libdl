#include <iostream>

extern "C"
{
    void* echoTest()
    {
  		std::cout << "plop from plugin" << std::endl;
    }
}
