100 REM LORD OVER IN THE ISLAND  Ver 2.001
110 REM   Feb.11,1985  by Aki
600 FOR I=0 TO VAL(RIGHT$(TIME$,2)):J=RND(1):NEXT
700 WIDTH80,25:CONSOLE0,25,0,1
710 CLEAR 2000:DEFINTA-Z:DEFSTRV
750 DEFFNVK(I)=MID$("-êìëèé",I+1,1)
760 DEFFNVR(I)=RIGHT$("0"+MID$(STR$(I+1),2),2)
770 DEFFNVN(I)=MID$(STR$(I),2)
800 IF INP(1)<255 THEN 1000
900 COLOR7:PRINTCHR$(12);:LINE(79,24)-(-1,0),"í",4,BF
901 DIM T(7),TA(7):FORI=0TO7:T(I)=I:TA(I)=(I+7)*120:NEXT:FORI=0TO100:BEEP1:SWAPT(RND(1)*8),T(RND(1)*8):BEEP0:NEXT
902 LOCATE0,24:PRINT:PRINT:POKE&Hfeb8,ASC("ì"):POKE&Hff07,ASC("ì"):LINE(-1,24)-(79,24),"ì",7:LOCATE0,24:PRINTCHR$(31);
903 COLOR5:PRINT"   ä  ä  
904        PRINT"  äç      
905        PRINT" äç æ  ";:COLOR6:PRINT" PRESENTS
906        PRINT"     A S C I I
907 PRINT" This program was written by Akira Kita.
908 FORI=0TO17:PRINTSTRING$(10,32):NEXT:LINE(-1,24)-(78,24),"",7
909 BEEP1
910 DATA" . äå.å å  .äå  . äçäçå
911 DATA".     .  . .   . . äçäç .  .
912 DATA"  . . ç. .  .    äçäç.ç
913 DATA"      .æå .  . .  äçäç .    æå
914 DATA"æç  .æåç   æç çäç  .æå
915 DATA"IN . THE I SL  AND
916 DATA"  .å . ..  .ä å å
917 DATA"          ç
941 DIM CL(18):V$="1234567654321234567654321":FORI=0TO18:CL(I)=VAL(MID$(V$,I+1,1))*32OR8:NEXT
950 RESTORE910:DIM VV(7):COLOR0:FORI=0TO7:READVV(I):LOCATE0,I+7:PRINTTAB(11)VV(I);:NEXT
961 COLOR6:LOCATE 61,17:PRINT"
962 LOCATE 59,16:PRINT"
963 LOCATE 60,15:PRINT"
964 LOCATE 59,14:PRINT"
965 LOCATE 58,13:PRINT"
966 FORI=12TO6STEP-1:LOCATE 60,I:PRINT"":NEXT
967 LOCATE 60,5:PRINT"äå
968 LOCATE 61,4:PRINT"äå
969 BEEP0:COLOR6:LOCATE 10,17:PRINT"ORIGINAL IDEA: ASCII MAG.1982ò8ó ISSUE62
970 LOCATE 27,18:PRINT"FEATURE OF FANTASTIC STRATEGIE GAME"
972 LOCATE 5,20:COLOR7:PRINT"NOTE: This program changes color on the screen
973 LOCATE12,21:PRINT"for Green Monitor CRT (ex. PC-8050,vds M-100)"
974 LOCATE11,22:PRINT"If you use color monitor CRT and think that colors are too bad,
975 LOCATE12,23:PRINT"then please change color statements in this program,as you want.
976 LOCATE59,2:COLOR7:PRINT"PUSH RET KEY"STRING$(6,29)CHR$(31)"TO START
977 FORI=0TO7:FORJ=0TOI:POKE&Hf353+(J+7)*120,CL(J):NEXT:J=(J+1)MOD12
978 NEXT
980 FORI=0TO7:POKE &Hf353+TA(T(I)),CL(T(I)+J):NEXT
985 J=J-1:IFJ<0THENJ=11
990 IF INP(1)=255 THEN 980
995 ERASE CL,T,TA,VV
1000 GOSUB 7000:GOSUB6000
1010 FORK=1TOKK
1013 IFPL(K)=0THEN1040
1015 PRINTVS;FNVK(K)" É ÊÞÝ":GOSUB6500:KL=K:IFPL(K)=1THEN1020:ELSEGOSUB1720:GOTO1040
1020 GOSUB 2700:GOSUB 3500:GOSUB2800:GOSUB 2000:GOSUB3000:GOSUB1800
1040 NEXT:F=0:FORI=1TOKK:F=F-(B(I)<0):NEXT:IF F=KK-1 THEN 1900
1045 K=KK+1:GOSUB6000:GOTO1010
1050 COLOR7:CONSOLE0,25:LOCATE0,23:END
1700 REM computer player
1720 GOSUB 2700
1730 GOSUB 4000
1740 GOSUB 2800
1750 GOSUB 1800
1760 RETURN
1800 X=RND(1)*MX:Y=RND(1)*KK+1
1805 IFAR(X)=0 ORVM(X)="C"ORKP(X)>0THEN 1850
1810 IF RND(1)/MA(AR(X),X)<0.3THEN1850
1820 IF PL(Y)=0 ORAR(X)=YTHEN 1860
1825 PRINT"³×·ÞØ Ê¯¾²!!!";CHR$(7);CHR$(7);CHR$(7)
1830 PRINT"["FNVK(AR(X))"] É "FNVR(X)" ¶Þ ["FNVK(Y)"] Æ È¶Þ´¯À!!!"CHR$(7)CHR$(7)CHR$(7)
1840 SWAP MA(AR(X),X),MA(Y,X):AR(X)=Y:COLOR7:I=X:C1=7:GOSUB6100:COLOR7:LOCATE0,24:FORI=0TO2000:BEEP1:BEEP0:NEXT
1850 IFRND(1)>0.8THENGOSUB6000:GOTO1870
1860 X=DM(X,DN(X)*RND(1)):GOTO1805
1870 X=RND(1)*MX:IFVM(X)="C"ORKP(X)>0ORAR(X)=0ORRND(1)<0.1THENRETURN
1880 PRINTVA(RND(1)*3)" ¼­Â¹ÞÝ!!!";:BEEP:BEEP:BEEP
1882 PRINT"  ["FNVK(AR(X))"] É "FNVR(X)" Ê";:P=POS(0)
1885 MA(AR(X),X)=MA(AR(X),X)-RND(1)*5:IFMA(AR(X),X)<1 THENMA(AR(X),X)=0:AR(X)=0
1890 SWAPI,X:C1=7:GOSUB6100:SWAPI,X:LOCATEP,24:PRINT MA(AR(X),X)"ÆÝ Æ ÍØÏ¼À¡":FORI=0TO2000:BEEP1:BEEP0:NEXT:GOTO6000
1900 BEEP1:K=KL:GOSUB6000:PRINTVS"    ----- G A M E   E N D -----":BEEP0
1910 PRINT"If you want play more, push [f¥5] key":KEY5,"run"+CHR$(13)
1920 PRINT:END
2000 REM main routine
2010 GOSUB 8500
2020 FORI=0TOMX:WK(I)=0:WW(I)=MA(K,I):NEXT
2050 LOCATE61,11:COLOR7:PRINT"-MOVE INFORMATION-":P=12:LOCATE0,24:LINE(60,P)-(78,19)," ",7,BF
2100 PRINT"Ø¸¼Þ®³¤ Í²À² É ²ÄÞ³"
2200 GOSUB5600:IF X=0 OR Y=0 THEN 2390
2201 X=X-1:Y=Y-1
2205 IF N=0 THEN PRINT"-·¬Ý¾Ù-":BEEP:GOTO 2200
2210 F=1:FOR I=0 TO DN(X)-1:IFDM(X,I)=Y THEN F=0
2220 NEXT:IFFTHENPRINT"- ¿ÝÅÄº ²¶ÚÔ¼Ï¾Ý! -":GOTO2200
2240 IF MA(K,X)+WK(X)-N<1 THEN PRINT"- ÆÝ½Þ³ ¶Þ ÀÞÒ ! -":GOTO2200
2250 PRINT"- O.K. ! -":GOSUB 5000
2370 GOTO2200
2390 PRINT:PRINT"*** µ¼Ï²  OK? ";:V$=INPUT$(1):IFV$="n"THENPRINT"<NO! ¾ÞÝÌÞ ÔØÅµ¼>":FORI=0TOMX:MA(K,I)=WW(I):NEXT:GOSUB6000:GOTO2010:ELSEPRINT"<YES>"
2394 GOSUB5200:GOTO 2500' idou wa arukinomi!
2395 IF MO(K)<80 THEN 2492
2400 PRINTVT(0)"¤ Í²À² É ²ÄÞ³"
2410 LOCATE0,24:X=-1:Y=-1:N=-1:INPUT"from(XX),to(YY),ninzu(NN) [RET]=END";X,Y,N
2420 X=X-1:Y=Y-1:IFX<0ORY<0ORN<0THEN 2492
2430 IF X>MX OR Y>MX OR N>20THENPRINT"ÀÞÒ!":GOTO2410:ELSEIFVM(X)<>"T"ORMA(K,X)<=NTHENPRINT"ÀÞÒ!":GOTO2410
2440 IF DM(X,DN(X)-1)<>MX OR DM(Y,DN(Y)-1)<>MX THENPRINT"ÀÞÒ!":GOTO2410
2445 YY=Y
2446 IFRND(1)<0.4THENY=DM(YY,DN(YY)*RND(1)):IFDM(Y,DN(Y)-1)<>MXTHENY=YY:GOTO2446
2450 GOSUB5005
2490 PRINT"²ÄÞ³  OK?";:V$=INPUT$(1):PRINT:IFV$="n"THENFORI=0TOMX:MA(K,I)=WW(I):NEXT:GOSUB6000:GOTO2010
2491 MO(K)=MO(K)-80:GOSUB 8500
2492 IF MO(K)<40 OR(AR(13)<>K AND AR(28)<>K)THEN 2500
2493 PRINTVT(1)"¤ Í²À² É ²ÄÞ³"
2494 LOCATE0,24:X=-1:Y=-1:N=-1:INPUT"from(XX),to(YY),ninzu(NN) [RET]=END";X,Y,N
2495 X=X-1:Y=Y-1:IFX<0ORY<0ORN<0THEN 2500
2496 IF X>MX OR Y>MX OR N>10THENPRINT"ÀÞÒ!":GOTO2494:ELSEIFVM(X)<>"T"ORVM(Y)<>"T"ORMA(K,X)<=NTHENPRINT"ÀÞÒ!":GOTO2494
2497 IF RND(1)<0.4 THEN YY=RND(1)*MX:GOSUB 5000 :ELSE GOSUB5000
2498 MO(K)=MO(K)-40
2499 PRINT"²ÄÞ³  OK?";:V$=INPUT$(1):PRINT:IFV$="n"THENFORI=0TOMX:MA(K,I)=WW(I):NEXT:GOSUB6000:GOTO2010
2500 LINE(60,11)-(78,19)," ",7,BF:P=11:FOR I=0 TO MX:IFWK(I)=0THEN2680
2520 MA(K,I)=MA(K,I)+WK(I)
2530 IF AR(I)=0 THEN AR(I)=K:GOTO2670
2540 IF AR(I)=K THEN 2670
2545 C1=7:GOSUB6100:COLOR7:LOCATE0,24
2550 IF P=11 THENLOCATE61,11:PRINT"FIGHT INFROMATION";:P=P+1
2560 'IF P>19 THEN GET@(60,13)-(78,19),WK:PUT@(60,12)-(78,18),WK:LOCATE60,19:PRINTTAB(78)
2570 LOCATE61,P:PRINT"FIGHTING AT "FNVR(I);:LOCATE0,24:PRINT:PRINT
2580 K1=MA(AR(I),I):K2=MA(K,I)
2590 IF 2/AT(TM(I))/K1*K2*RND(1)>1 THEN K1=K1-1:GOSUB2695:IFK1=0THENV="VICTORY!":MA(AR(I),I)=0:AR(I)=K:MA(K,I)=K2:CL=6:GOTO2697
2600 IF AT(TM(I))*2/K2*K1*RND(1)>1 THEN K2=K2-1:GOSUB2695:IFK2=0THENV=" LOSE...":MA(K,I)=0:MA(AR(I),I)=K1:CL=5:GOTO2650
2610 GOTO2590
2650 PRINT:PRINTV:BEEP:COLOR7:LOCATE61,P:PRINT"AT "FNVR(I)" "V;:P=P+1
2670 C1=6:GOSUB6100:COLOR7:LOCATE0,24
2680 NEXT
2690 GOTO8500
2695 LOCATE0,23:PRINT"FIGHTING OFFENCE DEFFENCE"
2696 LOCATE4,24:PRINTUSING"AT &&   ### :###";FNVR(I);K2,K1;:BEEP:RETURN
2697 F=KP(I):FORJ=1TOKK:IFB(J)=ITHENF=J
2698 NEXT:IFF=0THEN2650:ELSEB(F)=-1:PL(F)=0:MO(K)=MO(K)+MO(F):FORJ=0TOMX:IFAR(J)=FTHENAR(J)=K:MA(K,J)=MA(K,J)+MA(F,J):MA(F,J)=0
2699 NEXT:SWAPWI,I:GOSUB6000:GOSUB8500:SWAPWI,I:GOTO2650
2700 REM zeikin chuoshuu
2710 PRINT"¾Þ²·Ý É Á®³¼­³ ¦ µºÅ²Ï½":BEEP
2720 J=0:FORI=0TOMX:IFAR(I)=KTHENJ=J+Z(TM(I)):NEXT:ELSENEXT
2730 MO(K)=MO(K)+J:PRINT"** ¿³¶Þ¸:"J,"¸ÞÝ¼·Ý ºÞ³¹²:"MO(K)
2740 GOSUB8500
2750 X=RND(1)*MX:IF AR(X)=K AND VM(X)="D" THEN BEEP:BEEP :ELSERETURN
2760 PRINT" The Desert at "FNVR(X)" ÆÃ ÈÑ¯Ã²À »Þ²Î³ ¶Þ Ê¯¹Ý»ÚÀ!"
2770 J=INT(RND(1)*100)+20:GOTO2730
2800 PRINT"Í²À² É ·­³Ø®³ ¼Ê×²"
2810 GOSUB 8500:IFMO(K)<JTHENPRINT"¶È ¶Þ ÀØÅ²!":IFPL(K)=1THENGOSUB3500:GOTO2800:ELSEGOSUB 4800:GOTO2810
2820 MO(K)=MO(K)-J:PRINT"** ¼Ê×² ·Ý¶Þ¸:"J:GOSUB 8500
2830 RETURN
3000 IF MO(K)=0THEN RETURN
3005 PRINT"Í²À² ¦ ÔÄ²Ï½¶ ?";
3007 V=INPUT$(1):IFV="n"ORV=CHR$(13)THENPRINT" <No!>":RETURN:ELSEIFV<>"y"THEN3007
3010 PRINT"<Yes>":P=0:FORI=0TOMX:IF KP(I)=K THEN P=I :ELSE NEXT
3030 LIM=MO(K):PRINT"ÅÝÆÝ? ";:GOSUB5800:IFN=0THENPRINT"-·ÔÝ¾Ù-":GOTO3000
3040 MA(K,P)=MA(K,P)+N:MO(K)=MO(K)-N:GOSUB8500:I=P:GOSUB6100
3060 RETURN
3500 PRINT"Í²À² ¦ LAY OFF(¶²º) ¼Ï½¶ ?";
3505 V=INPUT$(1):IFV="n"ORV=CHR$(13)THENPRINT" <No!>":RETURN:ELSEIFV<>"y"THEN3505
3510 PRINT"<Yes>":LIM=MX+1:PRINT"ÄÞºÃÞ? ";:GOSUB5800:IFN=0THENPRINT"-·¬Ý¾Ù-":GOTO3500
3520 P=N-1:IF AR(P)<>KORMA(AR(P),P)<2THEN PRINT"ÀÞÒ!":GOTO3500
3530 LIM=MA(K,P)-1:PRINT"ÅÝÆÝ? ";:GOSUB5800:IFN=0THENPRINT"-·¬Ý¾Ù-":GOTO3500
3540 MA(K,P)=MA(K,P)-N:I=P:GOSUB6100
3560 GOTO 3500
4000 ERASEW1,W2:DIMW1(MX),W2(MX):FORI=0TOMX-1:IFAR(I)<>KTHEN4080
4010 FORJ=1TOKK:WW(J)=0:NEXT:FORJ=0TODN(I)-1:N=DM(I,J):IFN<>MXTHENWW(AR(N))=WW(AR(N))+MA(AR(N),N):IFAR(N)<>KTHENW2(I)=1
4020 NEXTJ:L=0:FORJ=1TOKK:IFL<WW(J)ANDJ<>KTHENL=WW(J):NEXT:ELSENEXT
4050 W1(I)=MA(K,I)-L/AT(TM(I))-1:IFW1(I)=0 THEN W1(I)=-RND(1)*3
4080 NEXTI
4099 REM OTASUKE check
4100 ERASEWK:DIMWK(MX)
4110 FORI=0TOMX:IFAR(I)<>KTHEN4290
4120 IF W1(I)=0THEN4290
4130 IF W1<0 THEN4290
4140 FORJ=0TODN(I)-1:N=DM(I,J):IFW1(N)>=0ORW1(I)<=0THEN4190
4150 IF W1(N)+W1(I)<0 THEN M=W1(I) :ELSE M=-W1(N)
4160 W1(I)=W1(I)-M:W1(N)=W1(N)+M:MA(K,I)=MA(K,I)-M:WK(N)=WK(N)+M
4190 NEXTJ
4199 REM shinryaku check
4200 IF W1(I)=<0THEN4290
4210 FORJ=0TODN(I)-1:N=DM(I,J):IFN=MX ORAR(N)=KORW1(I)<=0THEN4280
4220 IF AR(N)=0 THEN M=(W1(I)-1)*SQR(RND(1))+1:WK(N)=WK(N)+M:MA(K,I)=MA(K,I)-M:W1(I)=W1(I)-M:GOTO4280
4230 M=MA(AR(N),N)*AT(TM(N))+1:IF W1(I)>M OR(MA(K,I)>M AND VM(N)="C")THEN WK(N)=WK(N)+M:MA(K,I)=MA(K,I)-M:W1(I)=W1(I)-M
4280 NEXTJ:IF W1(I)<=0 THEN 4285
4282 N=DM(I,RND(1)*DN(I)):IFAR(N)=KANDN<>MXAND((W2(I)=0ANDW2(N)<>0)ORRND(1)<0.3)THENWK(N)=WK(N)+W1(I):MA(K,I)=MA(K,I)-W1(I):W1(I)=0 :ELSEIF RND(1)<0.8 THEN4282
4285 COLOR6:GOSUB6100:COLOR7:LOCATE0,24
4290 NEXTI
4300 GOSUB8500:J=MO(K)-J:IFJ=<1THEN 4590
4310 FORI=0TOMX-1:IFJ<=1OR AR(I)<>K ORW1(I)>=0THEN4390
4315 IF INSTR("CTA",VM(I))=0 THEN 4390
4320 IF -W1(I)<J THEN WK(I)=WK(I)-W1(I):J=J+W1(I):W1(I)=0
4390 NEXTI
4590 GOTO 2500
4800 J=J-MO(K)
4810 N=RND(1)*MX:IF AR(N)<>K THEN 4810
4820 IF J<MA(K,N) THEN MA(K,N)=MA(K,N)-J:GOTO6000
4830 J=J-MA(K,N)+1:MA(K,N)=1:GOTO4810
5000 YY=Y
5005 WK(YY)=WK(YY)+N:MA(K,X)=MA(K,X)-N:I=X:COLOR6:GOSUB6100:COLOR7
5010 LOCATE61,P:COLOR7:IFP=19THENPRINT" continue...";:GOTO5030
5020 PRINT"FROM";:COLOR6:PRINTFNVR(X);:COLOR7:PRINT" TO";:COLOR6:PRINTFNVR(Y);:COLOR7:PRINTUSING"####ÆÝ";N;:P=P+1
5030 LOCATE0,24:RETURN
5200 LIM=MX+1:PRINT"KING É ²ÄÞ³":FOR I=0 TO MX:IF KP(I)=KTHENN=I
5210 NEXT
5220 '
5230 X=N:PRINT"    ÄÞºÍ? ";:GOSUB5800:IF N=0 THEN PRINT" ¿ÉÏÏ ³ºÞ¶Å².... O.K":RETURN
5240 N=N-1:F=1:FOR I=0 TO DN(X)-1:IFDM(X,I)=N THEN F=0
5250 NEXT:IFF ORAR(N)<>KTHENPRINT"- ¿ÝÅÄº ²¶ÚÔ¼Ï¾Ý! -":GOTO5200
5260 SWAP KP(X),KP(N):I=N:GOSUB6100:I=X:GOTO6100
5600 LIM=MX  :PRINT"*²ÄÞ³*ðð ÄÞº¶×? ";:GOSUB5700:X=N
5610 IFX=0THEN5670
5630 PRINT :  PRINT"*     ðð ÄÞºÍ? ";:GOSUB5700:Y=N
5640 IFY=0 THEN 5670
5650 LIM=MA(K,X-1)
5660 PRINT :  PRINT"*     ðð ÅÝÆÝ? ";:GOSUB5700
5670 PRINT:RETURN
5700 VN=""'input num
5710 V$=INPUT$(1):IF V$=>"0" AND V$<="9" THEN 5730 :ELSE IF V$=CHR$(13) THEN N=VAL(VN):POKE&Hf301+POS(0)+CSRLIN*120,29:RETURN :ELSE IF V$=CHR$(8) AND LEN(VN)>0 THEN PRINTCHR$(29)" "CHR$(29);:VN=LEFT$(VN,LEN(VN)-1):GOTO5710
5720 BEEP:GOTO5710
5730 IF VAL(VN+V$)>LIM THEN 5720
5740 PRINTV$;:VN=VN+V$:GOTO5710
5800 GOSUB5700:PRINT:RETURN
6000 C1=6:FOR I=0 TO MX-1
6010 GOSUB 6100:NEXT
6090 COLOR7:LOCATE0,24:RETURN
6100 REM
6200 IF AR(I)=K THEN COLOR5 :ELSE COLOR7
6205 LOCATE XM(I),YM(I):PRINTRIGHT$("0"+MID$(STR$(I+1),2),2);VM(I);:COLORC1:IFKP(I)ANDPL(KP(I))=1THENPRINT" K ";:ELSEPRINT"   ";
6210 LOCATE XM(I),YM(I)+1
6220 PRINT"["FNVK(AR(I))"]";
6230 PRINTUSING"###";MA(AR(I),I);
6290 GOTO6090
6500 FOR I=0 TO MX-1' SEEING COLOR
6510 IF AR(I)=K THEN COLOR5 :ELSE COLOR7
6520 LOCATE XM(I),YM(I):PRINTRIGHT$("0"+MID$(STR$(I+1),2),2);VM(I);
6530 NEXT:GOTO6090
7000 WIDTH40:PRINTCHR$(12)"Working-":MX=33:DIM VM(MX),TM(MX),XM(MX),YM(MX),DN(MX),DM(MX,9),WK(MX),WW(MX),W1(MX),W2(MX)
7001 KK=5:DIM MA(KK,MX),B(KK),AR(MX),KP(MX),AT(6),MO(KK),T(7),PL(KK),VT(1),VA(2)
7005 RESTORE 9200
7010 FORI=0TOMX
7020 READVM(I),XM(I),YM(I),DN(I):FORJ=0TODN(I)-1:READDM(I,J):NEXT
7030 TM(I)=INSTR("CTADWMS",VM(I))
7040 NEXT
7110 DATA 0,17,30,4,12
7120 RESTORE7110:FORI=1TOKK:READB(I):AR(B(I))=I:KP(B(I))=I:NEXT
7150 DATA 5,1,2,1,3,4
7160 RESTORE7150:FORI=1TO6:READAT(I):NEXT
7210 FOR I=1 TO KK:MO(I)=100:NEXT
7240 VS=CHR$(13)+STRING$(10,10)
7250 DATA 1,7,5,1,3,2,0
7260 RESTORE7250:FORI=1TO7:READZ(I):NEXT
7300 DATA SHIP(¶²¼Þ®³),FLYING SHIP(º³¸³)
7310 RESTORE7300:READ VT(0),VT(1)
7330 DATA Ö³¶²,ËÄ¸² µµÄØ,¶²ÌÞÂ Ó¸Þ×
7340 READ VA(0),VA(1),VA(2)
7500 WIDTH80:OUT81,0:GOSUB8100:GOSUB6000:GOSUB8500:WIDTH,:LOCATE0,24:BEEP:BEEP:PRINTVS"HELLO! I'm a program written by Akie, named ¢LORD OVER IN THE ISLAND£"
7510 COLOR7:PRINT:PRINT" ÆÝ¹ÞÝ »Ï É PLAYER Ê ÅÝÆÝ ÃÞ½¶? ";:LIM=5:GOSUB5700:
7520 FORI=1TOKK:PL(I)=2:NEXT:IF N>0 THEN FOR I=(KK-N)+1TOKK:PL(I)=1:NEXT
7530 FORK=1TOKK:GOSUB6500:PRINTVS;K"ÊÞÝÒ  Ï°¸ Ê ["FNVK(K)"] ÃÞ½":GOSUB8500:LOCATE0,24
7540 N=20:IFPL(K)=2THENPRINT"["FNVK(K)"] Ê"N"ÆÝ ÔÄ²Ï¼À":GOTO7560
7545 LIM=MO(K):PRINT"ÅÝÆÝ É ËÄ ¦ ÔÄ²Ï½¶? ";:GOSUB5700
7550 IF N=0 THEN PRINT"ÀÞÒ!!":GOTO7545
7560 MO(K)=MO(K)-N:MA(K,B(K))=N:I=B(K):GOSUB6100:NEXT
7570 PRINT VS"»§ »§¤ ÄÞ³×Ý É ¾ÝºÞ¸ ¼ÞÀÞ²¤ Ê¼ÞÏØ Ê¼ÞÏØ !!!"
7990 RETURN
8100 CONSOLE0,25:COLOR7:PRINTCHR$(12);:RESTORE 8720
8130 COLOR7:FORI=0TO19:READV$:PRINTV$:NEXT:COLOR7
8150 FORI=0TO19:POKE&Hf300+I*120,135:LINEI,2:NEXT
8165 LINE(60,0)-(78,5)," ",6,BF:LINE(60,6)-(78,19)," ",7,BF
8200 COLOR6:RESTORE8210:FORI=0TO5:READV:LOCATE61,I:PRINTV;:NEXT
8210 DATA"C:castle (¼Û)D5T1"
8220 DATA"T:town   (ÏÁ)D1T7"
8230 DATA"A:aglicu(É³Á)D2T5"
8240 DATA"D:desart(±ÚÁ)D1T1"
8250 DATA"W:woods  (ÓØ)D3T3"
8260 DATA"M:mountai(ÔÏ)D4T2"
8265 COLOR7
8270 LOCATE60,6 :PRINT"";
8280 LOCATE60,7 :PRINT"PLAYER [ ] É  ÊÞÝ";
8290 LOCATE60,8 :PRINT"   ¸ÞÝ¼·Ý:     _ ";
8300 LOCATE60,9 :PRINT"   ¿³Í²½³:     _ ";
8310 LOCATE60,10:PRINT"";
8480 CONSOLE 20,5:COLOR7
8499 RETURN
8500 COLOR7:LOCATE61,7:PRINTUSING"PLAYER [!] É  ÊÞÝ";FNVK(K);
8510 LOCATE64,8:PRINTUSING"¸ÞÝ¼·Ý:######";MO(K);
8520 J=0:FORI=0TOMX:J=J+MA(K,I):NEXT
8530 LOCATE64,9:PRINTUSING"¿³Í²½³:######";J;
8540 LOCATE0,24:RETURN
8700 REM  000000000011111111112222222222333333333344444444445555555555
8710 REM  012345678901234567890123456789012345678901234567890123456789
8720 DATA""
8730 DATA"çC#####æç      æ"
8740 DATA" ######A#####A##### æ     W#####æç   C##### "
8750 DATA"############   ######  æç   ###### "
8760 DATA"çA#####A##### å      ä"
8770 DATA" ###### A##### W#####D#####M########### æ"
8780 DATA" ###### ############ ######æ"
8790 DATA"ç       æä#åA##### "
8800 DATA" C#####  T##### A##### #  M##### W########### "
8810 DATA"å###### å###### ###### å###### ######  ç     "
8820 DATA"#çç C##### "
8830 DATA"ç           A##### M#####  W##### å######ä"
8840 DATA" W#####A########### D########### ###### æ  "
8850 DATA" ##################   æ"
8860 DATA"   W#####A#####A#####äç   "
8870 DATA"   W#####  ######T#################æ       æ"
8880 DATA"ç ######  å ######äæ M##### "
8890 DATA"çC#####   ä#çW##### D#####  ###### "
8900 DATA"å###### ä   ###### ######äå ä"
8910 DATA""
9000 REM  T,X,Y,N,link,SEA
9200 DATA C,5,1,3,1,5,33
9201 DATA A,12,2,5,0,2,5,7,33
9202 DATA A,19,2,6,1,7,8,9,3,33
9203 DATA W,34,2,5,2,9,10,6,33
9204 DATA C,51,2,2,6,33
9205 DATA A,4,4,4,0,1,7,33
9206 DATA A,42,4,5,3,10,11,4,33
9207 DATA A,12,5,7,1,2,8,14,13,5,33
9208 DATA W,20,5,5,2,7,14,9,33
9209 DATA D,27,5,6,2,8,10,3,15,33
9210 DATA M,35,5,7,9,3,6,11,16,19,33
9211 DATA A,45,7,5,6,10,16,20,33
9212 DATA C,2,8,2,13,33
9213 DATA T,11,8,4,7,12,14,33
9214 DATA A,19,8,6,7,8,13,15,18,33
9215 DATA M,29,8,4,9,14,19,33
9216 DATA W,38,8,4,10,11,20,19
9217 DATA C,52,10,2,29,33
9218 DATA A,19,11,6,14,19,23,24,22,33
9219 DATA M,34,11,9,18,15,10,16,20,26,25,23,33
9220 DATA W,43,11,6,11,19,16,29,26,33
9221 DATA W,4,12,3,22,27,33
9222 DATA A,11,12,5,18,24,27,21,33
9223 DATA D,27,12,5,19,25,28,24,18
9224 DATA W,20,14,6,27,22,18,23,28,33
9225 DATA A,34,14,5,23,19,26,28,33
9226 DATA A,41,14,6,25,19,20,29,32,33
9227 DATA W,9,15,5,30,21,22,24,33
9228 DATA T,27,15,5,24,23,25,31,33
9229 DATA M,52,16,4,26,20,17,33
9230 DATA C,2,17,2,27,33
9231 DATA W,34,17,3,28,31,33
9232 DATA D,43,17,3,26,31,33
9233 DATA S,70,0,1,33
