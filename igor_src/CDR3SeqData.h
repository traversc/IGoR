
/** 
 * \class CDR3SeqData CDR3SeqData.h
 * \brief Class to store CDR3 information of a sequence.
 * \author C. Olivares
 * 
 */

#ifndef CDR3SEQDATA_H
#define CDR3SEQDATA_H

#include <string>
#include <sstream>

class CDR3SeqData {
public:
    CDR3SeqData();
    //CDR3SeqData(const CDR3SeqData& orig);
    virtual ~CDR3SeqData();
    int seq_index;
    int v_anchor;
    int j_anchor;
    std::string CDR3nt;
    std::string CDR3aa;
    std::string v_call;
    std::string j_call;
    int v_offset;
    int j_offset;
    bool b_functional;
    bool b_in_frame;
    bool b_stop_codon;
    std::string strData();
    std::string strData_full();

private:

};

#endif /* CDR3SEQDATA_H */

