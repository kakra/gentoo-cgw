Gentoo Cgroup Wrapper for Browsers
==================================

This repository contains a simple cgroup wrapper to put browsers into their
own systemd slice to limit their resource usage. This is especially useful
because modern browsers tend to dominate the filesystem cache for their own
continuous IO usage (caching, libraries). It is also possible to limit
runaway CPU usage with this. Systems with long running browsers sessions and
a lot of open tabs can greatly benefit from this and system responsiveness
is restored.

To do this, we hook the portage installation functions to rename the
original browser start script, put a wrapper script instead which then calls
the original script through systemd-run.

It also provides a systemd slice where you can adjust the limits.

Currently supported browsers:

  * Google Chrome Stable (www-client/google-chrome)
  * Vivaldi Stable (www-client/vivaldi)

Adding more browsers is as simple as:

1. Find which scripts start the browser in your .desktop files
   (/usr/share/applications)
2. Add these to bashrc.cgroup-wrapper-browser
3. Reinstall the package


Prerequisites
-------------

The system must run and boot with systemd. At login, pam must spawn a user
systemd instance because we create a resource slice in it to jail the
browser into.


Installation
------------

Place the contained file in your file system and source the portage hooks
into portage's bashrc. Then reinstall one of the supported browsers.

Do not put the wrapper somewhere else then /usr/local/libexec because it
currently checks its caller name to prevent looping. This may be fixed later
(PRs welcome).


Uninstallation
--------------

Remove the bashrc hook from portage and reinstall your browsers, then
remove the remaining files.


Contribute
----------

Clone the repository, add your changes and send a pull request.


Disclaimer
----------

Use as-is and use at your own risk.

[//]: # ( vi: set tw=76: )
