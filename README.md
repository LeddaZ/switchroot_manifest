# Switch manifest for LineageOS Redvelvetcake

### Patching
Basic:
* Repopick topics `icosa-bt-r`, `nvidia-shieldtech-r`, `nvidia-beyonder-r`, and `nvidia-nvgpu-r` off Lineage Gerrit
* Repopick commits `308972` and `304329` off Lineage Gerrit
* Apply all patches to their respective directories (from patches folder)

### Products
* `icosa_sr`: Standard tablet Android with Nvidia enhancements, based on LineageOS
* `icosa_tv_sr`: Android TV with Nvidia enhancements, based on LineageOS

### Notes
* HWC is forced off for `icosa_sr`
* Nvidia games current do not work (use GLTools for Shield games)
* Volume UI broken on `icosa_sr`
* Nvidia enhancements incomplete
* Surface rendering glitches
