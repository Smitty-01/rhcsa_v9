  141  man chronyc
  142  man chronyd
  143  dnf -y install chrony
  144  systemctl --now enable chronyd
  145  sudo systemctl status chronyd
  146  chronyc sources
  147  chronyc tracking
  148  history
[root@server1 ~]# 

[root@server1 ~]# chronyc tracking
Reference ID    : 11FD1283 (inbom5-ntp-002.aaplimg.com)
Stratum         : 3
Ref time (UTC)  : Wed Feb 18 18:04:53 2026
System time     : 0.002379699 seconds slow of NTP time
Last offset     : +0.000282006 seconds
RMS offset      : 0.009190540 seconds
Frequency       : 9.305 ppm slow
Residual freq   : +3.953 ppm
Skew            : 1.405 ppm
Root delay      : 0.101630151 seconds
Root dispersion : 0.010678395 seconds
Update interval : 65.0 seconds
Leap status     : Normal
