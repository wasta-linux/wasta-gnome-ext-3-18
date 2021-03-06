#!/bin/bash

# ==============================================================================
# wasta-gnome-ext-postinst.sh
#
#   This script is automatically run by the postinst configure step on
#       installation.  It can be manually re-run, but is
#       only intended to be run at package installation.
#
#   2015-12-26 rik: initial script
#   2015-12-30 rik: adding user-theme schema compile
#   2016-06-15 rik: adding workspace-isolated-dash schema compile
#   - adding topicons schema compile
#
# ==============================================================================

# ------------------------------------------------------------------------------
# Check to ensure running as root
# ------------------------------------------------------------------------------
#   No fancy "double click" here because normal user should never need to run
if [ $(id -u) -ne 0 ]
then
	echo
	echo "You must run this script with sudo." >&2
	echo "Exiting...."
	sleep 5s
	exit 1
fi

# ------------------------------------------------------------------------------
# Initial Setup
# ------------------------------------------------------------------------------

echo
echo "*** Script Entry: wasta-gnome-ext-postinst.sh"
echo

# ------------------------------------------------------------------------------
# Dconf / Gsettings Default Value adjustments
# ------------------------------------------------------------------------------
# Values in /usr/share/glib-2.0/schemas/z_10_wasta-core.gschema.override
#   will override Ubuntu defaults.
# Below command compiles them to be the defaults
echo
echo "*** Updating dconf / gsettings default values"
echo

# recompile gnome-shell extension schemas that we have placed overrides in.
glib-compile-schemas \
    /usr/share/gnome-shell/extensions/dash-to-dock@micxgx.gmail.com/schemas/

glib-compile-schemas \
    /usr/share/gnome-shell/extensions/gnomenu@panacier.gmail.com/schemas/

glib-compile-schemas \
    /usr/share/gnome-shell/extensions/TopIcons@phocean.net/schemas/

glib-compile-schemas \
    /usr/share/gnome-shell/extensions/user-theme@gnome-shell-extensions.gcampax.github.com/schemas/

glib-compile-schemas \
    /usr/share/gnome-shell/extensions/windowoverlay-icons@sustmidown.centrum.cz/schemas/

glib-compile-schemas \
    /usr/share/gnome-shell/extensions/workspace-isolated-dash@n-yuki/schemas/

# ------------------------------------------------------------------------------
# Finished
# ------------------------------------------------------------------------------
echo
echo "*** Script Exit: wasta-gnome-ext-postinst.sh"
echo

exit 0
