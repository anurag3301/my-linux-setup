# DWMBAR: status bar for your DWM
### Original project: [thytom/dwmbar](https://github.com/thytom/dwmbar), leave him a star :)
#### This is how it looks

![image](https://user-images.githubusercontent.com/52702259/160875456-327953a5-bdc9-4f09-91a2-00b796c7198f.png)

![image](https://user-images.githubusercontent.com/52702259/160874935-b399606f-4d1c-4393-9030-987e3672443d.png)

![image](https://user-images.githubusercontent.com/52702259/160875177-404b119d-d00d-484f-aa91-d51bdf109fea.png)

## Setup
+ Get my dwm build from [here](https://github.com/anurag3301/my-dwm)
    + If dont wanna get my dwm build and integrate into your own then first add these two patch [dwm-statucolours-fix.diff](https://github.com/anurag3301/my-dwm/blob/main/patches/dwm-statucolours-fix.diff) and [dwm-statuscolors-20181008-b69c870.diff](https://github.com/anurag3301/my-dwm/blob/main/patches/dwm-statuscolors-20181008-b69c870.diff)
    + Add the colour mention in my `config.def.h` or just add your own
+ Dwmbar is modular so you can have modules you want and leave the rest. All the current modules are in `dwmbar/modules`.
+ Edit the `dwmbar/config` file and add or remove the required modules.
+ Just run `sudo ./install.sh`

You can also create your own modules, you can refer `dwmbar/module/time` for a reference.

