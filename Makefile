.PHONY: all clean

CC:=gcc
CFLAGS:=-Wall -O2 -Iinclude
LDFLAGS:=
LDLIBS:=

OBJDIR:=objdir
SRC=foo.c bar.c main.c
OBJS:=$(SRC:%.c=$(OBJDIR)/%.o)

EXE:=simpletest

default:
	$(MAKE) clean
	$(MAKE) $(EXE)
	$(MAKE) test

$(EXE): $(OBJS)
	$(CC) $(LDFLAGS) $(LDLIBS) -o $@ $^	

$(OBJS): | $(OBJDIR)

$(OBJDIR):
	mkdir -p $@

$(OBJS): $(OBJDIR)/%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

test: $(EXE)
	./$(EXE)	

clean:
	rm -rf $(OBJDIR) $(EXE)

