+++
title = "Unix Basics"
weight = "3"
+++


The certification exam leverages a browser-based Linux terminal. The CF CLI version 8+ will be preinstalled in this terminal. If you are comfortable with the Linux command line and one of the text editors listed below, you can safely skip this section. However, if you are primarily a Windows user, we recommend you practice using a Linux terminal ahead of the exam.

## How to Practice

There are many ways to get access to a linux terminal. Here are a few:

- [Use JSLinux via your browser](https://bellard.org/jslinux/vm.html?url=https://bellard.org/jslinux/buildroot-x86.cfg)
- [Install the Linux Bash Shell](https://www.howtogeek.com/249966/how-to-install-and-use-the-linux-bash-shell-on-windows-10/)  in Windows 10 
- [Install cygwin](https://www.cygwin.com/) in earlier versions of Windows
- Create a Linux VM or container on your machine
- Create a Linux VM or container on a cloud platform like AWS, Azure, GCP, etc.

## Directory and File Basics

Below is a list of basic commands that may be useful in completing the exam. There are many more commands and many options for most commands. However, the list below is scoped solely to what will likely be useful in completing the exam.

* `pwd` (or "print working directory") shows the full path to the directory you are currently in.
* `cd <some-directory>` will change to the directory called `<some-directory>`. `cd ..` will move up one directory.
* `cd` with no arguments will change to the user's home directory. In the case of the exam, this is `/home/student`. The home directory will contain files used during the exam.
* `ls` lists files in a directory. With no arguments, `ls` will list files in the current directory. Alternatively `ls <some-directory>` will list the files in `<some-directory>`.
* `cp <from-file> <to-file>` will copy the file `from` to a file `to`. 
* `mv <from> <to>` will move the file `from` to a file `to`. Using `mv` on `from` and `to` files in the same directory can be used to rename a file.
* `rm <some-file>` will remove or delete `<some-file>`.  
* `cat <some-file>` will display the contents of `<some-file>`.

## Text Editors

You will need to edit simple text files during the exam. You should be able to create a file, edit text, save the file and exit the editor. You should not need any more advanced capabilities.

You should familiarize yourself with the basics of one of three editors available in the Linux terminal:

- [Emacs](https://www.gnu.org/software/emacs/tour/index.html) 
- [VI](http://heather.cs.ucdavis.edu/~matloff/UnixAndC/Editors/ViIntro.html)
- [Nano](https://www.howtogeek.com/howto/42980/the-beginners-guide-to-nano-the-linux-command-line-text-editor/) 

(There are many tutorials available for each editor; above we simply link to the first result that came up in our Google search.)

You only need to be comfortable with one editor, not all three.
