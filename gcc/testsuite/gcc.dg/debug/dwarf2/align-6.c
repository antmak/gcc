// { dg-do compile }
// { dg-options "-O -g -dA" }
// { dg-final { scan-assembler-times " DW_AT_alignment" 1 { xfail { powerpc-ibm-aix* } } } }

struct tt {
  int i;
};

struct tt __attribute__((__aligned__(64))) t;
