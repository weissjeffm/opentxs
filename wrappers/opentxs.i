/*

  Main file for the opentxs swig wrappers to define any variables 
  common to all wrappers. This is included from each wrapper's OTX_.i

  This was created from the opentsx.i which once contained all wrapper
  directives. Each wrapper has been migrated to its own sub-directory.

*/


%ignore strtoimax;
%ignore strtoumax;

%include "inttypes.i"
%include "std_string.i";
%include "std_vector.i";
%include "std_map.i"
%include "typemaps.i"

typedef int64_t time64_t;

%{
#ifndef IMPORT
#define IMPORT
#endif

#include <string>
#include <vector>
#include <map>

#include "../../include/opentxs/core/crypto/OTCaller.hpp"
#include "../../include/opentxs/core/crypto/OTPassword.hpp"
#include "../../include/opentxs/core/crypto/OTAsymmetricKey.hpp"
#include "../../include/opentxs/core/OTStorage.hpp"
#include "../../include/opentxs/client/OTAPI.hpp"
#include "../../include/opentxs/client/OT_ME.hpp"
#include "../../include/opentxs/client/OTRecord.hpp"
#include "../../include/opentxs/client/OTRecordList.hpp"
    
#ifdef ANDROID
#ifndef imaxdiv
imaxdiv_t imaxdiv(intmax_t numer, intmax_t denom) {
    imaxdiv_t res;
    res.quot=0; res.rem=0;
    while(numer >= denom) {
        res.quot++;
        numer -= denom;
    }
    res.rem = numer;
    return res;
}
#endif

#ifndef imaxabs
intmax_t imaxabs(intmax_t j) {
    return (j < 0 ? -j : j);
}
#endif
#endif

%}

namespace std {
   %template(VectorUnsignedChar) vector<unsigned char>;
   %template(MapStringString) map<string,string>;
};

/* Some of these may actually belong to the Java wrapper?
*/
%newobject CreateObject(StoredObjectType eType);
%newobject QueryObject(StoredObjectType theObjectType, std::string strFolder, std::string oneStr="", std::string twoStr="", std::string threeStr="");
%newobject DecodeObject(StoredObjectType theObjectType, std::string strInput);
%newobject Storage::QueryObject(StoredObjectType theObjectType, std::string strFolder, std::string oneStr="", std::string twoStr="", std::string threeStr="");
%newobject Storage::DecodeObject(StoredObjectType theObjectType, std::string strInput);
%newobject Storage::CreateObject(StoredObjectType eType);
%newobject CreateStorageContext(StorageType eStoreType, PackType ePackType=OTDB_DEFAULT_PACKER);

%ignore OTRecord::operator<(const OTRecord & rhs);
%ignore OTPassword::operator=(const OTPassword & rhs);
%ignore OTPasswordData;
%ignore clone;
%ignore Storable::Create(StoredObjectType eType, PackType thePackType);
%ignore OTPasswordData;
%ignore PackedBuffer;
%ignore OTPacker;
%ignore PackerSubclass;
%ignore Storage::Create(StorageType eStorageType, PackType ePackType);
%ignore stat;
%ignore std::istream;
%ignore std::ostream;
%ignore msgpack::sbuffer;
%ignore std::map<std::string, std::string>;
%ignore stlplus::simple_ptr_clone;


%ignore weak_ptr_OTRecord;

%ignore vec_OTRecordList;
%ignore list_of_strings;
%ignore map_of_strings;


%rename(OTRecordLessThan) opentxs::OTRecord::operator<(const OTRecord& rhs); 

%feature("director") OTCallback;
%feature("director") OTNameLookup;

/* Parse the header file to generate wrappers */

#ifndef EXPORT
#define EXPORT
#endif

%include "../../include/opentxs/core/crypto/OTCaller.hpp"
%include "../../include/opentxs/core/crypto/OTPassword.hpp"
%include "../../include/opentxs/core/crypto/OTAsymmetricKey.hpp"
%include "../../include/opentxs/core/OTStorage.hpp"
%include "../../include/opentxs/client/OTAPI.hpp"
%include "../../include/opentxs/client/OT_ME.hpp"
%include "../../include/opentxs/client/OTRecord.hpp"
%include "../../include/opentxs/client/OTRecordList.hpp"


bool opentxs::OT_API_Set_PasswordCallback(OTCaller & theCaller);
bool opentxs::OT_API_Set_AddrBookCallback(OTLookupCaller & theCaller);


// add the follwing to every .cxx file.
%inline %{
  using namespace opentxs;
  using namespace OTDB;
%}

