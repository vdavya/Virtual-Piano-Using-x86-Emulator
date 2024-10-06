
; You may customize this and other start-up templates;
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h


main: call menu





ret


;---------------
;Variable dictionary!
;---------------
a db 97
b db 98
c db 99
d db 100
e db 101
f db 102
g db 103
h db 104
i db 105
j db 106
k db 107
l db 108
m db 109
n db 110
o db 111
p db 112
q db 113
r db 114
s db 115
t db 116
u db 117
v db 118
w db 119
x db 120
y db 121
z db 122
principal db 0

red db 12     ;The red in the code corresponds to the color of the notess.
color db 15
music_choice db 0
ret_cho_mus db 0

;----------------
menu:
;---------------
mov principal, 1
call clear_screen

;----------------
menu_principal:
;----------------
      mov guitar,  0            ; we reset everything to 0
      mov ret_cho_mus, 0
      mov music_choice, 0
      mov num_erase, 0
      mov num_games, 0
      mov choice, 0
      mov watch, 0
      mov watch_check, 0
      mov check_return, 0
      mov computer_game, 0
      mov iteration_watch, 0
      mov principal, 0
      mov iteration, 0


      mov ah, 02h
      mov dh, 00h
      mov dl, 00h
      int 10h
      mov ah, 09h
      mov dx, OFFSET message0
      int 21h



      mov ah, 02h
      mov dh, 01h
      mov dl, 00h
      int 10h
      mov ah, 09h
      mov dx, OFFSET message
      int 21h

      mov ah, 02h
      mov dh, 02h
      mov dl, 00h
      int 10h
      mov ah, 09h
      mov dx, OFFSET message2
      int 21h

      mov ah, 02h
      mov dh, 03h
      mov dl, 00h
      int 10h
      mov ah, 09h
      mov dx, OFFSET message3
      int 21h

      mov ah, 02h
      mov dh, 04h
      mov dl, 00h
      int 10h
      mov ah, 09h
      mov dx, OFFSET message4
      int 21h

      mov ah, 02h
      mov dh, 05h
      mov dl, 00h
      int 10h
      mov ah, 09h
      mov dx, OFFSET message5
      int 21h

      mov ah, 02h
      mov dh, 06h
      mov dl, 00h
      int 10h
      mov ah, 09h
      mov dx, OFFSET message6
      int 21h

      mov ah, 07h
      int 21h
      cmp al, a
      je menu_free1
      cmp al, b
      je training0
      cmp al, c
      je MENU_WATC
      cmp al, d
      je choice_color
      cmp al, f
      je menu_guitar
      jne menu_principal






num_erase db 0
num_games db 0                                  ;Know which return mode
choice db 0                                     ;Know in which menu to return

message0 db "             **************************************            $"
message  db "             *  Hello, welcome to EmuPiano. *            $"
message2 db "             **************************************            $"
message3 db "                   A: Free to play !                $"
message4 db "                   B: Training!                     $"
message5 db "                   C: Watch me play!                $"
message6 db "                   D: Super option ! and F:Guitar!  $"

;-----------------
;Swap color! Because it's fun !
;-----------------

choice_color:
                      mov principal, 1
                      mov ah, 02h
                      mov dh, 00h
                      mov dl, 00h
                      int 10h
                      mov ah, 09h
                      mov dx, OFFSET msg_col1
                      int 21h

                      mov ah, 02h
                      mov dh, 01h
                      mov dl, 00h
                      int 10h
                      mov ah, 09h
                      mov dx, OFFSET msg_col2
                      int 21h

                      mov ah, 02h
                      mov dh, 02h
                      mov dl, 00h
                      int 10h
                      mov ah, 09h
                      mov dx, OFFSET msg_col3
                      int 21h

                      mov ah, 02h
                      mov dh, 03h
                      mov dl, 00h
                      int 10h
                      mov ah, 09h
                      mov dx, OFFSET msg_col4
                      int 21h

                      mov ah, 02h
                      mov dh, 04h
                      mov dl, 00h
                      int 10h
                      mov ah, 09h
                      mov dx, OFFSET msg_col5
                      int 21h

                      mov ah, 02h
                      mov dh, 05h
                      mov dl, 00h
                      int 10h
                      mov ah, 09h
                      mov dx, OFFSET msg_col6
                      int 21h

                      mov ah, 02h
                      mov dh, 06h
                      mov dl, 00h
                      int 10h
                      mov ah, 09h
                      mov dx, OFFSET msg_col7
                      int 21h

                      mov ah, 07h
                      int 21h
                      cmp al, b
                      je blue
                      cmp al, m
                      je magenta
                      cmp al, v
                      je green
                      cmp al, j
                      je yellow
                      cmp al, o
                      je white
                      cmp al, w
                      je touch_green
                      cmp al, x
                      je touch_yellow
                      cmp al, c
                      je touch_magenta
                      cmp al, r
                      je touch_red
                      jne choice_color

blue: mov color, 9
       call clear_screen

magenta: mov color, 13
          call clear_screen

green: mov color, 2
       call clear_screen

yellow: mov color, 14
        call clear_screen

white: mov color, 15
        call clear_screen

touch_green: mov red, 2
             call clear_screen

touch_yellow: mov red, 14
              call clear_screen

touch_magenta: mov red, 13
                call clear_screen

touch_red: mov red, 12
              call clear_screen

msg_col1 db "Choose the color of your interface!                                   $"
msg_col2 db "B  : For a super blue that sends peanuts!                         $"
msg_col3 db "M  : For a mangenta that turns purple!                                   $"
msg_col4 db "V  : For a pretty green like the kiwi!                                      $"
msg_col5 db "J  : In case you want to kill your eyes with yellow!                $"
msg_col6 db "O  : The bottom ... it's white what, the base ...                                 $"
msg_col7 db "Well, it's for the color of the notes! W = Green, X = Yellow, C = Magenta and R = Red $ "

;------------------
;Free mode function
;------------------
menu_free1: call display_free



menu_free2:           mov choice, 1
                      mov ah, 07h
                      int 21h
                      cmp al, a
                      je piano

display_free:
      mov ah, 02h
      mov dh, 00h
      mov dl, 00h
      int 10h
      mov ah, 09h
      mov dx, OFFSET free_msg1
      int 21h

      mov ah, 02h
      mov dh, 01h
      mov dl, 00h
      int 10h
      mov ah, 09h
      mov dx, OFFSET free_msg2
      int 21h

      mov ah, 02h
      mov dh, 02h
      mov dl, 00h
      int 10h
      mov ah, 09h
      mov dx, OFFSET free_msg3
      int 21h

      mov ah, 02h
      mov dh, 03h
      mov dl, 00h
      int 10h
      mov ah, 09h
      mov dx, OFFSET free_msg4
      int 21h

      mov ah, 02h
      mov dh, 04h
      mov dl, 00h
      int 10h
      mov ah, 09h
      mov dx, OFFSET free_msg5
      int 21h

      mov ah, 02h
      mov dh, 05h
      mov dl, 00h
      int 10h
      mov ah, 09h
      mov dx, OFFSET free_msg6
      int 21h

      mov ah, 02h
      mov dh, 06h
      mov dl, 00h
      int 10h
      mov ah, 09h
      mov dx, OFFSET free_msg7
      int 21h


      call menu_free2


piano_free:



                    mov ah, 07h
                    int 21h
                    cmp al, d
                    je DO
                    cmp al, f
                    je RE
                    cmp al, g
                    je MI
                    cmp al, h
                    je FA
                    cmp al, j
                    je SOL
                    cmp al, k
                    je LA
                    cmp al, l
                    je SI_
                    cmp al, a
                    je menu
                    cmp al, r
                    je DO_#
                    cmp al, t
                    je RE_#
                    cmp al, y
                    je MI_#
                    cmp al, i
                    je SOL_#
                    cmp al, o
                    je LA_#
                    jne piano_free

free_msg1 db "             **************************************            $"
free_msg2 db "             *  Free to play menu!            *            $"
free_msg3 db "             **************************************            $"
free_msg4 db "            In this mode, play the keys of your choice              $"
free_msg5 db "            Try to make the prettiest melody                     $"
free_msg6 db "            You can also go and discover music during training             $"
free_msg7 db "            And above all, take care of the Rock'n Roll                   $"



;--------------------
; Sound and display function.
;--------------------


DO:       mov ah, 02h
          mov dh, 04h
          mov dl, 00
          int 10h

          mov ah, 09h
          mov dx, OFFSET notes_empty
          int 21h

          mov ah, 02h
          mov dh, 07h
          mov dl, 00h
          int 10h

          mov ah, 09h
          mov dx, OFFSET note_empty
          int 21h

          mov dl, 07h
          mov ah, 2
          int 21h
          mov ah, 02h
          mov dh, 07h
          mov dl, 01h
          int 10h

          mov ah, 09h
          mov al, '*'
          mov bh, 0
          mov cx, 3
          mov bl, red
          int 10h

          cmp choice, 1
          je piano_free
          cmp choice, 2
          je add_note
          cmp watch, 1
          je add_note
          cmp watch, 2
          je add_watch_note

RE:       mov ah, 02h
          mov dh, 04h
          mov dl, 00
          int 10h

          mov ah, 09h
          mov dx, OFFSET notes_empty
          int 21h

          mov ah, 02h
          mov dh, 07h
          mov dl, 00h
          int 10h

          mov ah, 09h
          mov dx, OFFSET note_empty
          int 21h


          mov dl, 07h
          mov ah, 02h
          int 21h
          mov ah, 02h
          mov dh, 07h
          mov dl, 05h
          int 10h

          mov ah, 09h
          mov al, '*'
          mov bh, 0
          mov cx, 3
          mov bl, red
          int 10h


          cmp choice, 1
          je piano_free
          cmp choice, 2
          je add_note
          cmp watch, 1
          je add_note
          cmp watch, 2
          je add_watch_note

MI:       mov ah, 02h
          mov dh, 04h
          mov dl, 00
          int 10h

          mov ah, 09h
          mov dx, OFFSET notes_empty
          int 21h

          mov ah, 02h
          mov dh, 07h
          mov dl, 00
          int 10h

          mov ah, 09h
          mov dx, OFFSET note_empty
          int 21h


          mov dl, 07h
          mov ah, 2
          int 21h
          mov ah, 02h
          mov dh, 07h
          mov dl, 09h
          int 10h

          mov ah, 09h
          mov al, '*'
          mov bh, 0
          mov cx, 3
          mov bl, red
          int 10h

          cmp choice, 1
          je piano_free
          cmp choice, 2
          je add_note
          cmp watch, 1
          je add_note
          cmp watch, 2
          je add_watch_note

FA:       mov ah, 02h
          mov dh, 04h
          mov dl, 00
          int 10h

          mov ah, 09h
          mov dx, OFFSET notes_empty
          int 21h

          mov ah, 02h
          mov dh, 07h
          mov dl, 00h
          int 10h

          mov ah, 09h
          mov dx, OFFSET note_empty
          int 21h

          mov dl, 07h
          mov ah, 2
          int 21h
          mov ah, 02h
          mov dh, 07h
          mov dl, 13
          int 10h

          mov ah, 09h
          mov al, '*'
          mov bh, 0
          mov cx, 3
          mov bl, red
          int 10h

          cmp choice, 1
          je piano_free
          cmp choice, 2
          je add_note
          cmp watch, 1
          je add_note
          cmp watch, 2
          je add_watch_note

SOL:      mov ah, 02h
          mov dh, 04h
          mov dl, 00
          int 10h

          mov ah, 09h
          mov dx, OFFSET notes_empty
          int 21h

          mov ah, 02h              ;do not touch.
          mov dh, 07h
          mov dl, 00h
          int 10h

          mov ah, 09h
          mov dx, OFFSET note_empty
          int 21h

          mov dl, 07h
          mov ah, 2
          int 21h
          mov ah, 02h
          mov dh, 07h
          mov dl, 11h
          int 10h

          mov ah, 09h
          mov al, '*'
          mov bh, 0
          mov cx, 3
          mov bl, red
          int 10h

          cmp choice, 1
          je piano_free
          cmp choice, 2
          je add_note
          cmp watch, 1
          je add_note
          cmp watch, 2
          je add_watch_note

LA:       mov ah, 02h
          mov dh, 04h
          mov dl, 00
          int 10h

          mov ah, 09h
          mov dx, OFFSET notes_empty
          int 21h

          mov ah, 02h                    ;Do not Touch!
          mov dh, 07h
          mov dl, 00
          int 10h

          mov ah, 09h
          mov dx, OFFSET note_empty
          int 21h


          mov dl, 07h
          mov ah, 2
          int 21h
          mov ah, 02h
          mov dh, 07h
          mov dl, 15h
          int 10h

          mov ah, 09h
          mov al, '*'
          mov bh, 0
          mov cx, 3
          mov bl, red
          int 10h

          cmp choice, 1
          je piano_free
          cmp choice, 2
          je add_note
          cmp watch, 1
          je add_note
          cmp watch, 2
          je add_watch_note

SI_:      mov ah, 02h
          mov dh, 04h
          mov dl, 00
          int 10h

          mov ah, 09h
          mov dx, OFFSET notes_empty
          int 21h

          mov ah, 02h
          mov dh, 07h
          mov dl, 00
          int 10h

          mov ah, 09h
          mov dx, OFFSET note_empty
          int 21h


          mov dl, 07h
          mov ah, 2
          int 21h
          mov ah, 02h
          mov dh, 07h
          mov dl, 25
          int 10h

          mov ah, 09h
          mov al, '*'
          mov bh, 0
          mov cx, 3
          mov bl, red
          int 10h


          cmp choice, 1
          je piano_free
          cmp choice, 2
          je add_note
          cmp watch, 1
          je add_note
          cmp watch, 2
          je add_watch_note


DO_#:     mov ah, 02h
          mov dh, 07h
          mov dl, 00
          int 10h

          mov ah, 09h
          mov dx, OFFSET note_empty
          int 21h

          mov ah, 02h
          mov dh, 04h
          mov dl, 00
          int 10h

          mov ah, 09h
          mov dx, OFFSET notes_empty
          int 21h


          mov dl, 07h
          mov ah, 2
          int 21h
          mov ah, 02h
          mov dh, 04h
          mov dl, 4
          int 10h

          mov ah, 09h
          mov al, '*'
          mov bh, 0
          mov cx, 1
          mov bl, red
          int 10h

          cmp choice, 1
          je piano_free
          cmp choice, 2
          je add_note
          cmp watch, 1
          je add_note
          cmp watch, 2
          je add_watch_note

RE_#:     mov ah, 02h
          mov dh, 07h
          mov dl, 00
          int 10h

          mov ah, 09h
          mov dx, OFFSET note_empty
          int 21h

          mov ah, 02h
          mov dh, 04h
          mov dl, 00
          int 10h

          mov ah, 09h
          mov dx, OFFSET notes_empty
          int 21h


          mov dl, 07h
          mov ah, 2
          int 21h
          mov ah, 02h
          mov dh, 04h
          mov dl, 8
          int 10h

          mov ah, 09h
          mov al, '*'
          mov bh, 0
          mov cx, 1
          mov bl, red
          int 10h

          cmp choice, 1
          je piano_free
          cmp choice, 2
          je add_note
          cmp watch, 1
          je add_note
          cmp watch, 2
          je add_watch_note

MI_#:     mov ah, 02h
          mov dh, 07h
          mov dl, 00
          int 10h

          mov ah, 09h
          mov dx, OFFSET note_empty
          int 21h

          mov ah, 02h
          mov dh, 04h
          mov dl, 00
          int 10h

          mov ah, 09h
          mov dx, OFFSET notes_empty
          int 21h


          mov dl, 07h
          mov ah, 2
          int 21h
          mov ah, 02h
          mov dh, 04h
          mov dl, 16
          int 10h

          mov ah, 09h
          mov al, '*'
          mov bh, 0
          mov cx, 1
          mov bl, red
          int 10h

          cmp choice, 1
          je piano_free
          cmp choice, 2
          je add_note
          cmp watch, 1
          je add_note
          cmp watch, 2
          je add_watch_note

FA_#:     mov ah, 02h
          mov dh, 07h
          mov dl, 00
          int 10h

          mov ah, 09h
          mov dx, OFFSET note_empty
          int 21h

          mov ah, 02h
          mov dh, 04h
          mov dl, 00
          int 10h

          mov ah, 09h
          mov dx, OFFSET notes_empty
          int 21h


          mov dl, 07h
          mov ah, 2
          int 21h
          mov ah, 02h
          mov dh, 04h
          mov dl, 12
          int 10h

          mov ah, 09h
          mov al, '*'
          mov bh, 0
          mov cx, 1
          mov bl, red
          int 10h

          cmp choice, 1
          je piano_free
          cmp choice, 2
          je add_note
          cmp watch, 1
          je add_note
          cmp watch, 2
          je add_watch_note

SOL_#:    mov ah, 02h
          mov dh, 07h
          mov dl, 00
          int 10h

          mov ah, 09h
          mov dx, OFFSET note_empty
          int 21h

          mov ah, 02h
          mov dh, 04h
          mov dl, 00
          int 10h

          mov ah, 09h
          mov dx, OFFSET notes_empty
          int 21h


          mov dl, 07h
          mov ah, 2
          int 21h
          mov ah, 02h
          mov dh, 04h
          mov dl, 20
          int 10h

          mov ah, 09h
          mov al, '*'
          mov bh, 0
          mov cx, 1
          mov bl, red
          int 10h

          cmp choice, 1
          je piano_free
          cmp choice, 2
          je add_note
          cmp watch, 1
          je add_note
          cmp watch, 2
          je add_watch_note

LA_#:     mov ah, 02h
          mov dh, 07h
          mov dl, 00
          int 10h

          mov ah, 09h
          mov dx, OFFSET note_empty
          int 21h

          mov ah, 02h
          mov dh, 04h
          mov dl, 00
          int 10h

          mov ah, 09h
          mov dx, OFFSET notes_empty
          int 21h


          mov dl, 07h
          mov ah, 2
          int 21h
          mov ah, 02h
          mov dh, 04h
          mov dl, 24
          int 10h

          mov ah, 09h
          mov al, '*'
          mov bh, 0
          mov cx, 1
          mov bl, red
          int 10h

          cmp choice, 1
          je piano_free
          cmp choice, 2
          je add_note
          cmp watch, 1
          je add_note
          cmp watch, 2
          je add_watch_note


notes_empty db  "|  |_| |_|  |  |_| |_| |_|  |$"
note_empty db    "|   |   |   |   |   |   |   |$"
DO_A db        "|***|   |   |   |   |   |   |                                                $"
RE_A db        "|   |***|   |   |   |   |   |                                                $"
MI_A db        "|   |   |***|   |   |   |   |                                                $"
FA_A db        "|   |   |   |***|   |   |   |                                                $"
SOL_A db       "|   |   |   |   |***|   |   |                                                $"
LA_A db        "|   |   |   |   |   |***|   |                                                $"
SI_A db        "|   |   |   |   |   |   |***|                                                $"

DO_T  db 'd'
RE_T  db 'f'
MI_T  db 'g'
FA_T  db 'h'
SOL_T db 'j'
LA_T  db 'k'
SI_T  db 'l'

;--------------------
;Music choice menu
;--------------------
choice_music: mov ret_cho_mus, 1
               call clear_screen
choice_music22:
      mov ah, 02h
      mov dh, 00h
      mov dl, 00h
      int 10h
      mov ah, 09h
      mov dx, OFFSET choice_music1
      int 21h

      mov ah, 02h
      mov dh, 01h
      mov dl, 00h
      int 10h
      mov ah, 09h
      mov dx, OFFSET choice_music2
      int 21h

      mov ah, 02h
      mov dh, 02h
      mov dl, 00h
      int 10h
      mov ah, 09h
      mov dx, OFFSET choice_music3
      int 21h

      mov ah, 02h
      mov dh, 03h
      mov dl, 00h
      int 10h
      mov ah, 09h
      mov dx, OFFSET choice_music4
      int 21h

      mov ah, 07h
      int 21h
      cmp al, a
      je music_1
      cmp al, b
      je music_2
      cmp al, c
      je music_3
      jne choice_note

cho_music db 0

music_1: mov music_choice, 1
           mov cho_music, 1
           call piano

music_2: mov music_choice, 1
           mov cho_music, 2
           call piano

music_3: mov music_choice, 1
           mov cho_music, 3
           call piano

choice_music1 db "What music do you want to play ?$"
choice_music2 db "A: Letter to Elise $"
choice_music3 db "B: Tetris    $"
choice_music4 db "C: Hungarian dance $"


;--------------------
piano:
;--------------------

      mov ah, 02h
      mov dh, 00h
      mov dl, 00h
      int 10h
      mov ah, 09h
      mov dx, OFFSET line1
      int 21h

      mov ah, 02h
      mov dh, 01h
      mov dl, 00h
      int 10h
      mov ah, 09h
      mov dx, OFFSET line2
      int 21h

      mov ah, 02h
      mov dh, 02h
      mov dl, 00h
      int 10h
      mov ah, 09h
      mov dx, OFFSET line3
      int 21h

      mov ah, 02h
      mov dh, 03h
      mov dl, 00h
      int 10h
      mov ah, 09h
      mov dx, OFFSET line4
      int 21h

      mov ah, 02h
      mov dh, 04h
      mov dl, 00h
      int 10h
      mov ah, 09h
      mov dx, OFFSET line5
      int 21h

      mov ah, 02h
      mov dh, 05h
      mov dl, 00h
      int 10h
      mov ah, 09h
      mov dx, OFFSET line6
      int 21h

      mov ah, 02h
      mov dh, 06h
      mov dl, 00h
      int 10h
      mov ah, 09h
      mov dx, OFFSET line7
      int 21h

      mov ah, 02h
      mov dh, 07h
      mov dl, 00h
      int 10h
      mov ah, 09h
      mov dx, OFFSET line8
      int 21h

      mov ah, 02h
      mov dh, 08h
      mov dl, 00h
      int 10h
      mov ah, 09h
      mov dx, OFFSET line9
      int 21h

      mov ah, 02h
      mov dh, 09h
      mov dl, 00h
      int 10h
      mov ah, 09h
      mov dx, OFFSET line10
      int 21h

      cmp choice, 1
      je piano_free
      cmp music_choice, 1
      je add_note
      cmp watch, 1
      je add_note

DO__A   db "|  |*| |_|  |  |_| |_| |_|  |                         $"
RE__A   db "|  |_| |*|  |  |_| |_| |_|  |                         $"
MI__A   db "|  |_| |_|  |  |*| |_| |_|  |                         $"
SOL__A  db "|  |_| |_|  |  |_| |*| |_|  |                         $"
LA__A   db "|  |_| |_|  |  |_| |_| |*|  |                         $"

line1  db "|  | | | |  |  | | | | | |  |                                                 $"
line2  db "|  | | | |  |  | | | | | |  |                                                 $"
line3  db "|  | | | |  |  | | | | | |  |                                                 $"
line4  db "|  |r| |t|  |  |y| |i| |o|  |                                                 $"
line5  db "|  |_| |_|  |  |_| |_| |_|  |                                                 $"
line6  db "|   |   |   |   |   |   |   |                                                 $"
line7  db "|DO |RE |MI |FA |SOL|LA |SI |                                                 $"
line8  db "|   |   |   |   |   |   |   |                                                 $"
line9  db "|d  | f |g  |h  |j  |k  |l  |                                                 $"
line10 db "[---------------------------]                                                 $"




;---------------------
;Training mode.
;---------------------

training0: mov ah, 02h
          mov dh, 04h
          mov dl, 00h
          int 10h
          mov ah, 09h
          mov dx, OFFSET line_empty
          int 21h

           mov dh, 00h
           call training
           mode db 2

training:

          mov ah, 02h
          mov dl, 00h
          int 10h

          cmp dh, 0
          je training1

          cmp dh, 1
          je training2

          cmp dh, 2
          je training3

          cmp dh, 3
          je training4

          cmp dh, 4
          je training5

          cmp dh, 5
          je training6

          cmp dh, 6
          je training7

          cmp dh, 7
          je menu_train




training1: mov ah, 09h
           mov dx, OFFSET entr1
           int 21h
           mov dh, 1
           loop training

training2: mov ah, 09h
           mov dx, OFFSET entr2
           int 21h
           mov dh, 2
           loop training

training3: mov ah, 09h
           mov dx, OFFSET entr3
           int 21h
           mov dh, 3
           loop training

training4: mov ah, 09h
           mov dx, OFFSET entr4
           int 21h
           mov dh, 4
           loop training

training5: mov ah, 09h
           mov dx, OFFSET entr5
           int 21h
           mov dh, 5
           loop training

training6: mov ah, 09h
           mov dx, OFFSET entr6
           int 21h
           mov dh, 6
           loop training

training7: mov ah, 09h
           mov dx, OFFSET entr7
           int 21h
           mov dh, 7
           loop training


entr1 db "             **************************************            $"
entr2 db "             *  Training menu.                 *            $"
entr3 db "             **************************************            $"
entr4 db "               Choose your music and practice!            $"
entr5 db "             Press 's' to choose your music           $"
entr6 db "           When you have finished you will be brought back to the menu.    $"
entr7 db "              Press 's' to choose your music.         $"
menu_train: mov choice, 2
            mov ah, 07h
            int 21h
            cmp al, s
            je menu_music
            jne menu_train
;------------------------
;Piano music
;------------------------


menu_music:
              mov dh, 07h
              mov dl, 00h
              mov ah, 02h
              int 10h
              call choice_music

iteration db 0

add_note:  mov check_return, 1
           add iteration, 1
           call choice_note


verification:

              mov dh, 16
              mov dl, 00h
              mov ah, 02h
              int 10h

              mov dx, OFFSET msg_verif
              mov ah, 09h
              int 21h

              mov dh, 07h
              mov dl, 00h
              mov ah, 02h
              int 10h
              cmp watch_check, 1
              je watch_life
              cmp check_return,1
              je choice_note



choice_note:
             mov dh, 07h
             mov dl, 00h
             mov ah, 02h
             int 10h
             cmp iteration, 1
             je note1
             cmp iteration, 2
             je note2
             cmp iteration, 3
             je note3
             cmp iteration, 4
             je note4
             cmp iteration, 5
             je note5
             cmp iteration, 6
             je note6
             cmp iteration, 7
             je note7
             cmp iteration, 8
             je note8
             cmp iteration, 9
             je note9
             cmp iteration, 10
             je note10
             cmp iteration, 11
             je note11
             cmp iteration, 12
             je note12
             cmp iteration, 12
             je note12
             cmp iteration, 13
             je note13
             cmp iteration, 14
             je note14
             cmp iteration, 15
             je note15
              cmp iteration,16
             je note16
             cmp iteration, 17
             je note17
             cmp iteration, 18
             je note18
             cmp iteration, 19
             je note19
             cmp iteration, 20
             je note20

             jne bug

clear_music: mov ret_cho_mus, 0
             mov num_erase, 2
             call clear_screen

fin_music:
      mov ah, 02h
      mov dh, 00h
      mov dl, 00h
      int 10h
      mov ah, 09h
      mov dx, OFFSET msg_fin1
      int 21h

      mov ah, 02h
      mov dh, 01h
      mov dl, 00h
      int 10h
      mov ah, 09h
      mov dx, OFFSET msg_fin2
      int 21h

      mov ah, 02h
      mov dh, 02h
      mov dl, 00h
      int 10h
      mov ah, 09h
      mov dx, OFFSET msg_fin3
      int 21h

      mov ah, 07h
      int 21h

      cmp al, s
      je clear_music2
      jne fin_music

clear_music2: mov num_erase, 3
             call clear_screen


msg_fin1 db "Well done ! You have finished the music.                                     $"
msg_fin2 db "You can now show off your talent in the watch me play mode.$"
msg_fin3 db "Now press the 's' key to return to the menu.      $"




msg_verif db "This is the wrong key, try again!                                 $"

;-------------------
;Key call functions during training
;-------------------
MI_T_EFF: mov dh, 16h
          mov dl, 00h
          mov ah, 02h
          int 10h
          mov ah, 09h
          mov dx, OFFSET line_empty
          int 21h

          call MI

DO_T_EFF: mov dh, 16h
          mov dl, 00h
          mov ah, 02h
          int 10h
          mov ah, 09h
          mov dx, OFFSET line_empty
          int 21h

          call DO

RE_T_EFF: mov dh, 16h
          mov dl, 00h
          mov ah, 02h
          int 10h
          mov ah, 09h
          mov dx, OFFSET line_empty
          int 21h

          call RE

FA_T_EFF: mov dh, 16h
          mov dl, 00h
          mov ah, 02h
          int 10h
          mov ah, 09h
          mov dx, OFFSET line_empty
          int 21h

          call FA

SOL_T_EFF: mov dh, 16h
          mov dl, 00h
          mov ah, 02h
          int 10h
          mov ah, 09h
          mov dx, OFFSET line_empty
          int 21h

          call SOL

LA_T_EFF: mov dh, 16h
          mov dl, 00h
          mov ah, 02h
          int 10h
          mov ah, 09h
          mov dx, OFFSET line_empty
          int 21h

          call LA

SI_T_EFF: mov dh, 16h
          mov dl, 00h
          mov ah, 02h
          int 10h
          mov ah, 09h
          mov dx, OFFSET line_empty
          int 21h

          call SI_

DO__T_EFF: mov dh, 16h
          mov dl, 00h
          mov ah, 02h
          int 10h
          mov ah, 09h
          mov dx, OFFSET line_empty
          int 21h

          call DO_#

RE__T_EFF:mov dh, 16h
          mov dl, 00h
          mov ah, 02h
          int 10h
          mov ah, 09h
          mov dx, OFFSET line_empty
          int 21h

          call RE_#

MI__T_EFF:mov dh, 16h
          mov dl, 00h
          mov ah, 02h
          int 10h
          mov ah, 09h
          mov dx, OFFSET line_empty
          int 21h

          call MI_#

SOL__T_EFF:mov dh, 16h
          mov dl, 00h
          mov ah, 02h
          int 10h
          mov ah, 09h
          mov dx, OFFSET line_empty
          int 21h

          call SOL_#

LA__T_EFF:mov dh, 16h
          mov dl, 00h
          mov ah, 02h
          int 10h
          mov ah, 09h
          mov dx, OFFSET line_empty
          int 21h

          call LA_#



;---------------------
;Mode Watch me play!
;---------------------
watch db 0
watch_check db 0
check_return db 0
computer_game db 0

clear_watch: mov num_erase, 4
            call clear_screen

MENU_WATC0 db 0

MENU_WATC: mov MENU_WATC0, 1
            call clear_screen

menu_watch: mov MENU_WATC0, 0
            mov watch_check, 1
            mov watch, 1

            mov dh, 00h
            mov dl, 00h
            mov ah, 02h
            int 10h
            mov ah, 09h
            mov dx, OFFSET watch_line1
            int 21h

            mov dh, 01h
            mov dl, 00h
            mov ah, 02h
            int 10h
            mov ah, 09h
            mov dx, OFFSET watch_line2
            int 21h

            mov dh, 02h
            mov dl, 00h
            mov ah, 02h
            int 10h
            mov ah, 09h
            mov dx, OFFSET watch_line3
            int 21h

            mov dh, 03h
            mov dl, 00h
            mov ah, 02h
            int 10h
            mov ah, 09h
            mov dx, OFFSET watch_line4
            int 21h

            mov dh, 04h
            mov dl, 00h
            mov ah, 02h
            int 10h
            mov ah, 09h
            mov dx, OFFSET watch_line5
            int 21h

            mov dh, 05h
            mov dl, 00h
            mov ah, 02h
            int 10h
            mov ah, 09h
            mov dx, OFFSET watch_line6
            int 21h

            mov dh, 02h
            mov dl, 06h
            mov ah, 02h
            int 10h
            mov ah, 09h
            mov dx, OFFSET watch_line7
            int 21h

            mov ah, 07h
            int 21h
            cmp al, s
            je choice_music
            jne menu_watch

watch_line1 db "             **************************************            $"
watch_line2 db "             *  Watch me play menu.            *            $"
watch_line3 db "             **************************************            $"
watch_line4 db "         Choose your music and watch the computer play!                $"
watch_line5 db "             You can then try to play the music again.           $"
watch_line6 db "           But be careful, you only have three tries!    $"
watch_line7 db "           Press 's' to choose your music!                                            $"


iteration_watch db 0

menu_joueur:    mov dh, 17
                mov dl, 00h
                mov ah, 02h
                int 10h
                mov ah, 09h
                mov dx, OFFSET msg_life1
                int 21h

                mov ah, 02h
                mov dh, 07h
                mov dl, 00h
                int 10h
                mov ah, 09h
                mov dx, OFFSET line8
                int 21h
                mov watch, 2
                call add_watch_note

add_watch_note:
                mov watch, 2
                mov check_return, 2
                add iteration_watch, 1
                call watch_note

watch_note:  mov dh, 07h
             mov dl, 00h
             mov ah, 02h
             int 10h
             cmp iteration_watch, 1
             je note_watch1
             cmp iteration_watch, 2
             je note_watch2
             cmp iteration_watch, 3
             je note_watch3
             cmp iteration_watch, 4
             je note_watch4
             cmp iteration_watch, 5
             je note_watch5
             cmp iteration_watch, 6
             je note_watch6
             cmp iteration_watch, 7
             je note_watch7
             cmp iteration_watch, 8
             je note_watch8
             cmp iteration_watch, 9
             je note_watch9
             cmp iteration_watch, 10
             je note_watch10
             cmp iteration_watch, 11
             je note_watch11
             cmp iteration_watch, 12
             je note_watch12
             cmp iteration_watch, 13
             je note_watch13
             cmp iteration_watch, 14
             je note_watch14
             cmp iteration_watch, 15
             je note_watch15
             cmp iteration_watch, 16
             je note_watch16
             cmp iteration_watch, 16
             je note_watch16
             cmp iteration_watch, 17
             je note_watch17
             cmp iteration_watch, 18
             je note_watch18
             cmp iteration_watch, 19
             je note_watch19
             cmp iteration_watch, 20
             je note_watch20


fin_watc0 db 0

fin_watc: mov ret_cho_mus, 0
          mov fin_watc0, 1
          call clear_screen

fin_watch:  mov fin_watc0, 2
            mov dh, 00h
            mov dl, 00h
            mov ah, 02h
            int 10h
            mov ah, 09h
            mov dx, OFFSET msg_fin_watch1
            int 21h

            mov dh, 01h
            mov dl, 00h
            mov ah, 02h
            int 10h
            mov ah, 09h
            mov dx, OFFSET msg_fin_watch2
            int 21h

            mov dh, 02h
            mov dl, 00h
            mov ah, 02h
            int 10h
            mov ah, 09h
            mov dx, OFFSET msg_fin_watch3
            int 21h

            mov ah, 07h
            int 21h

            cmp al, s
            je clear_screen
            jne fin_music



msg_fin_watch1 db "Well Done, you won, you're pretty good!                                $"
msg_fin_watch2 db "Well now we have to wait for the dlc with the hardcore songs ...$"
msg_fin_watch3 db "Press 's' to return to the menu                                  $"


watch_life: add computer_game, 1

           cmp computer_game, 1
           je life_1
           cmp computer_game, 2
           je life_2
           cmp computer_game, 3
           je watch_lose

life_1:    mov dh, 17
          mov dl, 00h
          mov ah, 02h
          int 10h
          mov ah, 09h
          mov dx, OFFSET msg_life2
          int 21h

          call watch_note

life_2:    mov dh, 17
          mov dl, 00h
          mov ah, 02h
          int 10h
          mov ah, 09h
          mov dx, OFFSET msg_life3
          int 21h

          call watch_note


msg_life1 db "I'm the counter, you have 3 lives for the game!   $"
msg_life2 db "You have 2 lives left  !                               $"
msg_life3 db "You have 1 life left   !                               $"

watch_lose: mov ret_cho_mus, 0
            call clear_screen

watch_lose2:  mov ah, 02h
              mov dh, 00h
              mov dl, 00h
              int 10h
              mov ah, 09h
              mov dx, OFFSET msg_lose1
              int 21h

              mov ah, 02h
              mov dh, 01h
              mov dl, 00h
              int 10h
              mov ah, 09h
              mov dx, OFFSET msg_lose2
              int 21h

              mov ah, 02h
              mov dh, 03h
              mov dl, 00h
              int 10h
              mov ah, 09h
              mov dx, OFFSET msg_lose3
              int 21h

              mov ah, 07h
              int 21h

              cmp al, s
              je menu
              jne watch_lose2

msg_lose1 db "It's a shame you lost!                             $"
msg_lose2 db "Go back and practice a bit.                            $"
msg_lose3 db "Press 's' to return to the menu.                 $"


;-------------------
;Because we always need to erase the screen!
;-------------------
clear_screen:
          mov ah, 02h
          mov dh, 00h
          mov dl, 00h
          int 10h
          mov ah, 09h
          mov al, '/'
          mov bh, 0
          mov cx, 80
          mov bl, color
          int 10h

          mov ah, 02h
          mov dh, 01h
          mov dl, 00h
          int 10h
          mov ah, 09h
          mov al, '\'
          mov bh, 0
          mov cx, 80
          mov bl, color
          int 10h

          mov ah, 02h
          mov dh, 02h
          mov dl, 00h
          int 10h
          mov ah, 09h
          mov al, '*'
          mov bh, 0
          mov cx, 80
          mov bl, color
          int 10h

          mov ah, 02h
          mov dh, 03h
          mov dl, 00h
          int 10h
          mov ah, 09h
          mov al, '\'
          mov bh, 0
          mov cx, 80
          mov bl, color
          int 10h

          mov ah, 02h
          mov dh, 04h
          mov dl, 00h
          int 10h
          mov ah, 09h
          mov al, '/'
          mov bh, 0
          mov cx, 80
          mov bl, color
          int 10h

          mov ah, 02h
          mov dh, 05h
          mov dl, 00h
          int 10h
          mov ah, 09h
          mov al, ')'
          mov bh, 0
          mov cx, 80
          mov bl, color
          int 10h

          mov ah, 02h
          mov dh, 06h
          mov dl, 00h
          int 10h
          mov ah, 09h
          mov al, '('
          mov bh, 0
          mov cx, 80
          mov bl, color
          int 10h

          mov ah, 02h
          mov dh, 07h
          mov dl, 00h
          int 10h
          mov ah, 09h
          mov al, '*'
          mov bh, 0
          mov cx, 80
          mov bl, color
          int 10h

          mov ah, 02h
          mov dh, 08h
          mov dl, 00h
          int 10h
          mov ah, 09h
          mov al, '-'
          mov bh, 0
          mov cx, 80
          mov bl, color
          int 10h

          mov ah, 02h
          mov dh, 09h
          mov dl, 00h
          int 10h
          mov ah, 09h
          mov al, '*'
          mov bh, 0
          mov cx, 80
          mov bl, color
          int 10h

          mov ah, 02h
          mov dh, 10
          mov dl, 00h
          int 10h
          mov ah, 09h
          mov al, '('
          mov bh, 0
          mov cx, 80
          mov bl, color
          int 10h

          mov ah, 02h
          mov dh, 11
          mov dl, 00h
          int 10h
          mov ah, 09h
          mov al, ')'
          mov bh, 0
          mov cx, 80
          mov bl, color
          int 10h

          mov ah, 02h
          mov dh, 12
          mov dl, 00h
          int 10h
          mov ah, 09h
          mov al, '/'
          mov bh, 0
          mov cx, 80
          mov bl, color
          int 10h

          mov ah, 02h
          mov dh, 13
          mov dl, 00h
          int 10h
          mov ah, 09h
          mov al, '\'
          mov bh, 0
          mov cx, 80
          mov bl, color
          int 10h

          mov ah, 02h
          mov dh, 14
          mov dl, 00h
          int 10h
          mov ah, 09h
          mov al, '/'
          mov bh, 0
          mov cx, 80
          mov bl, color
          int 10h

           mov ah, 02h
          mov dh, 15
          mov dl, 00h
          int 10h
          mov ah, 09h
          mov al, '>'
          mov bh, 0
          mov cx, 80
          mov bl, color
          int 10h

          mov ah, 02h
          mov dh, 16
          mov dl, 00h
          int 10h
          mov ah, 09h
          mov al, '<'
          mov bh, 0
          mov cx, 80
          mov bl, color
          int 10h

          mov ah, 02h
          mov dh, 17
          mov dl, 00h
          int 10h
          mov ah, 09h
          mov al, '^'
          mov bh, 0
          mov cx, 80
          mov bl, color
          int 10h


          call clear_screen2







clear_screen2:
      mov ah, 02h
      mov dh, 00h
      mov dl, 00h
      int 10h
      mov ah, 09h
      mov dx, OFFSET line_empty
      int 21h

      mov ah, 02h
      mov dh, 01h
      mov dl, 00h
      int 10h
      mov ah, 09h
      mov dx, OFFSET line_empty
      int 21h

      mov ah, 02h
      mov dh, 02h
      mov dl, 00h
      int 10h
      mov ah, 09h
      mov dx, OFFSET line_empty
      int 21h

      mov ah, 02h
      mov dh, 03h
      mov dl, 00h
      int 10h
      mov ah, 09h
      mov dx, OFFSET line_empty
      int 21h

      mov ah, 02h
      mov dh, 04h
      mov dl, 00h
      int 10h
      mov ah, 09h
      mov dx, OFFSET line_empty
      int 21h

      mov ah, 02h
      mov dh, 05h
      mov dl, 00h
      int 10h
      mov ah, 09h
      mov dx, OFFSET line_empty
      int 21h

      mov ah, 02h
      mov dh, 06h
      mov dl, 00h
      int 10h
      mov ah, 09h
      mov dx, OFFSET line_empty
      int 21h

      mov ah, 02h
      mov dh, 07h
      mov dl, 00h
      int 10h
      mov ah, 09h
      mov dx, OFFSET line_empty
      int 21h

      mov ah, 02h
      mov dh, 08h
      mov dl, 00h
      int 10h
      mov ah, 09h
      mov dx, OFFSET line_empty
      int 21h

      mov ah, 02h
      mov dh, 09h
      mov dl, 00h
      int 10h
      mov ah, 09h
      mov dx, OFFSET line_empty
      int 21h

      mov ah, 02h
      mov dh, 10
      mov dl, 00h
      int 10h
      mov ah, 09h
      mov dx, OFFSET line_empty
      int 21h

      mov ah, 02h
      mov dh, 11
      mov dl, 00h
      int 10h
      mov ah, 09h
      mov dx, OFFSET line_empty
      int 21h

      mov ah, 02h
      mov dh, 12
      mov dl, 00h
      int 10h
      mov ah, 09h
      mov dx, OFFSET line_empty
      int 21h

      mov ah, 02h
      mov dh, 13
      mov dl, 00h
      int 10h
      mov ah, 09h
      mov dx, OFFSET line_empty
      int 21h

      mov ah, 02h
      mov dh, 14
      mov dl, 00h
      int 10h
      mov ah, 09h
      mov dx, OFFSET line_empty
      int 21h

      mov ah, 02h
      mov dh, 15
      mov dl, 00h
      int 10h
      mov ah, 09h
      mov dx, OFFSET line_empty
      int 21h

      mov ah, 02h
      mov dh, 16
      mov dl, 00h
      int 10h
      mov ah, 09h
      mov dx, OFFSET line_empty
      int 21h

      mov ah, 02h
      mov dh, 17
      mov dl, 00h
      int 10h
      mov ah, 09h
      mov dx, OFFSET line_empty
      int 21h

      cmp guitar, 1
      je display_guitar
      cmp ret_cho_mus, 1
      je choice_music22
      cmp principal, 1
      je menu_principal
      cmp MENU_WATC0, 1
      je menu_watch
      cmp fin_watc0, 1
      je fin_watch
      cmp fin_watc0, 2
      je menu
      cmp computer_game, 3
      je watch_lose2
      cmp num_erase, 2
      je fin_music
      cmp num_erase, 3
      je menu
      cmp num_erase, 4
      je menu_watch




line_empty  db  "                                                                                     $"



;-------------
;Because a bug arrived quickly!
;-------------

bug: mov dh, 00h
     mov dl, 00h
     mov ah, 02h
     int 10h
     mov ah, 09h
     mov dx, OFFSET msg_bug
     int 21h
     loop menu

msg_bug db "It's me, the smart dev who thought of a bug message but crashed! F2 returns to the menu ! :) $"

;---------------------------
clear_NOTE:  mov ah, 02h
              mov dh, 04h
              mov dl, 00
              int 10h

              mov ah, 09h
              mov dx, OFFSET notes_empty
              int 21h

              mov ah, 02h
              mov dh, 07h
              mov dl, 00h
              int 10h

              mov ah, 09h
              mov dx, OFFSET note_empty
              int 21h
              mov ah, 02h
              mov dh, 07h
              mov dl, 00h
              int 10h

              ret

;------------------------
;Implementation of the expectation
;------------------------
waiting: mov ah, 86h
         mov dx, 1000
         int 15h
         ret





;------------------------
;Implementation of the music 1 ( Für Elise) !
;------------------------
DO__T db 'r'
RE__T db 't'
MI__T db 'y'
SOL__T db 'i'
LA__T db 'o'


music11: call clear_NOTE
           call waiting

           cmp watch, 1
           je MI

       mov ah, 09h
       mov dx, OFFSET MI_A
       int 21h


       mov ah, 07h
       int 21h

       cmp al, MI_T
       je MI_T_EFF
       jne verification

music12: call clear_NOTE
           call waiting

        mov ah, 02h
          mov dh, 04h
          mov dl, 00h
          int 10h

       cmp watch, 1
       je RE_#

       mov ah, 09h
       mov dx, OFFSET RE__A
       int 21h

       mov ah, 07h
       int 21h

       cmp al, RE__T
       je RE__T_EFF
       jne verification

music13:  call clear_NOTE
            call waiting

cmp watch, 1
       je MI

       mov ah, 09h
       mov dx, OFFSET MI_A
       int 21h

       mov ah, 07h
       int 21h

       cmp al, MI_T
       je MI_T_EFF
       jne verification

music14:   call clear_NOTE
             call waiting

mov ah, 02h
          mov dh, 04h
          mov dl, 00h
          int 10h

       cmp watch, 1
       je RE_#

       mov ah, 09h
       mov dx, OFFSET RE__A
       int 21h



       mov ah, 07h
       int 21h

       cmp al, RE__T
       je RE__T_EFF
       jne verification

music15: call clear_NOTE
           call waiting

cmp watch, 1
       je MI

       mov ah, 09h
       mov dx, OFFSET MI_A
       int 21h

       mov ah, 07h
       int 21h

       cmp al, MI_T
       je MI_T_EFF
       jne verification

music16:    call clear_NOTE

cmp watch, 1
       je SI_

       mov ah, 09h
       mov dx, OFFSET SI_A
       int 21h


       mov ah, 07h
       int 21h

       cmp al, SI_T
       je SI_T_EFF
       jne verification

music17:  call clear_NOTE
            call waiting

cmp watch, 1
       je RE

       mov ah, 09h
       mov dx, OFFSET RE_A
       int 21h

       mov ah, 07h
       int 21h

       cmp al, RE_T
       je RE_T_EFF
       jne verification

music18:       call clear_NOTE
                 call waiting

cmp watch, 1
       je DO

       mov ah, 09h
       mov dx, OFFSET RE_A
       int 21h

       mov ah, 07h
       int 21h

       cmp al, RE_T
       je RE_T_EFF
       jne verification

music19: call clear_NOTE

cmp watch, 1
       je LA

       mov ah, 09h
       mov dx, OFFSET LA_A
       int 21h

       mov ah, 07h
       int 21h

       cmp al, LA_T
       je LA_T_EFF
       jne verification

music110: call clear_NOTE

       cmp watch, 1
       je DO

       mov ah, 09h
       mov dx, OFFSET DO_A
       int 21h


       mov ah, 07h
       int 21h

       cmp al, DO_T
       je DO_T_EFF
       jne verification

music111:  call clear_NOTE

cmp watch, 1
       je MI

       mov ah, 09h
       mov dx, OFFSET MI_A
       int 21h

       mov ah, 07h
       int 21h

       cmp al, MI_T
       je MI_T_EFF
       jne verification

music112:   call clear_NOTE

cmp watch, 1
       je LA

       mov ah, 09h
       mov dx, OFFSET LA_A
       int 21h


       mov ah, 07h
       int 21h

       cmp al, LA_T
       je LA_T_EFF
       jne verification

music113: call clear_NOTE

cmp watch, 1
       je SI_

       mov ah, 09h
       mov dx, OFFSET SI_A
       int 21h

       mov ah, 07h
       int 21h

       cmp al, SI_T
       je SI_T_EFF
       jne verification

music114:  call clear_NOTE

cmp watch, 1
       je MI

       mov ah, 09h
       mov dx, OFFSET MI_A
       int 21h



       mov ah, 07h
       int 21h

       cmp al, MI_T
       je MI_T_EFF
       jne verification

music115: call clear_NOTE

mov ah, 02h
          mov dh, 04h
          mov dl, 00h
          int 10h

       cmp watch, 1
       je SOL_#

       mov ah, 09h
       mov dx, OFFSET SOL__A
       int 21h


       mov ah, 07h
       int 21h

       cmp al, SOL__T
       je SOL__T_EFF
       jne verification

music116:  call clear_NOTE

cmp watch, 1
           je SI_

           mov ah, 09h
           mov dx, OFFSET SI_A
           int 21h


           mov ah, 07h
           int 21h

           cmp al, SI_T
           je SI_T_EFF
           jne verification

music117:   call clear_NOTE

cmp watch, 1
           je DO

           mov ah, 09h
           mov dx, OFFSET DO_A
           int 21h


           mov ah, 07h
           int 21h

           cmp al, DO_T
           je DO_T_EFF
           jne verification

music118:     cmp watch, 1
                je add_watch_note
                call clear_music

;------------------------
;Implementation of the music 2 (Tetris) !
;------------------------

music21: call clear_NOTE
 cmp watch, 1
       je MI

       mov ah, 09h
       mov dx, OFFSET MI_A
       int 21h


       mov ah, 07h
       int 21h

       cmp al, MI_T
       je MI_T_EFF
       jne verification

music22: call clear_NOTE
cmp watch, 1
       je SI_

       mov ah, 09h
       mov dx, OFFSET SI_A
       int 21h

       mov ah, 07h
       int 21h

       cmp al, SI_T
       je SI_T_EFF
       jne verification

music23:  call clear_NOTE
cmp watch, 1
       je DO

       mov ah, 09h
       mov dx, OFFSET DO_A
       int 21h

       mov ah, 07h
       int 21h

       cmp al, DO_T
       je DO_T_EFF
       jne verification

music24: call clear_NOTE
cmp watch, 1
       je RE

       mov ah, 09h
       mov dx, OFFSET RE_A
       int 21h



       mov ah, 07h
       int 21h

       cmp al, RE_T
       je RE_T_EFF
       jne verification

music25:   call clear_NOTE
cmp watch, 1
       je DO

       mov ah, 09h
       mov dx, OFFSET DO_A
       int 21h

       mov ah, 07h
       int 21h

       cmp al, DO_T
       je DO_T_EFF
       jne verification

music26: call clear_NOTE
cmp watch, 1
       je SI_

       mov ah, 09h
       mov dx, OFFSET SI_A
       int 21h


       mov ah, 07h
       int 21h

       cmp al, SI_T
       je SI_T_EFF
       jne verification

music27:   call clear_NOTE
cmp watch, 1
       je LA

       mov ah, 09h
       mov dx, OFFSET LA_A
       int 21h

       mov ah, 07h
       int 21h

       cmp al, LA_T
       je LA_T_EFF
       jne verification

music28: call clear_NOTE
cmp watch, 1
       je LA

       mov ah, 09h
       mov dx, OFFSET LA_A
       int 21h

       mov ah, 07h
       int 21h

       cmp al, LA_T
       je LA_T_EFF
       jne verification

music29:call clear_NOTE
cmp watch, 1
       je DO

       mov ah, 09h
       mov dx, OFFSET DO_A
       int 21h

       mov ah, 07h
       int 21h

       cmp al, DO_T
       je DO_T_EFF
       jne verification

music210:call clear_NOTE
       cmp watch, 1
       je MI

       mov ah, 09h
       mov dx, OFFSET MI_A
       int 21h


       mov ah, 07h
       int 21h

       cmp al, MI_T
       je MI_T_EFF
       jne verification

music211:call clear_NOTE
cmp watch, 1
       je RE

       mov ah, 09h
       mov dx, OFFSET RE_A
       int 21h

       mov ah, 07h
       int 21h

       cmp al, RE_T
       je RE_T_EFF
       jne verification

music212: call clear_NOTE
cmp watch, 1
       je DO

       mov ah, 09h
       mov dx, OFFSET DO_A
       int 21h


       mov ah, 07h
       int 21h

       cmp al, DO_T
       je DO_T_EFF
       jne verification

music213:  call clear_NOTE
cmp watch, 1
       je SI_

       mov ah, 09h
       mov dx, OFFSET SI_A
       int 21h

       mov ah, 07h
       int 21h

       cmp al, SI_T
       je SI_T_EFF
       jne verification

music214:call clear_NOTE
cmp watch, 1
       je DO

       mov ah, 09h
       mov dx, OFFSET DO_A
       int 21h

       cmp watch, 1
       je DO

       mov ah, 07h
       int 21h

       cmp al, DO_T
       je DO_T_EFF
       jne verification

music215: call clear_NOTE
cmp watch, 1
       je RE

       mov ah, 09h
       mov dx, OFFSET RE_A
       int 21h


       mov ah, 07h
       int 21h

       cmp al, RE_T
       je RE_T_EFF
       jne verification

music216: call clear_NOTE
cmp watch, 1
           je MI

       mov ah, 09h
       mov dx, OFFSET MI_A
       int 21h


       mov ah, 07h
       int 21h

       cmp al, MI_T
       je MI_T_EFF
       jne verification

music217: call clear_NOTE
cmp watch, 1
           je DO

       mov ah, 09h
       mov dx, OFFSET DO_A
       int 21h


       mov ah, 07h
       int 21h

       cmp al, DO_T
       je DO_T_EFF
       jne verification

music218: call clear_NOTE
cmp watch, 1
           je LA

       mov ah, 09h
       mov dx, OFFSET LA_A
       int 21h


       mov ah, 07h
       int 21h

       cmp al, LA_T
       je LA_T_EFF
       jne verification

music219: call clear_NOTE
cmp watch, 1
           je LA

           mov ah, 09h
           mov dx, OFFSET LA_A
           int 21h


           mov ah, 07h
           int 21h

           cmp al, LA_T
           je LA_T_EFF
           jne verification

music220:cmp watch, 1
                je add_watch_note
           call clear_music

;------------------------
;Implementation of the music 3 Danse Hongroise !
;------------------------

music31: call clear_NOTE

           cmp watch, 1
           je DO_#

       mov ah, 02h
          mov dh, 04h
          mov dl, 00h
          int 10h

       mov ah, 09h
       mov dx, OFFSET DO__A
       int 21h


       mov ah, 07h
       int 21h

       cmp al, DO__T
       je DO__T_EFF
       jne verification

music32: call clear_NOTE


           cmp watch, 1
           je MI_#

       mov ah, 02h
          mov dh, 04h
          mov dl, 00h
          int 10h

       mov ah, 09h
       mov dx, OFFSET MI__A
       int 21h

       mov ah, 07h
       int 21h

       cmp al, MI__T
       je MI__T_EFF
       jne verification

music33: call clear_NOTE
cmp watch, 1
       je LA

       mov ah, 09h
       mov dx, OFFSET LA_A
       int 21h

       mov ah, 07h
       int 21h

       cmp al, LA_T
       je LA_T_EFF
       jne verification

music34:  call clear_NOTE
 cmp watch, 1
       je MI_#

       mov ah, 02h
          mov dh, 04h
          mov dl, 00h
          int 10h

       mov ah, 09h
       mov dx, OFFSET MI__A
       int 21h



       mov ah, 07h
       int 21h

       cmp al, MI__T
       je MI_T_EFF
       jne verification

music35: call clear_NOTE
cmp watch, 1
       je FA

       mov ah, 09h
       mov dx, OFFSET FA_A
       int 21h

       mov ah, 07h
       int 21h

       cmp al, FA_T
       je FA_T_EFF
       jne verification

music36: call clear_NOTE
cmp watch, 1
       je MI_#

       mov ah, 02h
          mov dh, 04h
          mov dl, 00h
          int 10h

       mov ah, 09h
       mov dx, OFFSET MI__A
       int 21h


       mov ah, 07h
       int 21h

       cmp al, MI__T
       je MI__T_EFF
       jne verification

music37: call clear_NOTE
 cmp watch, 1
       je SOL_#

       mov ah, 02h
          mov dh, 04h
          mov dl, 00h
          int 10h

       mov ah, 09h
       mov dx, OFFSET SOL__A
       int 21h

       mov ah, 07h
       int 21h

       cmp al, SOL__T
       je SOL__T_EFF
       jne verification

music38:call clear_NOTE
cmp watch, 1
       je MI_#

       mov ah, 02h
          mov dh, 04h
          mov dl, 00h
          int 10h

       mov ah, 09h
       mov dx, OFFSET MI__A
       int 21h

       mov ah, 07h
       int 21h

       cmp al, MI__T
       je MI__T_EFF
       jne verification

music39: call clear_NOTE
cmp watch, 1
       je SOL_#

       mov ah, 02h
          mov dh, 04h
          mov dl, 00h
          int 10h

       mov ah, 09h
       mov dx, OFFSET SOL__A
       int 21h

       mov ah, 07h
       int 21h

       cmp al, SOL__T
       je SOL__T_EFF
       jne verification

music310:call clear_NOTE
       cmp watch, 1
       je MI_#

       mov ah, 02h
          mov dh, 04h
          mov dl, 00h
          int 10h

       mov ah, 09h
       mov dx, OFFSET MI__A
       int 21h


       mov ah, 07h
       int 21h

       cmp al, MI__T
       je MI__T_EFF
       jne verification

music311: call clear_NOTE
cmp watch, 1
       je RE

       mov ah, 09h
       mov dx, OFFSET RE_A
       int 21h

       mov ah, 07h
       int 21h

       cmp al, RE_T
       je RE_T_EFF
       jne verification

music312: call clear_NOTE
cmp watch, 1
       je MI

       mov ah, 09h
       mov dx, OFFSET MI_A
       int 21h


       mov ah, 07h
       int 21h

       cmp al, MI_T
       je MI_T_EFF
       jne verification

music313: call clear_NOTE
cmp watch, 1
       je MI_#

       mov ah, 02h
          mov dh, 04h
          mov dl, 00h
          int 10h

       mov ah, 09h
       mov dx, OFFSET MI__A
       int 21h

       mov ah, 07h
       int 21h

       cmp al, MI__T
       je MI__T_EFF
       jne verification

music314:call clear_NOTE
cmp watch, 1
       je DO_#

       mov ah, 02h
          mov dh, 04h
          mov dl, 00h
          int 10h

       mov ah, 09h
       mov dx, OFFSET DO__A
       int 21h

       mov ah, 07h
       int 21h

       cmp al, DO__T
       je DO__T_EFF
       jne verification

music315: call clear_NOTE
cmp watch, 1
       je SI_

       mov ah, 09h
       mov dx, OFFSET SI_A
       int 21h


       mov ah, 07h
       int 21h

       cmp al, SI_T
       je SI_T_EFF
       jne verification

music316:call clear_NOTE
cmp watch, 1
           je LA

           mov ah, 09h
           mov dx, OFFSET LA_A
           int 21h


           mov ah, 07h
           int 21h

           cmp al, LA_T
           je LA_T_EFF
           jne verification

music317: call clear_NOTE
cmp watch, 1
           je LA

           mov ah, 09h
           mov dx, OFFSET LA_A
           int 21h


           mov ah, 07h
           int 21h

           cmp al, LA_T
           je LA_T_EFF
           jne verification

music318:call clear_NOTE
cmp watch, 1
           je DO_#

           mov ah, 02h
          mov dh, 04h
          mov dl, 00h
          int 10h

           mov ah, 09h
           mov dx, OFFSET DO__A
           int 21h


           mov ah, 07h
           int 21h

           cmp al, DO__T
           je DO__T_EFF
           jne verification

music319: call clear_NOTE
cmp watch, 1
           je MI_#

           mov ah, 02h
          mov dh, 04h
          mov dl, 00h
          int 10h

           mov ah, 09h
           mov dx, OFFSET MI__A
           int 21h


           mov ah, 07h
           int 21h

           cmp al, MI__T
           je MI__T_EFF
           jne verification


music320: cmp watch, 1
                je add_watch_note
            call clear_music


;-------------------------------
;Returns music by note.
;-------------------------------

note1:  cmp cho_music, 1
        je music11
        cmp cho_music, 2
        je music21
        cmp cho_music, 3
        je music31

note2:  cmp cho_music, 1
        je music12
        cmp cho_music, 2
        je music22
        cmp cho_music, 3
        je music32

note3:  cmp cho_music, 1
        je music13
        cmp cho_music, 2
        je music23
        cmp cho_music, 3
        je music33

note4:  cmp cho_music, 1
        je music14
        cmp cho_music, 2
        je music24
        cmp cho_music, 3
        je music34

note5:  cmp cho_music, 1
        je music15
        cmp cho_music, 2
        je music25
        cmp cho_music, 3
        je music35

note6:  cmp cho_music, 1
        je music16
        cmp cho_music, 2
        je music26
        cmp cho_music, 3
        je music36

note7:  cmp cho_music, 1
        je music17
        cmp cho_music, 2
        je music27
        cmp cho_music, 3
        je music37

note8:  cmp cho_music, 1
        je music18
        cmp cho_music, 2
        je music28
        cmp cho_music, 3
        je music38

note9:  cmp cho_music, 1
        je music19
        cmp cho_music, 2
        je music29
        cmp cho_music, 3
        je music39

note10:  cmp cho_music, 1
        je music110
        cmp cho_music, 2
        je music210
        cmp cho_music, 3
        je music310

note11:  cmp cho_music, 1
        je music111
        cmp cho_music, 2
        je music211
        cmp cho_music, 3
        je music311

note12:  cmp cho_music, 1
        je music112
        cmp cho_music, 2
        je music212
        cmp cho_music, 3
        je music312

note13:  cmp cho_music, 1
        je music113
        cmp cho_music, 2
        je music213
        cmp cho_music, 3
        je music313

note14:  cmp cho_music, 1
        je music114
        cmp cho_music, 2
        je music214
        cmp cho_music, 3
        je music314

note15:  cmp cho_music, 1
        je music115
        cmp cho_music, 2
        je music215
        cmp cho_music, 3
        je music315

note16:  cmp cho_music, 1
        je music116
        cmp cho_music, 2
        je music216
        cmp cho_music, 3
        je music316

note17:  cmp cho_music, 1
        je music117
        cmp cho_music, 2
        je music217
        cmp cho_music, 3
        je music317

note18:  cmp cho_music, 1
        je music118
        cmp cho_music, 2
        je music218
        cmp cho_music, 3
        je music318

note19:
        cmp cho_music, 2
        je music219
        cmp cho_music, 3
        je music319

note20:
        cmp cho_music, 2
        je music220
        cmp cho_music, 3
        je music320





;-------------------------------
;Note to watch.
;-------------------------------

note_watch1:    cmp cho_music, 1
                je music_watch11
                cmp cho_music, 2
                je music_watch21
                cmp cho_music, 3
                je music_watch31

note_watch2: cmp cho_music, 1
                je music_watch12
                cmp cho_music, 2
                je music_watch22
                cmp cho_music, 3
                je music_watch32

note_watch3: cmp cho_music, 1
                je music_watch13
                cmp cho_music, 2
                je music_watch23
                cmp cho_music, 3
                je music_watch33

note_watch4: cmp cho_music, 1
                je music_watch14
                cmp cho_music, 2
                je music_watch24
                cmp cho_music, 3
                je music_watch34

note_watch5: cmp cho_music, 1
                je music_watch15
                cmp cho_music, 2
                je music_watch25
                cmp cho_music, 3
                je music_watch35
note_watch6: cmp cho_music, 1
                je music_watch16
                cmp cho_music, 2
                je music_watch26
                cmp cho_music, 3
                je music_watch36

note_watch7: cmp cho_music, 1
                je music_watch17
                cmp cho_music, 2
                je music_watch27
                cmp cho_music, 3
                je music_watch37

note_watch8: cmp cho_music, 1
                je music_watch18
                cmp cho_music, 2
                je music_watch28
                cmp cho_music, 3
                je music_watch38

note_watch9: cmp cho_music, 1
                je music_watch19
                cmp cho_music, 2
                je music_watch29
                cmp cho_music, 3
                je music_watch39

note_watch10: cmp cho_music, 1
                je music_watch110
                cmp cho_music, 2
                je music_watch210
                cmp cho_music, 3
                je music_watch310

note_watch11: cmp cho_music, 1
                je music_watch111
                cmp cho_music, 2
                je music_watch211
                cmp cho_music, 3
                je music_watch311

note_watch12: cmp cho_music, 1
                je music_watch112
                cmp cho_music, 2
                je music_watch212
                cmp cho_music, 3
                je music_watch312

note_watch13: cmp cho_music, 1
                je music_watch113
                cmp cho_music, 2
                je music_watch213
                cmp cho_music, 3
                je music_watch313


note_watch14: cmp cho_music, 1
                je music_watch114
                cmp cho_music, 2
                je music_watch214
                cmp cho_music, 3
                je music_watch314


note_watch15: cmp cho_music, 1
                je music_watch115
                cmp cho_music, 2
                je music_watch215
                cmp cho_music, 3
                je music_watch315

note_watch16: cmp cho_music, 1
                je music_watch116
                cmp cho_music, 2
                je music_watch216
                cmp cho_music, 3
                je music_watch316

note_watch17: cmp cho_music, 1
                je music_watch117
                cmp cho_music, 2
                je music_watch217
                cmp cho_music, 3
                je music_watch317

note_watch18: cmp cho_music, 1
                je music_watch118
                cmp cho_music, 2
                je music_watch218
                cmp cho_music, 3
                je music_watch318

note_watch19: cmp cho_music, 1
                je music_watch119
                cmp cho_music, 2
                je music_watch219
                cmp cho_music, 3
                je music_watch319

note_watch20: cmp cho_music, 1
                je music_watch120
                cmp cho_music, 2
                je music_watch220
                cmp cho_music, 3
                je music_watch320

;---------------------
;song Für Elise
;---------------------

music_watch11: mov ah, 07h
                 int 21h
                 cmp al, MI_T
                 je MI_T_EFF
                 jne verification

music_watch12: mov ah, 07h
                 int 21h
                 cmp al, RE__T
                 je RE__T_EFF
                 jne verification

music_watch13: mov ah, 07h
                 int 21h
                 cmp al, MI_T
                 je MI_T_EFF
                 jne verification

music_watch14: mov ah, 07h
                 int 21h
                 cmp al, RE__T
                 je RE__T_EFF
                 jne verification

music_watch15: mov ah, 07h
                 int 21h
                 cmp al, MI_T
                 je MI_T_EFF
                 jne verification

music_watch16: mov ah, 07h
                 int 21h
                 cmp al, SI_T
                 je SI_T_EFF
                 jne verification

music_watch17: mov ah, 07h
                 int 21h
                 cmp al, RE_T
                 je RE_T_EFF
                 jne verification

music_watch18: mov ah, 07h
                 int 21h
                 cmp al, DO_T
                 je DO_T_EFF
                 jne verification

music_watch19: mov ah, 07h
                 int 21h
                 cmp al, LA_T
                 je LA_T_EFF
                 jne verification

music_watch110: mov ah, 07h
                 int 21h
                 cmp al, DO_T
                 je DO_T_EFF
                 jne verification

music_watch111: mov ah, 07h
                 int 21h
                 cmp al, MI_T
                 je MI_T_EFF
                 jne verification

music_watch112: mov ah, 07h
                 int 21h
                 cmp al, LA_T
                 je LA_T_EFF
                 jne verification

music_watch113: mov ah, 07h
                 int 21h
                 cmp al, SI_T
                 je SI_T_EFF
                 jne verification

music_watch114: mov ah, 07h
                 int 21h
                 cmp al, MI_T
                 je MI_T_EFF
                 jne verification

music_watch115: mov ah, 07h
                 int 21h
                 cmp al, SOL__T
                 je SOL__T_EFF
                 jne verification

music_watch116: mov ah, 07h
                 int 21h
                 cmp al, SI_T
                 je SI_T_EFF
                 jne verification

music_watch117: mov ah, 07h
                 int 21h
                 cmp al, DO_T
                 je DO_T_EFF
                 jne verification

music_watch118: call fin_watc

music_watch119: call fin_watc

music_watch120: call fin_watc

;---------------------------------
;song of tetris!
;---------------------------------

music_watch21: mov ah, 07h
                 int 21h
                 cmp al, MI_T
                 je MI_T_EFF
                 jne verification

music_watch22: mov ah, 07h
                 int 21h
                 cmp al, SI_T
                 je SI_T_EFF
                 jne verification

music_watch23: mov ah, 07h
                 int 21h
                 cmp al, DO_T
                 je DO_T_EFF
                 jne verification

music_watch24: mov ah, 07h
                 int 21h
                 cmp al, RE_T
                 je RE_T_EFF
                 jne verification

music_watch25: mov ah, 07h
                 int 21h
                 cmp al, DO_T
                 je DO_T_EFF
                 jne verification

music_watch26: mov ah, 07h
                 int 21h
                 cmp al, SI_T
                 je SI_T_EFF
                 jne verification

music_watch27: mov ah, 07h
                 int 21h
                 cmp al, LA_T
                 je LA_T_EFF
                 jne verification

music_watch28: mov ah, 07h
                 int 21h
                 cmp al, LA_T
                 je LA_T_EFF
                 jne verification

music_watch29: mov ah, 07h
                 int 21h
                 cmp al, DO_T
                 je DO_T_EFF
                 jne verification

music_watch210: mov ah, 07h
                 int 21h
                 cmp al, MI_T
                 je MI_T_EFF
                 jne verification

music_watch211: mov ah, 07h
                 int 21h
                 cmp al, RE_T
                 je RE_T_EFF
                 jne verification

music_watch212: mov ah, 07h
                 int 21h
                 cmp al, DO_T
                 je DO_T_EFF
                 jne verification

music_watch213: mov ah, 07h
                 int 21h
                 cmp al, SI_T
                 je SI_T_EFF
                 jne verification

music_watch214: mov ah, 07h
                 int 21h
                 cmp al, DO_T
                 je DO_T_EFF
                 jne verification

music_watch215: mov ah, 07h
                 int 21h
                 cmp al, RE_T
                 je RE_T_EFF
                 jne verification

music_watch216: mov ah, 07h
                 int 21h
                 cmp al, MI_T
                 je MI_T_EFF
                 jne verification

music_watch217: mov ah, 07h
                 int 21h
                 cmp al, DO_T
                 je DO_T_EFF
                 jne verification

music_watch218: mov ah, 07h
                 int 21h
                 cmp al, LA_T
                 je LA_T_EFF
                 jne verification

music_watch219: mov ah, 07h
                 int 21h
                 cmp al, LA_T
                 je LA_T_EFF
                 jne verification

music_watch220: call fin_watc

;----------------------------
;song marche
;----------------------------

music_watch31: mov ah, 07h
                 int 21h
                 cmp al, DO__T
                 je DO__T_EFF
                 jne verification

music_watch32: mov ah, 07h
                 int 21h
                 cmp al, MI__T
                 je MI__T_EFF
                 jne verification

music_watch33: mov ah, 07h
                 int 21h
                 cmp al, LA_T
                 je LA_T_EFF
                 jne verification

music_watch34: mov ah, 07h
                 int 21h
                 cmp al, MI__T
                 je MI__T_EFF
                 jne verification

music_watch35: mov ah, 07h
                 int 21h
                 cmp al, FA_T
                 je FA_T_EFF
                 jne verification

music_watch36: mov ah, 07h
                 int 21h
                 cmp al, MI__T
                 je MI__T_EFF
                 jne verification

music_watch37: mov ah, 07h
                 int 21h
                 cmp al, SOL__T
                 je SOL__T_EFF
                 jne verification

music_watch38: mov ah, 07h
                 int 21h
                 cmp al, MI__T
                 je MI__T_EFF
                 jne verification

music_watch39: mov ah, 07h
                 int 21h
                 cmp al, RE_T
                 je RE_T_EFF
                 jne verification

music_watch310: mov ah, 07h
                 int 21h
                 cmp al, MI_T
                 je MI_T_EFF
                 jne verification

music_watch311: mov ah, 07h
                 int 21h
                 cmp al, MI__T
                 je MI__T_EFF
                 jne verification

music_watch312: mov ah, 07h
                 int 21h
                 cmp al, DO__T
                 je DO__T_EFF
                 jne verification

music_watch313: mov ah, 07h
                 int 21h
                 cmp al, SI_T
                 je SI_T_EFF
                 jne verification

music_watch314: mov ah, 07h
                 int 21h
                 cmp al, LA_T
                 je LA_T_EFF
                 jne verification

music_watch315: mov ah, 07h
                 int 21h
                 cmp al, LA_T
                 je LA_T_EFF
                 jne verification

music_watch316: mov ah, 07h
                 int 21h
                 cmp al, SOL__T
                 je SOL__T_EFF
                 jne verification

music_watch317: mov ah, 07h
                 int 21h
                 cmp al, SOL__T
                 je SOL__T_EFF
                 jne verification

music_watch318: mov ah, 07h
                 int 21h
                 cmp al, DO__T
                 je DO__T_EFF
                 jne verification

music_watch319: mov ah, 07h
                 int 21h
                 cmp al, MI__T
                 je MI__T_EFF
                 jne verification

music_watch320: call fin_watc



;------------------------
;Creation of the guitar !
;------------------------
guitar db 0

menu_guitar: mov ah, 02h
      mov dh, 00h
      mov dl, 00h
      int 10h
      mov ah, 09h
      mov dx, OFFSET message_g
      int 21h

      mov ah, 02h
      mov dh, 01h
      mov dl, 00h
      int 10h
      mov ah, 09h
      mov dx, OFFSET message_g2
      int 21h

      mov ah, 02h
      mov dh, 02h
      mov dl, 00h
      int 10h
      mov ah, 09h
      mov dx, OFFSET message_g3
      int 21h

      mov ah, 02h
      mov dh, 03h
      mov dl, 00h
      int 10h
      mov ah, 09h
      mov dx, OFFSET message_g4
      int 21h

      mov ah, 02h
      mov dh, 04h
      mov dl, 00h
      int 10h
      mov ah, 09h
      mov dx, OFFSET message_g5
      int 21h

      mov ah, 02h
      mov dh, 05h
      mov dl, 00h
      int 10h
      mov ah, 09h
      mov dx, OFFSET message_g6
      int 21h

      mov ah, 02h
      mov dh, 06h
      mov dl, 00h
      int 10h
      mov ah, 09h
      mov dx, OFFSET message_g6
      int 21h


              mov guitar, 1
              mov ah, 07h
              int 21h
              cmp al, s
              je clear_screen
              jne menu_guitar

message_g db  "Hello, Welcome to the add-ons !                                 $"
message_g2 db "Here you will be able to play guitar                           $"
message_g3 db "Press 's' to start                                        $"
message_g4 db "And press 'a' at any time to quit                       $"
message_g5 db "                                                                     $"
message_g6 db "                                                                     $"
message_g7 db "                                                                     $"
fin_guitar: mov guitar, 0
             call clear_screen

display_guitar:

mov ah, 02h
      mov dh, 00h
      mov dl, 00h
      int 10h
      mov ah, 09h
      mov dx, OFFSET line_g1
      int 21h

      mov ah, 02h
      mov dh, 01h
      mov dl, 00h
      int 10h
      mov ah, 09h
      mov dx, OFFSET line_g2
      int 21h

      mov ah, 02h
      mov dh, 02h
      mov dl, 00h
      int 10h
      mov ah, 09h
      mov dx, OFFSET line_g3
      int 21h

      mov ah, 02h
      mov dh, 03h
      mov dl, 00h
      int 10h
      mov ah, 09h
      mov dx, OFFSET line_g4
      int 21h

      mov ah, 02h
      mov dh, 04h
      mov dl, 00h
      int 10h
      mov ah, 09h
      mov dx, OFFSET line_g5
      int 21h

      mov ah, 02h
      mov dh, 05h
      mov dl, 00h
      int 10h
      mov ah, 09h
      mov dx, OFFSET line_g6
      int 21h

      mov ah, 02h
      mov dh, 06h
      mov dl, 00h
      int 10h
      mov ah, 09h
      mov dx, OFFSET line_g7
      int 21h

      mov ah, 02h
      mov dh, 07h
      mov dl, 00h
      int 10h
      mov ah, 09h
      mov dx, OFFSET line_g8
      int 21h

      mov ah, 02h
      mov dh, 08h
      mov dl, 00h
      int 10h
      mov ah, 09h
      mov dx, OFFSET line_g9
      int 21h

      mov ah, 02h
      mov dh, 09h
      mov dl, 00h
      int 10h
      mov ah, 09h
      mov dx, OFFSET line_g10
      int 21h

      call guitar_game

line_g1  db "    _______________                              $"
line_g2  db "   /               \                             $"
line_g3  db "  /______e--------- \               []_[]_[]     $"
line_g4  db " / ______d---------  \_____________/        \    $"
line_g5  db "(  ______c---------                          |   $"
line_g6  db "(  ______v---------   ______________  _  _  /    $"
line_g7  db " \ ______b---------  /              [] [] []     $"
line_g8  db "  \                 /                            $"
line_g9  db "   \_______________/                             $"
line_g10 db "                                                 $"


guitar_game: mov ah, 07h
              int 21h
              cmp al, e
              je e_guit
              cmp al, d
              je d_guit
              cmp al, c
              je c_guit
              cmp al, v
              je v_guit
              cmp al, b
              je b_guit
              cmp al, a
              je guit_fin
              jne guitar_game

e_guit:   call guit_clear
          mov dl, 07h
          mov ah, 2
          int 21h
          mov ah, 02h
          mov dh, 02h
          mov dl, 10
          int 10h

          mov ah, 09h
          mov al, '~'
          mov bh, 0
          mov cx, 9
          mov bl, red
          int 10h

          call guitar_game

d_guit:   call guit_clear
          mov dl, 07h
          mov ah, 2
          int 21h
          mov ah, 02h
          mov dh, 03h
          mov dl, 10
          int 10h

          mov ah, 09h
          mov al, '~'
          mov bh, 0
          mov cx, 9
          mov bl, red
          int 10h

          call guitar_game

c_guit:   call guit_clear
          mov dl, 07h
          mov ah, 2
          int 21h
          mov ah, 02h
          mov dh, 04h
          mov dl, 10
          int 10h

          mov ah, 09h
          mov al, '~'
          mov bh, 0
          mov cx, 9
          mov bl, red
          int 10h

          call guitar_game

v_guit:   call guit_clear
          mov dl, 07h
          mov ah, 2
          int 21h
          mov ah, 02h
          mov dh, 05h
          mov dl, 10
          int 10h

          mov ah, 09h
          mov al, '~'
          mov bh, 0
          mov cx, 9
          mov bl, red
          int 10h

          call guitar_game

b_guit:   call guit_clear
          mov dl, 07h
          mov ah, 2
          int 21h
          mov ah, 02h
          mov dh, 06h
          mov dl, 10
          int 10h

          mov ah, 09h
          mov al, '~'
          mov bh, 0
          mov cx, 9
          mov bl, red
          int 10h

          call guitar_game


guit_clear: mov ah, 02h
          mov dh, 02h
          mov dl, 00h
          int 10h
          mov ah, 09h
          mov dx, OFFSET line_g3
          int 21h

          mov ah, 02h
          mov dh, 03h
          mov dl, 00h
          int 10h
          mov ah, 09h
          mov dx, OFFSET line_g4
          int 21h

          mov ah, 02h
          mov dh, 04h
          mov dl, 00h
          int 10h
          mov ah, 09h
          mov dx, OFFSET line_g5
          int 21h

          mov ah, 02h
          mov dh, 05h
          mov dl, 00h
          int 10h
          mov ah, 09h
          mov dx, OFFSET line_g6
          int 21h

          mov ah, 02h
          mov dh, 06h
          mov dl, 00h
          int 10h
          mov ah, 09h
          mov dx, OFFSET line_g7
          int 21h

          ret

guit_fin: mov guitar, 0
          call clear_screen

bon_son_la: mov al,3
            out 61h,al        ;turn on the beep

            mov dx,42h                 ;buzzer frequency divider (LSB first)
            mov ax,440               ;ax=1193200/desired frequency
            out dx,al
            jmp $+2
            mov al,ah                  ;then the MSB
            out dx,al

            mov al,0
            out 61h,al        ;Turn off the beep
            ret


bon_son_sol: mov al,3
            out 61h,al        ;turn on the beep

            mov dx,42h                 ;buzzer frequency divider (LSB first)
            mov ax,392               ;ax=1193200/desired frequency
            out dx,al
            jmp $+2
            mov al,ah                  ;then the MSB
            out dx,al

            mov al,0
            out 61h,al        ;Turn off the beep
            ret

bon_son_fa: mov al,3
            out 61h,al        ;turn on the beep

            mov dx,42h                 ;buzzer frequency divider (LSB first)
            mov ax,349              ;ax=1193200/desired frequency
            out dx,al
            jmp $+2
            mov al,ah                  ;then the MSB
            out dx,al

            mov al,0
            out 61h,al        ;Turn off the beep
            ret
