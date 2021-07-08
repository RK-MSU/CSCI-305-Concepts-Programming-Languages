!
! SuperSpy program (start)
!
       program SuperSpy						! start SuperSpy program
       implicit none						! implicit declaration
       integer :: userInput, n1, n2			! declare integer variables
       character*10 :: charInput			! declare char variable
       print '(A)', 'Hat Size?'				! print initial prompt for hat size
       read *, userInput					! read in user input
       write(charInput, '(I10)') userInput	! Convert user input to char string
       call GetNum(charInput, 2, n2)		! Get 3rd number
       call GetNum(charInput, 1, n1)		! Get 2nd number
       print '(A I1 I1)', 'Use ', n1, n2	! print final 'Use ##'
       end program SuperSpy					! end SuperSpy program
!
! GetNum Subroutine (start)
!
       subroutine GetNum(input, index, num)	! start GetNum subroutine
       implicit none						! implicit declaration
       character*10, intent(in) :: input 	! declare character (intent(in))
       integer, intent(in) :: index 		! declare integer
       integer, intent(out) :: num 			! declare integer
       read(input(10-index:10-index), '(I1)') num ! get character at desired index and convert to integer
       end subroutine GetNum 				! end subroutine