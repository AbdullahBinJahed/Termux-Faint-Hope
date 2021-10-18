mkdir ~/dir
termux-setup-storage
echo Y | pkg upgrade -y
pkg install -y x11-repo
pkg install -y clang lld cmake autoconf automake libtool '*ndk*' make python git libandroid-shmem-static 'vulkan*' ninja llvm bison flex libx11 libdrm libpixman libxfixes libjpeg-turbo xtrans libxxf86vm xorg-xrandr xorg-font-util xorg-util-macros libxfont2 libxkbfile libpciaccess xcb-util-renderutil xcb-util-image xcb-util-keysyms xcb-util-wm xorg-xkbcomp xkeyboard-config libxdamage libxinerama
pip install meson mako
cd ~/dir
git clone --depth 1 git://github.com/freedesktop/xorg-xorgproto.git
git clone --depth 1 git://github.com/wayland-project/wayland.git
git clone --depth 1 git://github.com/wayland-project/wayland-protocols.git
git clone --depth 1 git://github.com/freedesktop/libxshmfence.git
git clone --single-branch --shallow-since 2021-02-22 git://github.com/mesa3d/mesa.git 
git clone --depth 1 git://github.com/dottedmag/libsha1.git
git clone --depth 1 git://github.com/anholt/libepoxy.git
git clone -b xorg-server-1.20.13 --depth 1 git://github.com/freedesktop/xorg-xserver.git
git clone --depth 1 git://github.com/glmark2/glmark2.git
cd ~/dir/xorg-xorgproto
./autogen.sh --prefix=$PREFIX --with-xmlto=no --with-fop=no --with-xsltproc=no
./configure --prefix=$PREFIX --with-xmlto=no --with-fop=no --with-xsltproc=no
make -j8 install
cd ~/dir/wayland
mkdir b
cd b
meson -Dprefix=$PREFIX -Ddocumentation=false ..
ninja install
cd ~/dir/wayland-protocols
./autogen.sh --prefix $PREFIX
./configure --prefix $PREFIX
make -j8 install
cd ~/dir/libxshmfence
./autogen.sh --prefix=$PREFIX --with-shared-memory-dir=$TMPDIR
./configure --prefix=$PREFIX --with-shared-memory-dir=$TMPDIR
sed -i s/values.h/limits.h/ ./src/xshmfence_futex.h
make -j8 install CPPFLAGS=-DMAXINT=INT_MAX
cd ~/dir/mesa
git checkout b8970120545b3cb250821013cb459bf4d2acfda4
git apply /sdcard/patches/mesa_zink.patch
mkdir b
cd b

meson .. configure -Dcpp_args=-fno-lifetime-dse -Dc_args='-Wno-error=incompatible-function-pointer-types -fno-lifetime-dse'

ninja install
cd ~/dir/libsha1
./autogen.sh --prefix=$PREFIX
./configure --prefix=$PREFIX
make -j8 install
cd ~/dir/libepoxy
git apply /sdcard/patches/libepoxy.patch
mkdir b
cd b
meson -Dprefix=$PREFIX -Degl=yes -Dglx=yes -Dtests=false -Dx11=true ..
ninja install
cd ~/dir/xorg-xserver
git apply /sdcard/patches/xserver.patch
./autogen.sh --enable-mitshm --enable-xcsecurity --enable-xf86bigfont --enable-xwayland --enable-xorg --enable-xnest --enable-xvfb --disable-xwin --enable-xephyr --enable-kdrive --disable-devel-docs --disable-config-hal --disable-config-udev --disable-unit-tests --disable-selective-werror --disable-static --without-dtrace --disable-glamor --enable-dri --enable-dri2 --enable-dri3 --enable-glx --with-sha1=libsha1 --with-pic --prefix=$PREFIX
./configure --enable-mitshm --enable-xcsecurity --enable-xf86bigfont --enable-xwayland --enable-xorg --enable-xnest --enable-xvfb --disable-xwin --enable-xephyr --enable-kdrive --disable-devel-docs --disable-config-hal --disable-config-udev --disable-unit-tests --disable-selective-werror --disable-static --without-dtrace --disable-glamor --enable-dri --enable-dri2 --enable-dri3 --enable-glx --with-sha1=libsha1 --with-pic --prefix=$PREFIX ; make -j8 install LDFLAGS='-fuse-ld=lld /data/data/com.termux/files/usr/lib/libandroid-shmem.a -llog'
cd ~/dir/glmark2
mkdir b
cd b
meson -Dprefix=$PREFIX -Dflavors=x11-gl ..
ninja install
cd
# XDG_RUNTIME_DIR=$TMPDIR $PREFIX/bin/Xwayland &
export GALLIUM_DRIVER=zink
# export DISPLAY=:0
export DISPLAY=:1
# glmark2 --fullscreen -b jellyfish -b refract -b terrain -b desktop

