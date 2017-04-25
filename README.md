This directory contains the files needed to build a (somewhat) clean UNIX v8
installation from tape.  It requires that you have "expect" and
simh's "vax780" installed in your path.  (Ubuntu: `apt-get install simh expect`).  
(Note: sorry: Ubuntu's version of simh doesn't quite cut it.  You'll need to
build vax780 from the latest sources, at http://simh.trailing-edge.com/).
To build a new system run `./setup`.

Once you have built your clean system, run it with `vax780 run.conf`.  You should
get a login prompt and you can log in as root.

# Details

V8 is installed by first installing 4.1BSD from tape and then extracting V8 files over 4.1BSD from
another tape.  After this point, the BSD filesystem is converted to a V8 filesystem with `fsck`
and additional filesystem setup is performed.  The process is broken down in to three expect
scripts: [install41BSD](install41BSD), which install 4.1BSD from tape, [installV8](installV8), which
extracts V8 files on to the 4.1BSD system and builds a V8 kernel, and [fixupV8](fixupV8), which
converts the filesystem and does final filesystem setup tasks form within V8.  These scripts
are intended to be executable and readable, please refer to them for any setup details.

The scripts are based heavily on [install notes](http://9legacy.org/9legacy/doc/simh/v8) provided by David du Colombier.
The BSD tape image and the vax780 boot loaders are taken from the same sources he indicated.
The V8 tape is from an image provided by Dan Cross, at http://9legacy.org/9legacy/doc/simh/v8/v8.tar.bz2. It
has been processed by the `mktape` utility at http://zazie.tom-yam.or.jp/starunix/mktape.c to
make it usable in the SimH simulator.

Original V8 installation notes can be found at http://doc.cat-v.org/unix/v8/v8directions.pdf.

Original BSD installation notes can be found at http://gunkies.org/wiki/Setting_up_(BSD_4.0)_the_Fourth_Berkeley_Software_Tape
and SimH-specific notes for 4.2BSD can be found at http://gunkies.org/wiki/Installing_4.2_BSD_on_SIMH.


