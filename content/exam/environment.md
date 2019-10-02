+++
title = "Exam Environment"
weight = "2"
+++

The exam is administered by the Linux Foundation. The environment is entirely browser-based and runs within a testing framework provided by a company called [PSI](https://www.psionline.com). We will review the basic features of the interface now so you do not need to take time to do this during the exam.

## The Interface

The exam interface is a single web page split into two frames. On the left, you will see the performance-based items. On the right you will see a browser-based terminal window and the multiple choice questions. You are permitted to jump around between all performance-based items and multiple choice questions during the exam.

![annotated exam interface](/images/exam-interface.png)

### Performance-Based Items

Performance-based items prompt you to complete a task or series of tasks using Cloud Foundry. Performance-based items are displayed in the left-hand pane, annotated by the number "1" in the image above. You will be able to scroll forward and backward through the performance-based items ("2" and "3" respectively). You can also jump to an item ("4") or flag an item to come back to later ("5"). 

You will have access to a single org in a Cloud Foundry instance. There will be a space for each performance-based item in this org. **Be sure you target the corresponding space before working on each item**.

Performance based items will dictate specific values to use (like app names). To avoid typos, you should leverage the cut and paste functionality built into the interface. Specific values you may need to cut and paste are highlighted in the interface. If you click on such a value it will be copied to the clipboard. You can then paste these values as needed.

### Terminal tab
In the right-hand pane ("8"), you will see three tabs: one for a browser-based terminal window ("6"), one for for the multiple choice questions ("7"), and a third *not pictured* which contains instructions and reference materials.

In the terminal tab, you will use the CF CLI (preinstalled) to complete the performance-based items. You must use the browser-based terminal. **You cannot use a local terminal on your laptop or the proctor will terminate your exam**. 

The browser-based terminal runs on an Ubuntu Linux virtual machine (VM). There is no option to use a Windows-based system to complete the exam. In the next section, we highlight the basic Unix commands and features you should be familiar with. The unix reference is included in the `Readme` tab (not pictured).

Some performance-based items require using files already on the VM. Be sure you are in the corresponding directory before starting an item. Not all items have directories on this VM.

### Multiple Choice tab
The multiple choice questions are displayed in a tab in the right-hand pane. Like the performance-based items, you can go forward, backward, jump to a specific question, or flag a question to return to later.
		
