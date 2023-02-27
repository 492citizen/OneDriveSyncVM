# OneDriveSyncVM
Run a headless Windows virtual machine in the background to synchronize to your OneDrive. This is a viable solution if your Company or Organization does not allow programs like "rclone".

This is accomplished by running a Samba share on the directory where OneDrive is syncing to and mounting that from the host OS. Running a samba share on the host and connecting to it from the virtual machine does not do the trick because OneDrive does not allow syncing to a network drive.

1. Install OneDrive in the virtual machine and set up a synced directory
2. Start a Samba server on the directory
3. Connect to the Samba server from the host OS.

The machine is connected to the host via a network bridge and is not accessible from other computers on your network.

## Windows

Depending on your Windows version you may need to edit the qemu-system launch commands. For Windows 11 you will need to pass a BIOS file to the command. You can usually find one under /user/share/edk2/x64/OVMF.fd

## Files & Directories
The systemd directory contains whatever you need to set up a systemd process to automatically run the virtual machine on startup and mount it. The .service file belongs in /etc/systemd/system.
The qemu.d directory contains configurations for all your systemd-constrolled virtual machines and belongs in /etc/conf.d/

The WindowsConfig directory has some .reg files for different purposes. enable_onedrive.reg for instance was only needed when I tried running OneDrive in a Tiny10 / Tiny11 machine where it is disabled by default.

launch.sh launches the machine normally (with display, not headless).
