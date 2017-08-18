#ifndef UTILS_LIBRARY_H
#define UTILS_LIBRARY_H

class Utils {
private:
    int mProjectID;

public:
    Utils(int);
    ~Utils();

    template <typename T> int generateInputData(T * data);
};

#include "Utils.hpp"
#endif