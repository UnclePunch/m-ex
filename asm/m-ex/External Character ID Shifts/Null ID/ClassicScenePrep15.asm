#To be inserted @ 8017cfb0
.include "../../../Globals.s"
.include "../../Header.s"

lwz r12,OFST_Metadata_FtExtNum(rtoc)
cmpw r0,r12
