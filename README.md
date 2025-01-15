# Willow

An operating system written from scratch for the fun of it; Recreational programming
at its finest. Another reason I want to write an OS from scratch is because how
many other things I want to write from scratch, such as a shell or compiler.
I'll have the chance to do pretty much everything I want to do by writing my own
OS. It's a win-win

Right now the plan is to target x86 maybe with more architectures in the future.

As for the kernel, I don't really want a majority monolithic kernel. The kernel
can have the basics it needs and then a few *super* basic utilities (such as a
basic filesystem driver, keyboard, mouse, etc). Everything else should be outside
the kernel. I think I want to go with a micro-kernel or modular based kernel.

I want to create more than a basic command-line interface kernel, I want to make
a "usable" OS. This all seems really ambitious, but I think its important to have
tangible goals to reach for.

## Milestones

[x] - Something booting

[ ] - Get Doom running natively

[ ] - Make a basic webserver running from Willow

[ ] - Get a C compiler working on Willow

[ ] - Introduce Zig into the kernel

[ ] - A GUI

[ ] - Port DWM to my windowing system
