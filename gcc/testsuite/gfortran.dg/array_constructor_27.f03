! { dg-do compile }

! PR fortran/36492
! Check for incorrect error message with -std=f2003.
! Reduced test triggering the ICE mentioned in comment #4, PR 36492.

implicit none

type t
  character (a) :: arr (1) = [ "a" ]
  ! { dg-error "no IMPLICIT type" "" { target *-*-* } 10 }
  ! { dg-error "specification expression" "" { target *-*-* } 10 }
end type t

end
