#include <iostream>
#include <mkl.h>
#include <vector>

const double a = double(0.0001);
const double b = double(0.0001);
const double zero = double(0.0);
const double one = double(1.0);

int main(void) {
    VSLStreamStatePtr s;
    const MKL_INT N = 200;
    int err = VSL_STATUS_OK;

    std::vector<double> v(N);
    v.reserve(N);

    err = vslNewStream(&s, VSL_BRNG_MT19937, 1234567890);
    std::cout << "Error: " << err << std::endl;

    err = vdRngBeta(VSL_RNG_METHOD_BETA_CJA_ACCURATE, s, N, v.data(), a, b, zero, one);
    std::cout << "Error: " << err << std::endl;

    for(int i=0; i < N; ++i)
        std::cout << v[i] << " ";
    std::cout << std::endl;

    err = vslDeleteStream(&s);
    std::cout << "Error: " << err << std::endl;

    MKLVersion Version;
 
    mkl_get_version(&Version);
  
    printf("Major version:           %d\n",Version.MajorVersion);
    printf("Minor version:           %d\n",Version.MinorVersion);
    printf("Update version:          %d\n",Version.UpdateVersion);
    printf("Product status:          %s\n",Version.ProductStatus);
    printf("Build:                   %s\n",Version.Build);
    printf("Processor optimization:  %s\n",Version.Processor);
    printf("================================================================\n");
    printf("\n");
    return 0;
}
