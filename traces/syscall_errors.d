#!/usr/sbin/dtrace -Zqs

dtrace:::BEGIN
{
    printf("Tracing... Hit Ctrl-C to end.\n");
}

syscall:::return
/pid == $target && (int)arg0 == -1/
{
    @errors[probefunc, errno] = count();
    @bt[probefunc, ustack(3)] = count();
}

dtrace:::END
{
    printf("%-32s %-6s %8s\n", "SYSCALL", "ERRNO", "COUNT");
    printa("%-32s %-6d %@8d\n", @errors);
    printa(@bt);
}