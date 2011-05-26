#!/usr/sbin/dtrace -Zqs
#pragma D option flowindent

dtrace:::BEGIN
{
  printf("Tracing... Hit Ctrl-C to end.\n");
}

eventmachine$target:::get-binding-entry
{
  self->binding = arg1;
}

syscall::*:entry
/pid == $target && self->binding/
{
  printf("%-4d %-12s\n", self->binding, probename);
}

syscall::*:return
/pid == $target && self->binding/
{
  printf("%-4d %-12s\n", self->binding, probename);
}

dtrace:::END
{
}