#!/usr/sbin/dtrace -Zqs
#pragma D option stackindent=2

dtrace:::BEGIN
{
    self->in_event = 0;
    printf("Tracing... Hit Ctrl-C to end.\n");
}

eventmachine$target:::*-entry
{
    self->in_event = 1;
    self->event = substr(probename, 0, (strlen(probename) - 6));
    self->tick = arg0;
}

eventmachine$target:::*-return
{
    self->in_event = 0;
}

sched:::off-cpu
/pid == $target/
{
    self->ts = timestamp;
}

sched:::on-cpu
/pid == $target && self->ts && self->in_event/
{
    self->elapsed = timestamp - self->ts;
    @num_e[self->event] = count();
    @eavg_e[self->event] = avg(self->elapsed);
    @esum_e[self->event] = sum(self->elapsed);
    @num_t[self->tick] = count();
    @eavg_t[self->tick] = avg(self->elapsed);
    @esum_t[self->tick] = sum(self->elapsed);
    @csw_u[ustack(3)] = count();
    @csw_k[stack(3)] = count();
    self->ts = 0;
}

dtrace:::END
{
  normalize(@eavg_e, 1000);
  normalize(@esum_e, 1000);
  normalize(@eavg_t, 1000);
  normalize(@esum_t, 1000);
  setopt("aggsortrev");

  printf("\nPer event time spent on CPU, %s\n", execname);
  printf("%-20s %6s %10s %12s\n", "EVENT", "COUNT", "AVG(us)", "SUM(us)");
  printa("%-20s %@6d %@10d %@12d\n", @num_e, @eavg_e, @esum_e);

  printf("\nPer tick time spent on CPU, %s\n", execname);
  printf("%-20s %6s %10s %12s\n", "TICK", "COUNT", "AVG(us)", "SUM(us)");
  printa("%-20d %@6d %@10d %@12d\n", @num_t, @eavg_t, @esum_t);

  trunc(@csw_u, 3);
  trunc(@csw_k, 3);
  printf("\nContext switch, user %s\n", execname);
  printa(@csw_u);
  printf("\nContext switch, kernel %s\n", execname);
  printa(@csw_k);
}