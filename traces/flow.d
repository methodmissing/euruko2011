#!/usr/sbin/dtrace -Zqs
#pragma D option flowindent

dtrace:::BEGIN
{
  printf("Tracing... Hit Ctrl-C to end.\n");
}

eventmachine$target:::*-entry
{
  self->tick = arg0;
  printf("%-30s\n", probename);
}

eventmachine$target:::*-return
/self->tick/
{
  printf("%-30s\n", probename);
}

dtrace:::END
{
}