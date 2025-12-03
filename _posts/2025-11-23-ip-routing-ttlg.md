---
layout: post
title: IP routing through the looking-glass
image: /images/classic_by_maayainsane.jpg
---

TL;DR: `traceroute jabberwocky.rosuav.com`

IPv6 netblocks are big. Really, really big. You may think it's a long way
from 192.168.1.0 to 192.168.1.254, but that's just peanuts to a /64 netblock.

And userspace packet filtering is a thing. One line in iptables can send packets
to a queue, and then a perfectly normal program can process them. What fun!

And IPv6 "Time Exceeded" messages are like white lab coats - you can just send
your own. So simple, so easy.

Put all that together, and what do you get? The ability to design your own
traceroute. Drawing inspiration from amazing hacks like the Star Wars opening
crawl, I put together something that... responds to packets with a Time Exceeded
message whose origin depends on the remaining TTL. The result? A series of entirely
mythical computers that purportedly form an immensely long routing chain. And with
the help of DNS, each one of those routers has its own name.

And so we have it: A traceroute that tells a story. Or in this case, recites a poem.

```
$ traceroute jabberwocky.rosuav.com
traceroute to jabberwocky.rosuav.com (2403:5803:bf48:1::1), 30 hops max, 80 byte packets
 1  2403:5803:bf48:8000::1 (2403:5803:bf48:8000::1)  2.658 ms  4.582 ms  5.772 ms
 2  twas.brillig.and.the.slithy.toves (2403:5803:bf48:1::101)  5.747 ms  8.117 ms  8.099 ms
 3  did.gyre.and.gimble.in.the.wabe (2403:5803:bf48:1::102)  8.080 ms  10.557 ms  10.534 ms
 4  all.mimsy.were.the.borogoves (2403:5803:bf48:1::103)  12.639 ms  12.620 ms  13.745 ms
 5  and.the.mome.raths.outgrabe (2403:5803:bf48:1::104)  13.725 ms  15.314 ms  16.232 ms
 6  beware.the.jabberwock.my.son (2403:5803:bf48:1::105)  17.784 ms  1.703 ms  1.950 ms
 7  the.jaws.that.bite.the.claws.that.catch (2403:5803:bf48:1::106)  5.266 ms  7.479 ms  7.451 ms
 8  beware.the.jujub.bird.and.shun (2403:5803:bf48:1::107)  9.738 ms  9.718 ms  9.698 ms
 9  the.frumious.bandersnatch (2403:5803:bf48:1::108)  10.595 ms  12.796 ms  12.777 ms
10  he.took.his.vorpal.sword.in.hand (2403:5803:bf48:1::109)  13.282 ms  14.598 ms  15.196 ms
11  long.time.the.manxome.foe.he.sought (2403:5803:bf48:1::10a)  15.816 ms  16.147 ms  16.449 ms
12  so.rested.he.by.the.tumtum.tree (2403:5803:bf48:1::10b)  15.549 ms  1.309 ms  1.386 ms
13  and.stood.awhile.in.thought (2403:5803:bf48:1::10c)  3.076 ms  4.834 ms  7.078 ms
14  and.as.in.uffish.thought.he.stood (2403:5803:bf48:1::10d)  7.057 ms  9.285 ms  9.267 ms
15  the.jabberwock.with.eyes.of.flame (2403:5803:bf48:1::10e)  10.903 ms  10.885 ms  10.866 ms
16  came.whiffling.through.the.tulgey.wood (2403:5803:bf48:1::10f)  12.946 ms  12.928 ms  12.908 ms
17  and.burbled.as.it.came (2403:5803:bf48:1::110)  13.226 ms  13.827 ms  14.639 ms
18  one.two.one.two.and.through.and.through (2403:5803:bf48:1::111)  14.516 ms  1.216 ms  2.570 ms
19  the.vorpal.blade.went.snicker.snack (2403:5803:bf48:1::112)  2.520 ms  3.973 ms  4.871 ms
20  he.left.it.dead.and.with.its.head (2403:5803:bf48:1::113)  7.129 ms  7.111 ms  9.810 ms
21  he.went.galumphing.back (2403:5803:bf48:1::114)  9.791 ms  11.956 ms  11.937 ms
22  and.has.thou.slain.the.jabberwock (2403:5803:bf48:1::115)  13.590 ms  13.955 ms  14.933 ms
23  come.to.my.arms.my.beamish.boy (2403:5803:bf48:1::116)  14.914 ms  15.562 ms  15.942 ms
24  o.frabjous.day.calloh.callay (2403:5803:bf48:1::117)  1.317 ms  3.042 ms  2.145 ms
25  he.chortled.in.his.joy (2403:5803:bf48:1::118)  5.741 ms  5.709 ms  7.299 ms
26  twas.brillig.and.the.slithy.toves (2403:5803:bf48:1::119)  8.419 ms  9.001 ms  9.623 ms
27  did.gyre.and.gimble.in.the.wabe (2403:5803:bf48:1::11a)  11.056 ms  11.037 ms  11.018 ms
28  all.mimsy.were.the.borogoves (2403:5803:bf48:1::11b)  11.000 ms  11.352 ms  11.684 ms
29  jabberwocky.rosuav.com (2403:5803:bf48:1::1)  12.391 ms  1.159 ms  2.469 ms

```

Note that you'll need additional hops to get to Sikorsky before the trace begins (there's only one hop here
but you'll likely need more), which can easily push this beyond the usual 30-hop limit. Check your traceroute
documentation for a flag to increase this, eg `traceroute -m 60 jabberwocky.rosuav.com` or similar.

Want even more Alice? `traceroute aboatbeneath.rosuav.com`
