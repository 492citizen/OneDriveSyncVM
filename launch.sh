# Run VM normally (with display, not headless)
qemu-system-x86_64 -enable-kvm -drive file=<Path-to-Image.img> -m 2G -cpu host -smp 1 -vga virtio -display sdl,gl=on -netdev bridge,br=virbr0,id=net0 -device e1000,netdev=net0
