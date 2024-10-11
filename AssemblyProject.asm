INCLUDE 'EMU8086.INC' 
org 100h            ;include package
.MODEL SMALL
.STACK 100h
.DATA
 
    arr db 5 dup(?) ;for ascending
    arr1 db 5 dup(?) ; for descending 
    
    
   password db 's','u','p'

    
    
.CODE
   MAIN PROC 
    mov ax,@data
    mov ds,ax
    mov si,offset password
     
    print '                WELCOME TO THE PROGRAM !!! '
        printn
        printn
        print 'PRESENTED BY :'
        printn  
        print '{Waleed-188}-{Samra-422}-{MahaNoor-417}-{Hasrat-333}-{Anum-146}'
        printn 
        printn 
        mov dl,13
back:  
mov cx,3
    print 'Enter Your Remembered Password To Continue : '  
    
   
      
passcheck:
    mov ah,01
    int 21h
    
    cmp al,[si]
    jne incorect
    inc si

   

loop passcheck 
    printn  

    print 'PASSWORD MATCHED - ACCESS GRANTED '
    printn
    printn
    print 'Please Select Once To Continue :  ' 
    printn
    print '1)  Open Ascending Program '
    printn
    print '2)  Open Descending Program '
    printn
    print '3)  Open Shift LEFT Program '
    printn
    print '4)  Open Shift RIGHT Program '         
    printn
    print '5)  Open Stack Program ' 
    printn
    print '6)  Open Calculator Program'  
    printn
    print '7)  Logical Instructions' 
    printn
  
    
    
    
choice:    
printn
    print 'Enter your choice : '
    mov ah,01
    int 21h
      
    cmp al , '1'
    je one
    jne notone
    
    one:    

    call ascend
    jmp outside
    notone:
    
    cmp al,'2'
    je two
    jne nottwo
    two:
    call descend 
    
    
    jmp outside
    nottwo: 
    
    cmp al,'3'
    je three
    jne notthree
    three:
    call shft
    
    jmp outside
    notthree: 
    
    cmp al,'4'
    je four
    jne notfour
    four:       
    call sarft
    jmp outside
    notfour:
    
    cmp al,'5'
    je five
    jne notfive
    five:
    call stack
    jmp outside
    notfive:
    
    cmp al,'6'
    je six
    jne notsix
    six: 
    call calc
    ;     CODE HERE FOR IF
    jmp outside
    notsix: 
    
    cmp al,'7'
    je seven
    jne notseven
    seven:
        call logical
  ; jmp outside
    notseven:
  
   
     
    
   outside:                           
   printn
           print 'None Function Exist' 
           printn 
           jmp choice
   incorect: 
printn
   print 'TRY AGAIN !!! '
printn
   jmp back 
     
   
  
main endp

 

ascend proc 
        print '              ASCENDING PROGRAM CODE'
        printn
        mov dl,13
        
        mov ax,@data
        mov ds,ax
 print 'Enter Any Array Number = ' 
        mov cx,5
        mov bx,offset arr
        
inputs: 
        mov ah,1
        int 21h
        mov [bx],al
        inc bx
        loop inputs
 
       mov cx,5
       dec cx
OuterLoop:
       mov bx,cx
       mov si,0
 
Comploop:
      mov al,arr[si] ;index-0
     mov dl,arr[si+1] ;index 0+1
     cmp al,dl
 
     jl noSwap    ;if 1st samll 2nd big->->-> NOSWAP
 
    mov arr[si],dl     ;swpng
    mov arr[si+1],al
noSwap:
     inc si         ;0+1
     dec bx          ;5-1
     jnz comploop
 
    loop OuterLoop
    mov ah,2
    mov dl,10
    int 21h
 
    mov dl,13
    int 21h
 print 'Ascending Sorted Array = '
    mov cx,5
    mov bx,offset arr
Outputs: 
    mov dl,[bx]
    mov ah,2
    int 21h
 
    inc bx
 loop Outputs
 printn
 mov dl,13
 int 21h

        ;call passcheck
    call exit
ascend endp
   
   
  ;//////////////////////////////////////
  descend proc  
    printn
    mov dl,13
    print '              DESCENDING PROGRAM CODE'
    printn
    mov dl,13
    int 21h
    
    mov ax,@data
       mov ds,ax
 
 print 'Enter Any array = ' 
       mov cx,5
       mov bx,offset arr1
       
inputsa:
       mov ah,1 
       int 21h
       mov [bx],al
       inc bx
 loop inputsa
       mov cx,5
       dec cx
outerloopsa:
       mov bx,cx
       mov si,0
comploopsa:
       mov al,arr1[si]
       mov dl,arr1[si+1]
       cmp al,dl

 jg noswapsa
 
     mov arr1[si],dl
     mov arr1[si+1],al
noswapsa:
     inc si
     dec bx
     jnz comploopsa
 
     loop outerloopsa

     mov ah,2
     mov dl,10
     int 21h
 
      mov dl,13
      int 21h
 print 'Sorted array = '
      mov cx,5
      mov bx,offset arr1
outputsa: 
       mov dl,[bx]
       mov ah,2
       int 21h
 
       inc bx
       loop outputsa 
       printn
       mov dl,13
  
       int 21h
              call exit
descend endp
  
  
  
  ;/////////////////////////
  
  logical proc
    printn
    printn
mov dl,13
print '             LOGICAL INSTRUCTIONS CODE'
printn

print 'Value To Operate On : 10001010b '
printn
mov dl,13
 
mov ax,10001010b
print 'Mask Value : 10000111b '
printn
printn
mov dl,13

mov bx,10000111b ;mask

mov dx,ax  ;copy of ax
mov cx,dx  ;copy of ax

 
and ax,bx       ;frst
print 'Result of AND Operation : 10000010b  '
printn
mov dl,13
 
or  dx,bx       ;scnd
print 'Result of OR Operation : 10001111b '
printn
mov dl,13

 
xor cx,bx     ;thrd
print 'Result of XOR Operation : 00001101b '
printn
printn 
mov dl,13


print 'LOGICAL OPERATIONS EXECUTED'
mov dl,13

printn
printn

   
           call exit


logical endp 
  
  
  
  
  ;////////////////
  shft proc
    print '                      SHIFT-RIGHT CODE'
    printn
    mov dl,13
    
     
    mov ax,85         ; 85 = 01010101b
    mov dx,ax         
    
    print 'VALUE TO BE OPERATED ON : 85'
    printn
    mov dl,13
    
    shl al,1          ;
    print 'After SHL-Counter 1 : 170'                     
    printn
    mov dl,13
    
    shl al,2           ;mul shf-left by counter 2
    print 'After SHL-Counter 2 : 168'
    printn
    mov dl,13
    
    sal dl,1           ;mul shf-left by counter 1 
    print 'After SAL-Counter 1 : 170'                     
    printn
    mov dl,13
    sal dl,2           ;mul shf-left by counter 2
    print 'After SAL-Counter 1 : 168'                     
    printn
    mov dl,13  
   
    printn
    mov dl,13
    
     
                     call exit
          
    shft endp
  
;//////////////////////////////////////////////////              
              
              
     sarft proc
       
       printn
             mov ax,15
             mov dx,ax
       
          printn
          mov dl,13
          
          
          shr al,1
          print 'SHR-Count 1 = 7'
          printn
          mov dl,13
          
          
          shr al,2
          print 'SHR-Count 2 = 3'
          printn
          mov dl,13
          
          
          sar dl,1
          print 'SAL-Count 1 = 7'
          printn
          mov dl,13
          
          sar dl,2
          print 'SAL-Count 2 = 3'                      
          printn
          mov dl,13                      


        printn
        printn
                 call exit
        sarft endp         
;/////////////////////////////////////////////////              
              
      stack proc  
           print '                  STACK CODE'
        printn
        mov dl,13
        
        
         MOV CX,5            ;will take 5 letter
        PRINT "Enter a string: "  
        
       
    inputwa:
        MOV AH,1
        INT 21H
        MOV BL,AL
        PUSH BX
       LOOP  inputwa
       
      
    
     
    printn
     int 21h              ;new line print
    ; PRINT "Reverse of this string: " 
      printn
      mov dl,13
        
     MOV CX,5  
     outputwa:
        POP BX
        MOV DL,BL
        MOV AH,02 
        int 21h
       
        
       LOOP outputwa
         
         printn
        printn
        mov dl,13
              printn
 
                 call exit
        stack endp        
                
;///////////////////////////////////////////////////////////////////////////////////////////                
                
       calc proc 
        
        print '                  MINI CALCULATOR CODE'
    
    printn
    mov dl,13
    
    
    print 'Give 1st Number : '
mov ah,01h
int 21h
mov bl,al
mov cl,al
;line spacing
printn
mov ah,02h
int 21h
mov dl,13

print 'Give 2Nd Number : '
mov ah,01h
int 21h
add bl,al
sub bl,48
;line spacing
printn
mov ah,02h
int 21h
mov dl,13
mov ah,02h
int 21h
print 'Addition-Result : '
mov dl,bl
mov ah,02h
int 21h
;line spacing
printn
mov ah,02h
int 21h
mov dl,13
mov ah,02h
int 21h
print 'Subtraction-Result : '
sub bl,cl
add bl,48
mov al,cl
sub al,bl
add al,48
mov dl,al
mov ah,02h
int 21h
;line spacing
printn
mov ah,02h
int 21h
mov dl,13
mov ah,02h
int 21h
print 'Multiplication-Result : '
mov al,cl
sub al,48
sub bl,48
mul bl
add al,48
mov dl,al
mov ah,02h
int 21h
;line spacing
printn
mov ah,02h
int 21h
mov dl,13
mov ah,02h
int 21h
print 'Division-Result : '
mov al,cl
sub al,48
sub bl,48
div bl
add al,48
mov dl,al
mov ah,02h
int 21h 


printn
printn
printn 
mov dl,13
int 21h  
          call exit
          calc endp
       
       
       
  exit proc
  
        printn
        print '              THE PROGRAM TERMINATES HERE!!!'         
                
        
  exit endp
  end main
