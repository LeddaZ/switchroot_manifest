# Switch manifest for LineageOS Quorndog

### Issues
* Sensor HAL is missing
* Display configuration tool is missing
* Some funky graphics bugs sometimes
* RSMouse is missing (maybe do in joycond??)
* Beyonder (SATV Remote App) is broken
* SC7 isn't entered if joycons are attached
* WiFi disables itself on sleep wakeup

### Patching
Basic:
* Repopick the `nvidia-enhancements-q`, `nvidia-nvgpu-q`, `icosa-bt-lineage-17.1` topics off of lineage gerrit.
* Also repopick `287339` and `284553`.
* Apply all patches to their respective directories (from patches folder).

### Notes
* Use foster\_tab if you want Nvidia games.

