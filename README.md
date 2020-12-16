# Switch manifest for LineageOS Quorndog

### Issues
* We use hacks? for hwc on client target, probably fine
* RSMouse is missing (maybe do in joycond??)
* Beyonder (SATV Remote App) is broken

### Patching
Basic:
* Repopick the `nvidia-enhancements-q`, `nvidia-nvgpu-q`, `icosa-bt-lineage-17.1` topics off of lineage gerrit.
* Also repopick `287339` and `284553`.
* Apply all patches to their respectiVe directories (from patches folder).

### Notes
* Use foster\_tab if you want Nvidia games.

