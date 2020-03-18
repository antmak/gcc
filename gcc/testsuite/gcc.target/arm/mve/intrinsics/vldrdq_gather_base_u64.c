/* { dg-do compile  } */
/* { dg-additional-options "-march=armv8.1-m.main+mve -mfloat-abi=hard -O2"  }  */
/* { dg-skip-if "Skip if not auto" {*-*-*} {"-mfpu=*"} {"-mfpu=auto"} } */

#include "arm_mve.h"

uint64x2_t
foo (uint64x2_t addr)
{
  return vldrdq_gather_base_u64 (addr, 8);
}

/* { dg-final { scan-assembler "vldrd.64"  }  } */
