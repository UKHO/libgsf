CFLAGS += -Wall
CFLAGS += -Wextra
CFLAGS += -fPIC
CFLAGS += -D_STRICT_ANSI
CFLAGS += -D_LARGEFILE64_SOURCE

VERSION := 03-08

SRCS_ZIP := GSF_$(VERSION).zip
SRCS_URL = https://s3.amazonaws.com/leidos-com-static/software/other/$(SRCS_ZIP)

LIB := libgsf.so

C_FILES := gsf.c gsf_dec.c gsf_enc.c gsf_geo.c gsf_indx.c gsf_info.c
H_FILES := gsf_dec.h gsf_enc.h gsf_ft.h gsf.h gsf_indx.h
O_FILES := $(C_FILES:.c=.o)

all: $(LIB)

$(LIB): $(O_FILES)
	@$(CC) $(CFLAGS) -shared -o $@ $?

$(O_FILES): %.o: %.c $(H_FILES)

$(C_FILES) $(H_FILES): %: $(SRCS_ZIP)
	@unzip -j $(SRCS_ZIP) $@
	@touch $@ # set last updated to now

$(SRCS_ZIP):
	@wget $(SRCS_URL)
	@touch $@ # set last updated to now

clean:
	@rm -f $(SRCS_ZIP) $(LIB) $(C_FILES) $(H_FILES) $(O_FILES)
