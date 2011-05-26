#!/usr/sbin/dtrace -Zqs

dtrace:::BEGIN
{
  printf("Tracing... Hit Ctrl-C to end.\n");
}

eventmachine$target:::trace-entry
{
  self->uri = copyinstr(arg1);
}

eventmachine$target:::send-data-entry
{
  self->ts = timestamp;
}

eventmachine$target:::data-sent
/self->ts/
{
  self->elapsed = timestamp - self->ts;
  @num[self->uri] = count();
  @eavg[self->uri] = avg(self->elapsed);
  @esum[self->uri] = sum(self->elapsed);
  @eavg_data[self->uri] = avg(arg3);
  @esum_data[self->uri] = sum(arg3);
}

dtrace:::END
{
  normalize(@eavg, 1000);
  normalize(@esum, 1000);
  setopt("aggsortrev");
  printf("\nWrite queue latency, %s\n", execname);
  printf("%-25s %6s %10s %10s %10s %10s\n", "URI", "COUNT", "AVG(us)", "SUM(us)", "AVG(bytes)", "SUM(bytes)");
  printa("%-25s %@6d %@10d %@10d %@10d %@10d\n", @num, @eavg, @esum, @eavg_data, @esum_data);
}