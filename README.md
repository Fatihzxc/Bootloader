# Bootloader
Bu projede x86 ve ARM mimarileri için bootloader kodları bulunmaktadır.

### Gereklilikler
- nasm
- qemu veya bochs

### Kullanım
- nasm -fbin boot.asm -o boot.bin
- nasm -fbin kernel.asm -o kernel.bin
- cat boot.bin kernel.bin > merhaba_dunya.bin 
- qemu-system-x86_64 merhaba_dunya.bin 

# Proje Geliştiricileri
@sameteraslan
@Fatihzxc
