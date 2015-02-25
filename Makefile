.SUFFIXES :

.SUFFIXES : .ftn .f .c .o .a

SHELL = /bin/sh

CPP = /lib/cpp

FFLAGS =

CFLAGS =

SUPP_OPT = -openmp

OPTIMIZ = 2

CPPFLAGS = 

MYLIB = $(ARMNLIB)/lib/$(EC_ARCH)$(ABI)/librmnbeta.a

TEMPLIB = ./$(EC_ARCH)/lib_local.a

LIBRMN = rmn_015.2

TARRLS = beta

.PRECIOUS: $(MYLIB)

include $(RPN_TEMPLATE_LIBS)/include/makefile_suffix_rules.inc

OBJECT = cmcwlog.o 

OBJ2 = cmcrlog.o

OBJTEST = slabtest.o

default: cmc_w_log cmc_p_log cmc_r_log 

VER = 2.2

obj: $(OBJECT) $(OBJ2)
#Produire les fichiers objets (.o) pour tous les fichiers


cmc_p_log: ${OBJ2} cmc_p_log.o
	s.cc cmc_p_log.c -o $@_$(VER)-$(BASE_ARCH) cmcrlog.o -l$(LIBRMN)

cmc_r_log: ${OBJ2} cmc_r_log.o
	s.cc cmc_r_log.c -o $@_$(VER)-$(BASE_ARCH) cmcrlog.o -l$(LIBRMN)

net_w_log: net_w_log.o
	s.cc net_w_log.c -o $@_$(VER)-$(BASE_ARCH) -l$(LIBRMN)

cmc_w_log: cmc_w_log.o 
	s.cc cmc_w_log.c -o $@_$(VER)-$(BASE_ARCH) -l$(LIBRMN)

clean:
	rm -f *.o 

veryclean:
	rm -f *.o cmc_p_log cmc_r_log cmc_w_log net_w_log *log.???* *_$(VER)-$(BASE_ARCH)
