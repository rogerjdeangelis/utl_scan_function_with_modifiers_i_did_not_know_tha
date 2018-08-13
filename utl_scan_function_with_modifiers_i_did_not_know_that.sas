Scan function with modifiers I did not know that

see github
https://tinyurl.com/yb6j378l
https://github.com/rogerjdeangelis/utl_scan_function_with_modifiers_i_did_not_know_that

see
https://tinyurl.com/y9ryhzzh
http://support.sas.com/documentation/cdl/en/lrdict/64316/HTML/default/viewer.htm#a000214639.htm

K Sharp profile
https://communities.sas.com/t5/user/viewprofilepage/user-id/18408

WORK.HAVE total obs=10
                                                      |        RULES
   ID     CODES                                       |    ID     SINGLE_CODE
                                                      |
  0122    WESXQI3C, BOUX17Q9, WESXYBWF                |   0122    WESXQI3C
                                                      |   0122    BOUX17Q9
                                                      |   0122    WESXYBWF
                                                      |
  4512    DENX9UPH; BLUX8Z3F; DENXDQQ3                |
  2183    MOUNTADA,   BROWND01, BROWND03              |
  0122    CLARD                                       |
  0130    BAXXB3OQ, BAXXKEQD BAXXEIAG                 |
  0130    HUNTPA1                                     |
  5221    MERXKIEI, MERXDW49,                         |
  2183    LANX8M83, PROXEAKO, PROXEXMK, AABXJ2G7      |
  4611    WEBXA56H, GERXDQN9 AEWEB GERXERSG JOYWEB    |
  5251    DAWXR5D1                                    |


EXAMPLE OUTPUT
-------------

 WORK.WANT total obs=26

          SINGLE_
   ID     CODE

  0122    WESXQI3C
  0122    BOUX17Q9
  0122    WESXYBWF
 ...
  4512    DENX9UPH
  4512    BLUX8Z3F
  4512    DENXDQQ3

  4611    WEBXA56H
  4611    GERXDQN9
  4611    AEWEB
  4611    GERXERSG
  4611    JOYWEB

  5251    DAWXR5D1


PROCESS
=======

  data want;

    set have;
    length single_code $20;

    do _i=1 by 1;
      single_code=scan(codes,_i,,'KAD');  * keep alphabet and digits;

      if missing(single_code) then leave; * leave is all processed;
      else output;

    end;
    keep id single_code;
  run;


OUTPUT
======


 WORK.WANT total obs=26

          SINGLE_
   ID     CODE

  0122    WESXQI3C
  0122    BOUX17Q9
  0122    WESXYBWF
 ...
  4512    DENX9UPH
  4512    BLUX8Z3F
  4512    DENXDQQ3

  4611    WEBXA56H
  4611    GERXDQN9
  4611    AEWEB
  4611    GERXERSG
  4611    JOYWEB

  5251    DAWXR5D1

*                _               _       _
 _ __ ___   __ _| | _____     __| | __ _| |_ __ _
| '_ ` _ \ / _` | |/ / _ \   / _` |/ _` | __/ _` |
| | | | | | (_| |   <  __/  | (_| | (_| | || (_| |
|_| |_| |_|\__,_|_|\_\___|   \__,_|\__,_|\__\__,_|

;

data have;
  infile datalines4 truncover;
  input id $  Codes $100.;
  datalines4;
0122  WESXQI3C, BOUX17Q9, WESXYBWF
4512  DENX9UPH; BLUX8Z3F; DENXDQQ3
2183  MOUNTADA,   BROWND01, BROWND03
0122  CLARD
0130  BAXXB3OQ, BAXXKEQD BAXXEIAG
0130  HUNTPA1
5221  MERXKIEI, MERXDW49,
2183  LANX8M83, PROXEAKO, PROXEXMK, AABXJ2G7
4611  WEBXA56H, GERXDQN9 AEWEB GERXERSG JOYWEB
5251  DAWXR5D1
;;;;
run;quit;





