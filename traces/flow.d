#!/usr/sbin/dtrace -Zqs
#pragma D option flowindent

dtrace:::BEGIN
{
  printf("Tracing... Hit Ctrl-C to end.\n");
}

eventmachine$target:::*-entry
{
  self->tick = arg0;
  printf("%-30s %-15d\n", probename, self->tick);
}

eventmachine$target:::*-return
/self->tick/
{
  printf("%-30s %-15d\n", probename, self->tick);
}

dtrace:::END
{
}