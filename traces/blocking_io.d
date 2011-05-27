#!/usr/sbin/dtrace -Zqs
#pragma D option stackindent=2

dtrace:::BEGIN
{
  printf("\nTracing... Hit Ctrl-C to end.\n");
}

eventmachine$target:::*-entry
{
  self->tick = arg0;
}

eventmachine$target:::trace-entry
{
  printf("-> %-16d %-20s\n", arg0, copyinstr(arg1));
}

eventmachine$target:::trace-return
{
  printf("<- %-16d %-20s\n", arg0, copyinstr(arg1));
}

pid$target::mysql_send_query:entry
{
  self->query = copyinstr(arg1);
  printf("-> %-16d %-20s\n", self->tick, self->query);
}

pid$target::mysql_read_query_result:return
{
  printf("<- %-16d %-20s\n", self->tick, self->query);
}

eventmachine$target:::timer-fired-entry
{
  printf("-> %-16d %-20s\n", arg0, probename);
  self->ts = timestamp;
}

eventmachine$target:::timer-fired-return
/self->ts/
{
  printf("<- %-16d %-20s\n", arg0, probename);
  self->elapsed = timestamp - self->ts;
  @timers["\ntimers-fired"] = count();
  @num[arg0] = count();
  @eavg[arg0] = avg(self->elapsed);
  @esum[arg0] = sum(self->elapsed);
}

sched:::on-cpu
/pid == $target/
{
  @bt[ustack(1)] = count();
}

dtrace:::END
{
  normalize(@eavg, 1000);
  normalize(@esum, 1000);
  trunc(@bt, 3);
  printf("\n\nReactor time allocated on I/O bound work, %s\n", execname);
  setopt("aggsortkey");
  printf("%-16s %6s %10s %12s\n", "TICK", "COUNT", "AVG(us)", "SUM(us)");
  printa("%-16.16d %@6d %@10d %@12d\n", @num, @eavg, @esum);
  printa(@timers);
  printa(@bt);
}