/* { dg-do compile } */

#include <objc/objc.h>
#include "../../objc-obj-c++-shared/Object1.h"

@interface obj : Object {
@public 
  int var; 
} 
- (int) depmth __attribute__((deprecated)); 
- (int) depmtharg:(int) iarg __attribute__((deprecated)); 
- (int) unusedarg:(int) __attribute__((unused)) uarg ;  /* { dg-warning "method parameter attributes are not available in this version" } */
- (int) depunusedarg:(int) __attribute__((unused)) uarg __attribute__((deprecated)) ; /* { dg-warning "method parameter attributes are not available in this version" } */
@end

@implementation obj
- (int) depmth __attribute__((deprecated)) { return var; }  
- (int) depmtharg:(int) iarg { return var + iarg ; }
- (int) unusedarg:(int) __attribute__((unused)) uarg { return var; }  /* { dg-warning "method parameter attributes are not available in this version" } */
- (int) depunusedarg:(int) __attribute__((unused)) uarg { return var; } /* { dg-warning "method parameter attributes are not available in this version" } */
@end 

int foo (void)
{
  obj *p = [obj new];
  
  [p depmth];		/* { dg-warning "is deprecated" } */
  [p depmtharg:1];	/* { dg-warning "is deprecated" } */
  [p unusedarg:2];	/* { dg-bogus "is deprecated" } */
  [p depunusedarg:3 ];	/* { dg-warning "is deprecated" } */

  return [p depmtharg:0]; /* { dg-warning "is deprecated" } */   
}
