org 0x8000 
bits 16
mov si, msg
call printNullTerminatedString

jmp $   ; Sonsuz dongu, surekli suanki satira ziplar
hlt	; Gercek sistemi durdurur(CPU) 
ret     ; Emulatoru durdurur

printCharacter:
	;Bu fonk cagirilmadan once al yazdirilacak karakteri gostermeli
	mov bh, 0x00 ; Yazilacak sayfa, varsayilan 0
	mov bl, 0x00 ; Renk ayari
	mov ah, 0x0E ;
	int 0x10     ; int 0x10, 0x0E = al regdeki karakterleri bastir 
	ret	
printNullTerminatedString:
	pusha ; Butun registerlar kaydedilir
	.loop:
		lodsb ; si -> al karakteri yazar ve si++  
		test al, al ; al == 0 kontrolu
		jz .end
		call printCharacter ; al deki karakteri yazdirir
	jmp .loop ; Bir sonraki karakter bastirilir
	.end:
	popa ; Kaydedilen reg degerlerini geri getirir
	ret
msg db "Merhaba Dunya!"
times 512-($-$$) db 0 ; Kernel 512 byte katlari olmak zorunda
