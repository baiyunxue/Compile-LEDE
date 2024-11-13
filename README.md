# Compile

[![LICENSE](https://img.shields.io/github/license/mashape/apistatus.svg?style=flat-square&label=LICENSE)](https://github.com/Lancenas/actions-openwrt-helloworld/blob/master/LICENSE)
![GitHub Stars](https://img.shields.io/github/stars/Lancenas/actions-openwrt-helloworld.svg?style=flat-square&label=Stars&logo=github)
![GitHub Forks](https://img.shields.io/github/forks/Lancenas/actions-openwrt-helloworld.svg?style=flat-square&label=Forks&logo=github)

- **感谢** [P3TERX/Actions-OpenWrt](https://github.com/P3TERX/Actions-OpenWrt)、[coolsnowwolf/lede](https://github.com/coolsnowwolf/lede)、[Lienol/openwrt](https://github.com/Lienol/openwrt)、[Project ImmortalWrt/openwrt](https://github.com/immortalwrt/immortalwrt)、（https://github.com/kenzok8)

通过导入自定义config文件到.config，在线编译openwrt固件；

编译命令如下:
-
1. 首先装好 Ubuntu 64bit，推荐 Ubuntu 20.04 LTS x64

2. 命令行输入 `sudo apt-get update` ，然后输入
   `
   sudo apt-get -y install build-essential asciidoc binutils bzip2 gawk gettext git libncurses5-dev libz-dev patch python3 python2.7 unzip zlib1g-dev lib32gcc1 libc6-dev-i386 subversion flex uglifyjs git-core gcc-multilib p7zip p7zip-full msmtp libssl-dev texinfo libglib2.0-dev xmlto qemu-utils upx libelf-dev autoconf automake libtool autopoint device-tree-compiler g++-multilib antlr3 gperf wget curl swig rsync
   `

3. 使用 `git clone https://github.com/coolsnowwolf/lede` 命令下载好源代码，然后 `cd lede` 进入目录

4. ```bash
   ./scripts/feeds update -a
   ./scripts/feeds install -a
   make menuconfig
   ```
在lede目录下打开.config文件，复制内容到Compile-LEDE的.config替换其内容

也可以删除.config文件直接在线编译，利用SSH在线配置config文件，前提是网络好最好有梯子，不然很卡容易掉线。

其他源代码操作方法雷同

通过修改diy-part1.sh文件修改feeds.conf.default配置。

通过修改diy-part2.sh文件可以自定义默认IP等。按我的需要现在的默认IP为192.168.10.1

![2021-07-18_230822](https://user-images.githubusercontent.com/84278744/126072452-6103adc4-0e19-4816-a769-e67d15ee1c21.png)

手动点击Run Workflows触发开始编译，默认SSH关闭false，有需要可以修改为true开启

在触发工作流程后，默认SSH: true在 Actions 页面等待执行到SSH connection to Actions步骤，会出现下面信息：

To connect to this session copy-n-paste the following into a terminal or browser:

ssh Y26QeagDtsPXp2mT6me5cnMRd@nyc1.tmate.io

https://tmate.io/t/Y26QeagDtsPXp2mT6me5cnMRd

复制 SSH 连接命令粘贴到终端内执行，或者复制链接在浏览器中打开使用网页终端，登陆云menuconfig（Ctrl+C进入页面）

命令：cd openwrt && make menuconfig

新手参考OpenWrt MenuConfig设置和LuCI插件选项说明

完成后按快捷键Ctrl+D或执行exit命令退出，后续编译工作将自动进行。

这样比较灵活，可以根据路由器硬件通过云menuconfig自定义配置固件，不需要再导出.config和上传

进阶玩法请看P3TERX的中文教程
https://p3terx.com/archives/build-openwrt-with-github-actions.html
