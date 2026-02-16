#include <stdalign.h>

int main() {
    alignas(16) char buffer[64];
    // Use the buffer for some purpose
    return 0;
}
