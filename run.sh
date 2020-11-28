#!/bin/bash
set -e

# Note: Mininet must be run as root.  So invoke this shell script
# using sudo.

time=60
bwnet=10
# TODO: If you want the RTT to be 4ms what should the delay on each
# link be?  Set this value correctly.
# delay = 4ms / 4 = 1ms
delay=1 # link propagation delay

iperf_port=5001

modprobe tcp_probe
# make sure we don't use a cached cwnd
sysctl -w net.ipv4.tcp_no_metrics_save=1

# added size of 5, as required
for qsize in 5 20 100; do
    dir=bb-q$qsize

    python bufferbloat.py --dir=$dir --time=$time --bw-net=$bwnet --delay=$delay --maxq=$qsize

    # TODO: Ensure the input file names match the ones you use in
    # bufferbloat.py script.  Also ensure the plot file names match
    # the required naming convsention when submitting your tarball.
    python plot_tcpprobe.py -f $dir/cwnd.txt -o $dir/cwnd-iperf.png -p $iperf_port
    python plot_queue.py -f $dir/q.txt -o $dir/q.png
    python plot_ping.py -f $dir/ping.txt -o $dir/rtt.png -df $dir/download.txt -do $dir/download.png
done

# finally do the following (plotting the relationship between RTT and qsize)
# sorry that I can't upload this file, it was not listed on markus
# but you can see the code in my report in appendix, also the output is in the report :) 
# python plot_relationship.py