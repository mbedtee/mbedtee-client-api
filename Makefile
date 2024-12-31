# SPDX-License-Identifier: BSD-2-Clause
# Copyright (c) 2019 KapaXL (kapa.xl@outlook.com)

CC = $(CROSS_COMPILE)gcc
STRIP = $(CROSS_COMPILE)strip

CFLAGS = -g -O2 -Wall -Werror $(ARCH_FLAGS) \
	-Iinclude -Iinclude/public -D_GNU_SOURCE

LDFLAGS = -shared

.PHONE: all
all: $(TARGET_NAME)

OBJS = tee_client_api.o teec_trace.o

$(TARGET_NAME): $(OBJS)
	$(CC) $(LDFLAGS) -o $@ $^
	$(STRIP) $@

%.o: %.c
	$(CC) $(CFLAGS) -o $@ -c $<

clean:
	@rm -f $(OBJS) $(TARGET_NAME)
