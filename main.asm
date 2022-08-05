INCLUDE Irvine32.inc

print PROTO, count: DWORD

START = 2
END = 1000;

.data
  primes BYTE ",", 0
  s BYTE END DUP (?)

.code
  main PROC
    mov ecx, END
    mov edi, OFFSET s
    mov al, 0
    cld
    rep stosb
    mov esi, START

  .WHILE Esi < END
    .IF s [esi * TYPE s] == 0
      call multi
    .ENDIF
    inc esi
  .ENDW
  exit
  main ENDP

  multi PROC
  push eax
  push esi
  mov eax, esi
  add esi, eax

L1: 
  cmp esi, last
  ja L2
  mov s [esi * TYPE s], 1
  add esi, eax
  jmp L3

L2: 
  pop esi
  pop eax
  multi ENDP

  print PROC, count: DWORD
  mov esi, 1
  mov eax, 0
  mov ecx, count

L3: 
  mov al, s[esi * TYPE s]
  .IF Al == 0
    mov eax, esi
    call WriteDec
    mov edx, OFFSET primes
    call WriteString
  .ENDIF
    inc esi
    loop L3
  ret
print ENDP
END main
