# network-tools
Some useful network tools

## Pre-requisites

tcpdump
speedtest

## snif

Grabs 1800 packets from the specified network interface. Useful to diagnose traffic on the network.

To run automatically, add to root crontab, changing schedule as you see fit. [Crontab Guru](https://crontab.guru/) is a useful site for this.

```
*/15 02-03 *   *   *    /home/pi/network-monitor/snif.sh > /var/log/snif.log 2>&1
```

## testnet

Runs a speed test and writes the results to the system log.

```
*/10 *    *   *   *    /home/pi/testnet.sh
```

## Remote logging

I've run this as a small log server on network using rsyslog, and writing to loggly. Works pretty well, although I've not yet written this up.
