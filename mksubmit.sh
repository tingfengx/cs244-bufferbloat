rm -rf ./submit_files
mkdir ./submit_files

for i in 5 20 100; do 
  dir=bb-q$i
  cp $dir/rtt.png submit_files/rtt-$i.png
  cp $dir/cwnd-iperf.png submit_files/cwnd-$i.png
  cp $dir/q.png submit_files/q-$i.png
  cp $dir/download.png submit_files/download-$i.png
done

cp write_up/pa2.pdf submit_files/pa2.pdf
cp bufferbloat.py submit_files/bufferbloat.py
cp plot_queue.py submit_files/plot_queue.py
cp plot_ping.py submit_files/plot_ping.py
cp plot_tcpprobe.py submit_files/plot_tcpprobe.py

# following three not required on markus, so have to omit
# cp plot_relationship.py submit_files/plot_relationship.py
# cp plot_download_time.py submit_files/plot_download_time.py
# cp fit.pdf submit_files/fit.pdf

cp run.sh submit_files/run.sh