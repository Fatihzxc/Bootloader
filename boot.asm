org 0x7C00 ; Bu kodun baslangic adresini belirtiyor.

mov ah, 0  ; 
int 0x13   ; 0x13 ah=0 Disk Sistemini Resetleme

;Harddiskten okunup RAM e yazilir
mov bx, 0x8000     ; bx = Yazilacak adres
mov al, 1 	   ; al = Okunacak sektor adedi
mov ch, 0          ; cylinder/track = 0
mov dh, 0          ; head           = 0
mov cl, 2          ; sector         = 2
mov ah, 2          ; ah = 2: surucuden oku
int 0x13           ; => ah = status, al = amount read

jmp 0x8000 ; 8000h adresine ziplanir

times 510-($-$$) db 0 ; ($-$$)=suanki adres - baslangic adresidir. Boyutu 510 byte a 0 koyarak tamamlar.

;Boot son imzasi 
db 0x55 ;byte 511 = 0x55
db 0xAA ;byte 512 = 0xAA
