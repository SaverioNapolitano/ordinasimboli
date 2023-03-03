.586
.model flat
.code

_ordinasimboli proc

push ebp
mov ebp,esp
push esi
push edi
push ebx

mov ebx, dword ptr[ebp+8]
mov esi,0
mov cl, byte ptr[ebx+esi]

mov edx, dword ptr[ebp+12]
mov edi,0

call convertistringa

mov cl, byte ptr[ebx+esi]
mov byte ptr[edx+edi],0
ciclo:
cmp cl, 0
je fineciclo
cmp cl, 32
jne simbolo
fineparagone:
inc esi
mov cl, byte ptr[ebx+esi]
jmp ciclo

simbolo:
call controlla
cmp eax,1
je fineparagone
mov byte ptr[edx+edi], cl
mov byte ptr[edx+edi+1],0
inc edi
jmp fineparagone


fineciclo:

call ordina

mov eax,0

pop ebx
pop edi
pop esi
mov esp,ebp
pop ebp
ret
_ordinasimboli endp

ordina proc

push ebx
push eax
push edx
push esi
push edi

mov esi,0
mov edi,0

cicloesterno:
mov cl, byte ptr[edx+edi]
cmp cl,0
je fineordinamento
ciclointerno:
cmp esi,edi
je stessaposizione
cmp byte ptr[edx+esi],0
je fineciclointerno
cmp cl, byte ptr[edx+esi]
jl forsecambio
fineiterazione:
inc esi
jmp ciclointerno


stessaposizione:
jmp fineiterazione

forsecambio:
cmp esi,edi
jl scambio
jmp fineiterazione


scambio:
mov al, cl
mov cl, byte ptr[edx+esi]
mov byte ptr[edx+esi], al
mov byte ptr[edx+edi], cl
jmp fineiterazione

fineciclointerno:
mov esi,0
inc edi
jmp cicloesterno

fineordinamento:

pop edi
pop esi
pop edx
pop eax
pop ebx
ret
ordina endp

convertistringa proc

push esi
push edi
push ebx
push ecx
push edx

iniziociclo:
cmp cl,0
je fine
cmp cl, 65
jge forseletteramaiuscola


fineconfronto:
inc esi
mov cl, byte ptr[ebx+esi]
jmp iniziociclo



forseletteramaiuscola:
cmp cl, 90
jle sostituiscispazio
cmp cl,97
jge forseletteraminuscola
jmp fineconfronto

forseletteraminuscola:
cmp cl, 122
jle sostituiscispazio
jmp fineconfronto

sostituiscispazio:
mov cl, 32
mov byte ptr[ebx+esi], cl
jmp fineconfronto

fine:

pop edx
pop ecx
pop ebx
pop edi
pop esi
ret
convertistringa endp

controlla proc
push ebx
push edi
push esi
push edx

mov edi,0
mov eax,0

ciclocontrollo:
cmp byte ptr[edx+edi],0
je finecontrollo
cmp byte ptr[edx+edi], cl
je presente
inc edi
jmp ciclocontrollo


presente:
mov eax,1

finecontrollo:

pop edx
pop esi
pop edi
pop ebx
ret
controlla endp
end