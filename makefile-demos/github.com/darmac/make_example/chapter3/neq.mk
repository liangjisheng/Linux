#this is a mekfile to test ifneq

.PHONY:all

# 当a不为空时，b的值与a相同，否则b为默认值null
ifneq ($(a),)
b=$(a)
else
b="null"
endif

all:
	@echo "value b is:" $(b)
