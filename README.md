Gentoo Cgroup Wrapper for Browsers
==================================

This repository contains a simple cgroup wrapper to put applications into their
own systemd slice to limit their resource usage. This is especially useful
because modern browsers tend to dominate the file system cache for their own
continuous IO usage (caching, libraries). It is also possible to limit
runaway CPU usage with this. Systems with long running browsers sessions and
a lot of open tabs can greatly benefit from this and system responsiveness
is restored.

To do this, we hook the portage installation functions to rename the
original application launcher, put a wrapper script instead which then calls
the original executable through systemd-run.

It also provides systemd slices where you can adjust the limits.

Currently supported browsers:

  * Firefox Stable (www-client/firefox-bin)
  * Google Chrome Stable (www-client/google-chrome)
  * Vivaldi Stable (www-client/vivaldi)

Adding more applications is as simple as:

1. Find which scripts start the application in your .desktop files
   (/usr/share/applications)
2. Add these to bashrc.cgroup-wrapper
3. Reinstall the package


Prerequisites
-------------

The system must run and boot with systemd. At login, pam must spawn a user
systemd instance because we create a resource slice in it to jail the
browser into.


Installation
------------

Place the contained files in your file system and source the portage hooks
into portage's bashrc. Then reinstall one of the supported applications.

You can run `make install` to do the copying. You'd still need to properly
hook into portage and reinstall packages.


Uninstallation
--------------

Remove the bashrc hook from portage and reinstall your applications, then
remove the remaining files.


Contribute
----------

Clone the repository, add your changes and send a pull request.


Disclaimer
----------

Use as-is and use at your own risk.

[//]: # ( vi: set tw=76: )
