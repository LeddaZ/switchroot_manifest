# Switch manifest for LineageOS Quorndog

### Patching
Basic:
* Repopick topics `icosa-bt-lineage-17.1`, `nvidia-shieldtech-q`, `nvidia-beyonder-q` off Lineage Gerrit
* Repopick commits `305978` and `307993` off Lineage Gerrit
* Apply all patches to their respective directories (from patches folder)

### Products
* `icosa_sr`: Standard tablet Android with Nvidia enhancements, based on LineageOS
* `icosa_tv_sr`: Android TV with Nvidia enhancements, based on LineageOS

### Notes
* HWC is forced off for `icosa_sr`
* Nvidia games current do not work (use GLTools for Shield games)
