#!/usr/bin/env python

import i3pystatus

status = i3pystatus.Status()

status.register("clock", format=" %I:%M%P ", color="#4ec2f7")

status.register("disk", format=" {free}", path="/", color="#b967c7")

status.register("mem", format=" {percent_used_mem}%", color="#ffb64c")

status.register("load", format=" {avg1}", color="#81c784")

status.register("pulseaudio",
        format=" {volume}%",
        color_unmuted="#4ec2f7",
        color_muted="#ff0000")

status.run()
