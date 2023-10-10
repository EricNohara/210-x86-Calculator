#assemble calc.o from source file
calc.o: calc.s
	as -g calc.s -o calc.o

#assemble data/basic_cmds.o from source file
data/basic_cmds.o: data/basic_cmds.s
	as -g data/basic_cmds.s -o data/basic_cmds.o

#assemble and.o from source file
and.o: and.s
	as -g and.s -o and.o

#assemble or.o from source file
or.o: or.s
	as -g or.s -o or.o

#assemble sum.o from source file
sum.o: sum.s
	as -g sum.s -o sum.o

#assemble upper.o from source file
upper.o: upper.s
	as -g upper.s -o upper.o

#assemble arraysum.o from source file
arraysum.o: arraysum.s
	as -g arraysum.s -o arraysum.o

#assemble listsum.o from source file
listsum.o: listsum.s
	as -g listsum.s -o listsum.o

#assemble atoq.o from source file
atoq.o: atoq.s
	as -g atoq.s -o atoq.o

#assemble data/simpleone_cmds.o from source file
data/simpleone_cmds.o: data/simpleone_cmds.s
	as -g data/simpleone_cmds.s -o data/simpleone_cmds.o

#assemble data/upperonly_cmds.o from source file
data/upperonly_cmds.o: data/upperonly_cmds.s
	as -g data/upperonly_cmds.s -o data/upperonly_cmds.o

#assemble data/easy_cmds.o from source file
data/easy_cmds.o: data/easy_cmds.s
	as -g data/easy_cmds.s -o data/easy_cmds.o

#assemble data/basicwithupper_cmds.o from source file
data/basicwithupper_cmds.o: data/basicwithupper_cmds.s
	as -g data/basicwithupper_cmds.s -o data/basicwithupper_cmds.o

#assemble data/arraysum_cmds.o from source file
data/arraysum_cmds.o: data/arraysum_cmds.s
	as -g data/arraysum_cmds.s -o data/arraysum_cmds.o

#assemble data/listsum_cmds.o from source file
data/listsum_cmds.o: data/listsum_cmds.s
	as -g data/listsum_cmds.s -o data/listsum_cmds.o

#assemble data/atoq_cmds.o from source file
data/atoq_cmds.o: data/atoq_cmds.s
	as -g data/atoq_cmds.s -o data/atoq_cmds.o

#assemble simplerandom_cmds.o from source file
simplerandom_cmds.o: simplerandom_cmds.s
	as -g simplerandom_cmds.s -o simplerandom_cmds.o

#link code fragments to create calc_basic executable
calc_basic: calc.o and.o or.o sum.o upper.o arraysum.o listsum.o atoq.o data/basic_cmds.o
	ld -g calc.o and.o or.o sum.o upper.o data/basic_cmds.o arraysum.o listsum.o atoq.o -o calc_basic

#link code fragments to create calc_simpleone executable
calc_simpleone: calc.o and.o or.o sum.o upper.o arraysum.o listsum.o atoq.o data/simpleone_cmds.o
	ld -g data/simpleone_cmds.o calc.o and.o or.o sum.o upper.o arraysum.o listsum.o atoq.o -o calc_simpleone

#link code fragments to create calc_upperonly executable
calc_upperonly: calc.o and.o or.o sum.o upper.o arraysum.o listsum.o atoq.o data/upperonly_cmds.o
	ld -g calc.o and.o or.o sum.o upper.o arraysum.o listsum.o atoq.o data/upperonly_cmds.o -o calc_upperonly

#link code fragments to create calc_easy
calc_easy: calc.o and.o or.o sum.o upper.o arraysum.o listsum.o atoq.o data/easy_cmds.o
	ld -g calc.o and.o or.o sum.o upper.o arraysum.o listsum.o atoq.o data/easy_cmds.o -o calc_easy

#link code fragments to create calc_basicwithupper
calc_basicwithupper: calc.o and.o or.o sum.o upper.o arraysum.o listsum.o atoq.o data/basicwithupper_cmds.o
	ld -g calc.o and.o or.o sum.o upper.o arraysum.o listsum.o atoq.o data/basicwithupper_cmds.o -o calc_basicwithupper

#link code fragments to create calc_simplerandom
calc_simplerandom: calc.o and.o or.o sum.o upper.o arraysum.o listsum.o atoq.o data/simplerandom_cmds.o
	ld -g calc.o and.o or.o sum.o upper.o arraysum.o listsum.o atoq.o data/simplerandom_cmds.o -o calc_simplerandom

#link code fragments to create calc_arraysum
calc_arraysum: calc.o and.o or.o sum.o upper.o arraysum.o listsum.o atoq.o data/arraysum_cmds.o
	ld -g calc.o and.o or.o sum.o upper.o arraysum.o listsum.o atoq.o data/arraysum_cmds\
.o -o calc_arraysum

#link code fragments to create calc_listsum
calc_listsum: calc.o and.o or.o sum.o upper.o arraysum.o listsum.o atoq.o data/listsum_cmds.o
	ld -g calc.o and.o or.o sum.o upper.o arraysum.o listsum.o atoq.o data/listsum_cmds.o -o calc_listsum

#link code fragments to create calc_atoq
calc_atoq: calc.o and.o or.o sum.o upper.o arraysum.o listsum.o atoq.o data/atoq_cmds.o
	ld -g calc.o and.o or.o sum.o upper.o arraysum.o listsum.o atoq.o data/atoq_cmds.o -o calc_atoq
