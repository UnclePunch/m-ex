#To be inserted @ 80168c10
.include "../../Globals.s"
.include "../Header.s"

.set REG_Count, 29

Original:
  mr	REG_Count, r3



# get easter egg index
 addi  r3,rtoc,OFST_EasterEgg
 lbzx r3,r3,REG_Count
 extsb r3,r3
 cmpwi r3,-1
 beq  Exit

backup

# easter egg active, get the stock icon for it
  bl  StockIDs
  mflr  r4
  lbzx  r3,r3,r4

CastToFloat:
 xoris r3,r3,0x8000
 lfd	f1, -0x35F8 (rtoc)
 stw r3,0x84(sp)
 lis r3,0x4330
 stw r3,0x80(sp)
 lfd f2,0x80(sp)
 fsubs f1,f2,f1
 
 restore
 branch r12,0x80168c40

StockIDs:
blrl
.byte 8 #furby
.byte 7 #dog
.byte 6 #kabi
.align 2

Exit:
  mr r3,REG_Count