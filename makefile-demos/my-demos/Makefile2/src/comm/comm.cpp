#include "../include/comm.h"

std::string trim(std::string &strIn) {
    std::string tmp = "";
    strIn.erase(strIn.find_last_not_of(tmp)+1,strIn.size()-strIn.find_last_not_of(tmp));
    strIn.erase(0,strIn.find_first_not_of(tmp));
    return strIn;
}
