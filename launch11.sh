# Run VM normally (with display, not headless). Note that you need a BIOS (OVMF.fd) file present in the directory.
qemu-system-x86_64 -enable-kvm -cpu host -drive format=raw,file=win11.img -bios OVMF.fd -m 2G -cpu host -smp 1 -netdev bridge,br=virbr0,id=net0 -device e1000,netdev=net0
