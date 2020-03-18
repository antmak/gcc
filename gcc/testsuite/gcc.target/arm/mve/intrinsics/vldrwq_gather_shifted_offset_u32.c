/* { dg-do compile  } */
/* { dg-additional-options "-march=armv8.1-m.main+mve -mfloat-abi=hard -O2"  }  */
/* { dg-skip-if "Skip if not auto" {*-*-*} {"-mfpu=*"} {"-mfpu=auto"} } */

#include "arm_mve.h"

uint32x4_t
foo (uint32_t const * base, uint32x4_t offset)
{
  return vldrwq_gather_shifted_offset_u32 (base, offset);
}

/* { dg-final { scan-assembler "vldrw.u32"  }  } */

uint32x4_t
foo1 (uint32_t const * base, uint32x4_t offset)
{
  return vldrwq_gather_shifted_offset (base, offset);
}

/* { dg-final { scan-assembler "vldrw.u32"  }  } */
