# Switch manifest for LineageOS Quorndog

### Issues
* RSMouse is missing (maybe do in joycond??)
* HW overlays are forced off

### Patching
Basic:
* Repopick the `nvidia-enhancements-q`, `icosa-bt-lineage-17.1`, `nvidia-shieldtech-q`, `nvidia-beyonder-q` topics off of lineage gerrit.
* Also repopick `287339` and `284553`.
* Apply all patches to their respective directories (from patches folder).

### Notes
* Use foster\_tab if you want Nvidia games.

