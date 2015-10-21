obj-m := db9_gpio_rpi.o
KVERSION := `uname -r`

all:
	$(MAKE) -C /lib/modules/$(KVERSION)/build SUBDIRS=$(PWD) modules

install:
	install -m 0755 -d $(DESTDIR)/lib/modules/$(KVERSION)/kernel/gpio
	gzip -c ./db9_gpio_rpi.ko > $(DESTDIR)/lib/modules/$(KVERSION)/kernel/gpio/db9_gpio_rpi.ko.gz

clean:
	$(MAKE) -C /lib/modules/$(KVERSION)/build SUBDIRS=$(PWD) clean
