---
layout: post
title: "Episode 2: The Layer 2 Bridge Lab"
date: 2026-02-11
categories: ["Homelab", "Networking", "Debian", "NetworkManager", "ZeroTier", "Bridging", "Ham Radio", "FlexRadio 8600", "Maestro", "Resilience"]
excerpt: "Migrating from /etc/network/interfaces to NetworkManager on Debian Trixie is a rite of passage. This lab walks through building a persistent Layer 2 bridge between eth0 and a ZeroTier interface—plus the dispatcher automation that keeps MTU and bridge membership correct across reboots, restarts, and interface flaps."
---

I built a layer 2 network bridge for a reason that has nothing to do with “best practices” and everything to do with reality.

A few nights ago I was in the shack, staring at my **FlexRadio 8600**, watching it do what modern SDRs do best: become the center of a little RF universe. The **Maestro** was on the desk, a couple of clients were on the LAN, and everything was smooth—until I asked the question that always shows up at the worst time:

> *What happens when I’m not here?*

Because when you’re responding to an emergency, you don’t get to choose your network conditions. Sometimes the “internet” is fine, but the path you *need* is blocked. Sometimes a site’s upstream is flapping. Sometimes LTE is saturated, or a firewall rule gets “helpful.” And sometimes the normal comms stack fails in the exact way that makes you appreciate ham radio in the first place: it still works when everything else is having a feelings episode.

So the goal became simple: make the shack behave like it’s always *right there* on the same wire—no matter where I am.

That’s how I ended up in Debian Trixie, migrating off the old `/etc/network/interfaces` muscle memory and into **NetworkManager** (screams at Systemd), trying to build a **persistent Layer 2 bridge** that could stitch together my physical Ethernet (**eth0**) and my remote overlay (**ZeroTier**) into one clean broadcast domain. Not routing. Not “kind of works if you poke it.” A real **virtual switch**: the kind that lets the Maestro, the Flex 8600, and whatever else I drag into the mix discover each other naturally and keep operating when traditional paths are degraded or outright gone.

This post is the lab notes from that journey—warts and all—because the hard part wasn’t the bridge itself. The hard part was making it **survive reboots, survive service restarts, survive the ZeroTier interface showing up late, and survive MTU mismatches** that can turn a remote session into a frozen SSH tombstone.

If you’re building a remote-capable shack—whether it’s for convenience, experimentation, or because you want your gear available when you’re out supporting real-world incidents—this is the pattern that finally made my setup resilient enough to trust.


Moving from legacy `/etc/network/interfaces` to **NetworkManager** on Debian Trixie is a rite of passage for systems engineers and Full Stack builders.  Today, we’re tackling a common pain point: creating a persistent Layer 2 bridge between a physical Ethernet port and a virtual ZeroTier interface.

## The Architecture

A Layer 2 bridge acts like a virtual network switch inside your Raspberry Pi. Instead of routing traffic (Layer 3), we are joining two different "wires" into one single broadcast domain.

- **eth0:** Your physical wire to your home router.
- **zt4hoamefb:** Your virtual wire to the ZeroTier network.
- **br0:** The software switch that binds them.

---

## The "Modern" Implementation

On Debian Trixie, NetworkManager is the source of truth. If you try to configure this via the legacy `interfaces` file, NetworkManager will often conflict with the setup.

### 1. The Clean Slate

Before starting, comment out any mention of `eth0` in `/etc/network/interfaces`. Only the loopback (`lo`) should remain.

### 2. Building the Bridge (The Controller)

```bash
sudo nmcli connection add type bridge con-name br0 ifname br0   ipv4.method manual ipv4.addresses 192.168.1.2/24   ipv4.gateway 192.168.1.1 ipv4.dns "192.168.1.1"   bridge.stp no bridge.forward-delay 0
```

### 3. Slaving the Physical Port

This attaches your hardware Ethernet to the software bridge.

```bash
sudo nmcli connection add type ethernet con-name br0-port-eth0 ifname eth0   controller br0
```

---

## The Nuance: Handling ZeroTier

ZeroTier interfaces are tricky because they are virtual and appear after the network service starts. Furthermore, they are often misidentified as **tun** (Layer 3) rather than **ethernet** (Layer 2).

### The Automation Script

To ensure the ZeroTier interface is always slaved correctly and maintains the correct MTU, we use a **NetworkManager Dispatcher Script**. Create the file at `/etc/NetworkManager/dispatcher.d/99-zt-bridge`:

```bash
#!/bin/bash

# Configuration
INTERFACE="zt4hoamefb"
BRIDGE="br0"
TARGET_MTU=1500

IF=$1
ACTION=$2

if [ "$IF" = "$INTERFACE" ]; then
    case "$ACTION" in
        up)
            # Give the virtual hardware a moment to settle
            sleep 2
            # Force MTU to 1500 to match eth0
            /usr/bin/ip link set dev $INTERFACE mtu $TARGET_MTU
            # Enslave to bridge
            /usr/bin/ip link set dev $INTERFACE master $BRIDGE
            ;;
        down)
            /usr/bin/ip link set dev $INTERFACE nomaster
            ;;
    esac
fi
```

*Make the script executable:* `sudo chmod +x /etc/NetworkManager/dispatcher.d/99-zt-bridge`

---

## Troubleshooting FAQ

**Q: Why did my SSH freeze?**  
**A:** This is usually an **MTU mismatch**. ZeroTier defaults to 2800, but Ethernet uses 1500. If the bridge tries to push a 2800-byte packet through a 1500-byte "pipe," it gets dropped. Our script forces the ZT interface to 1500.

**Q: I can't reach devices behind the Pi.**  
**A:** Check your ZeroTier Central dashboard. You must enable the **"Allow Ethernet Bridging"** checkbox for this specific Node ID.

**Q: How do I know it's working?**  
**A:** Run `bridge fdb show br0`. If you see MAC addresses from your remote ZeroTier nodes appearing on the bridge, your virtual switch is alive and well.

## Conclusion

By moving to an event-driven setup with NetworkManager and a Dispatcher script, your Raspberry Pi becomes a resilient gateway that handles service restarts and flaps gracefully. This setup is perfect for emergency communications, providing a modern alternative to legacy Linux networking.
