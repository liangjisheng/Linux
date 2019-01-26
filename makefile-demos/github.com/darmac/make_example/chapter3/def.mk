#this is a makefile to test ifdef

.PHONY:all

# a 属于未定义变量，b 则属于已定义变量
a=
b=$(a)

ifdef a
c="a is defined"
else
c="a is not defined"
endif

ifdef b
d="b is defined"
else
d="b is not defined"
endif

all:
	@echo "vari a is:" $(a)
	@echo "vari b is:" $(b)
	@echo "vari c is:" $(c)
	@echo "vari d is:" $(d)
