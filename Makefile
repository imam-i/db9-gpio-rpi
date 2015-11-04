obj-m := db9_gpio_rpi.o
KVERSION := `uname -r`

all:
	$(MAKE) -C /usr/lib/modules/$(KVERSION)/build SUBDIRS=$(PWD) modules

install:
	install -m 0755 -d $(DESTDIR)/usr/lib/modules/$(KVERSION)/kernel/drivers/gpio
	gzip -c ./db9_gpio_rpi.ko > $(DESTDIR)/usr/lib/modules/$(KVERSION)/kernel/drivers/gpio/db9_gpio_rpi.ko.gz

clean:
	$(MAKE) -C /usr/lib/modules/$(KVERSION)/build SUBDIRS=$(PWD) clean
