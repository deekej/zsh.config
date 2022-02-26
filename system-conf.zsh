# vim: filetype=bash

# Source the default system-wide configuration first.
# Fallback to local copy if the system-wide configuration is not available.
# (Typical when running from Fedora Silverblue's Toolbox.)
if [[ -r /etc/profile.d/global-environment.sh ]]; then
  source /etc/profile.d/global-environment.sh
elif [[ -r "${HOME}/.profile.d/global-environment.sh" ]]; then
  source "${HOME}/.profile.d/global-environment.sh"
else
  source "${ZDOTDIR}/profile.d/global-environment.sh"
fi
