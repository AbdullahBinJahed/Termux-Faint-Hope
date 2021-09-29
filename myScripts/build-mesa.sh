#!bin/bash
cd
git clone https://github.com/mesa3d/mesa.git
cd mesa
sed -i '1355s/,\ \x27getrandom\x27//g' meson.build
mkdir build
cd build
LDFLAGS="$PREFIX/lib/libandroid-shmem.a -llog" meson --prefix $PREFIX -Dplatforms=x11 -Ddri3=true -Ddri-drivers='' -Dgallium-drivers=swrast -Dgallium-xvmc=false -Dgallium-omx=disabled -Dgallium-va=false -Dgallium-xa=false -Dgallium-nine=false -Dgallium-opencl=disabled -Dopencl-spirv=false -Dglvnd=false -Dvulkan-drivers='' -Dshader-cache=true -Dvulkan-overlay-layer=false -Dshared-glapi=true -Dgles1=false -Dgles2=false -Dopengl=true -Dgbm=false -Dglx=gallium-xlib -Degl=false -Dglvnd=false -Dllvm=true -Dshared-llvm=true -Dvalgrind=false -Dlibunwind=false -Dlmsensors=false -Dbuild-tests=false -Dinstall-intel-gpu-tests=false -Dselinux=false -Dosmesa=false -Dtools='' -Dglx-direct=true;ninja install

