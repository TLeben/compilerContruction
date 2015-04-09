# preamble

.globl main
main:
	pushl %ebp
	movl %esp, %ebp
	subl $348, %esp
	pushl %ebx
	pushl %esi
	pushl %edi
# preamble
	movl $1, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else0
	call inject_int
	jmp endif0
else0:
	cmpl $1, %ebx
	jne else1
	call inject_bool
	jmp endif1
else1:
	cmpl $2, %ebx
	jne else2
	call inject_big
	jmp endif2
else2:
	cmpl $3, %ebx
	jne else3
	call inject_big
	jmp endif3
else3:
endif3:
endif2:
endif1:
endif0:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	movl %ebx, %edx
	movl $2, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else4
	call inject_int
	jmp endif4
else4:
	cmpl $1, %ebx
	jne else5
	call inject_bool
	jmp endif5
else5:
	cmpl $2, %ebx
	jne else6
	call inject_big
	jmp endif6
else6:
	cmpl $3, %ebx
	jne else7
	call inject_big
	jmp endif7
else7:
endif7:
endif6:
endif5:
endif4:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	movl %ebx, %edx
	movl %edx, %ebx
	pushl %ebx
	call tag
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else8
	call inject_int
	jmp endif8
else8:
	cmpl $1, %ebx
	jne else9
	call inject_bool
	jmp endif9
else9:
	cmpl $2, %ebx
	jne else10
	call inject_big
	jmp endif10
else10:
	cmpl $3, %ebx
	jne else11
	call inject_big
	jmp endif11
else11:
endif11:
endif10:
endif9:
endif8:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ebx
	movl $0, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else12
	call inject_int
	jmp endif12
else12:
	cmpl $1, %ebx
	jne else13
	call inject_bool
	jmp endif13
else13:
	cmpl $2, %ebx
	jne else14
	call inject_big
	jmp endif14
else14:
	cmpl $3, %ebx
	jne else15
	call inject_big
	jmp endif15
else15:
endif15:
endif14:
endif13:
endif12:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	movl %ebx, %ecx
	cmpl %ebx, %ecx
	jne else16
	movl $1, %ecx
	jmp endif16
else16:
	movl $0, %ecx
endif16:
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else17
	call inject_int
	jmp endif17
else17:
	cmpl $1, %ebx
	jne else18
	call inject_bool
	jmp endif18
else18:
	cmpl $2, %ebx
	jne else19
	call inject_big
	jmp endif19
else19:
	cmpl $3, %ebx
	jne else20
	call inject_big
	jmp endif20
else20:
endif20:
endif19:
endif18:
endif17:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %edx, %ebx
	pushl %ebx
	call tag
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else21
	call inject_int
	jmp endif21
else21:
	cmpl $1, %ebx
	jne else22
	call inject_bool
	jmp endif22
else22:
	cmpl $2, %ebx
	jne else23
	call inject_big
	jmp endif23
else23:
	cmpl $3, %ebx
	jne else24
	call inject_big
	jmp endif24
else24:
endif24:
endif23:
endif22:
endif21:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl $0, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else25
	call inject_int
	jmp endif25
else25:
	cmpl $1, %ebx
	jne else26
	call inject_bool
	jmp endif26
else26:
	cmpl $2, %ebx
	jne else27
	call inject_big
	jmp endif27
else27:
	cmpl $3, %ebx
	jne else28
	call inject_big
	jmp endif28
else28:
endif28:
endif27:
endif26:
endif25:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %ebx, %ecx
	movl %edx, %ebx
	cmpl %ecx, %ebx
	jne else29
	movl $1, %ecx
	jmp endif29
else29:
	movl $0, %ecx
endif29:
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else30
	call inject_int
	jmp endif30
else30:
	cmpl $1, %ebx
	jne else31
	call inject_bool
	jmp endif31
else31:
	cmpl $2, %ebx
	jne else32
	call inject_big
	jmp endif32
else32:
	cmpl $3, %ebx
	jne else33
	call inject_big
	jmp endif33
else33:
endif33:
endif32:
endif31:
endif30:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %ecx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $0, %eax
	jne else34
	movl %ebx, %ecx
	jmp endif34
else34:
	movl %edx, %ebx
	movl %ebx, %ecx
endif34:
	movl %ecx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $1, %eax
	jne else35
	movl %edx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else36
	call project_int
	jmp endif36
else36:
	cmpl $1, %ebx
	jne else37
	call project_bool
	jmp endif37
else37:
	cmpl $2, %ebx
	jne else38
	call project_big
	jmp endif38
else38:
	cmpl $3, %ebx
	jne else39
	call project_big
	jmp endif39
else39:
endif39:
endif38:
endif37:
endif36:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %edx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else40
	call project_int
	jmp endif40
else40:
	cmpl $1, %ebx
	jne else41
	call project_bool
	jmp endif41
else41:
	cmpl $2, %ebx
	jne else42
	call project_big
	jmp endif42
else42:
	cmpl $3, %ebx
	jne else43
	call project_big
	jmp endif43
else43:
endif43:
endif42:
endif41:
endif40:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %edx, %ecx
	movl %edx, %ebx
	addl %ecx, %ebx
	movl %ebx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else44
	call inject_int
	jmp endif44
else44:
	cmpl $1, %ebx
	jne else45
	call inject_bool
	jmp endif45
else45:
	cmpl $2, %ebx
	jne else46
	call inject_big
	jmp endif46
else46:
	cmpl $3, %ebx
	jne else47
	call inject_big
	jmp endif47
else47:
endif47:
endif46:
endif45:
endif44:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	movl %ebx, %ebx
	jmp endif35
else35:
	movl %edx, %ebx
	pushl %ebx
	call tag
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else48
	call inject_int
	jmp endif48
else48:
	cmpl $1, %ebx
	jne else49
	call inject_bool
	jmp endif49
else49:
	cmpl $2, %ebx
	jne else50
	call inject_big
	jmp endif50
else50:
	cmpl $3, %ebx
	jne else51
	call inject_big
	jmp endif51
else51:
endif51:
endif50:
endif49:
endif48:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl $0, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else52
	call inject_int
	jmp endif52
else52:
	cmpl $1, %ebx
	jne else53
	call inject_bool
	jmp endif53
else53:
	cmpl $2, %ebx
	jne else54
	call inject_big
	jmp endif54
else54:
	cmpl $3, %ebx
	jne else55
	call inject_big
	jmp endif55
else55:
endif55:
endif54:
endif53:
endif52:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %edx, %ecx
	movl %edx, %ebx
	cmpl %ecx, %ebx
	jne else56
	movl $1, %ebx
	jmp endif56
else56:
	movl $0, %ebx
endif56:
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else57
	call inject_int
	jmp endif57
else57:
	cmpl $1, %ebx
	jne else58
	call inject_bool
	jmp endif58
else58:
	cmpl $2, %ebx
	jne else59
	call inject_big
	jmp endif59
else59:
	cmpl $3, %ebx
	jne else60
	call inject_big
	jmp endif60
else60:
endif60:
endif59:
endif58:
endif57:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %edx, %ebx
	pushl %ebx
	call tag
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else61
	call inject_int
	jmp endif61
else61:
	cmpl $1, %ebx
	jne else62
	call inject_bool
	jmp endif62
else62:
	cmpl $2, %ebx
	jne else63
	call inject_big
	jmp endif63
else63:
	cmpl $3, %ebx
	jne else64
	call inject_big
	jmp endif64
else64:
endif64:
endif63:
endif62:
endif61:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl $1, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else65
	call inject_int
	jmp endif65
else65:
	cmpl $1, %ebx
	jne else66
	call inject_bool
	jmp endif66
else66:
	cmpl $2, %ebx
	jne else67
	call inject_big
	jmp endif67
else67:
	cmpl $3, %ebx
	jne else68
	call inject_big
	jmp endif68
else68:
endif68:
endif67:
endif66:
endif65:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ebx, %ecx
	movl %ecx, %ebx
	cmpl %ecx, %ebx
	jne else69
	movl $1, %ebx
	jmp endif69
else69:
	movl $0, %ebx
endif69:
	movl %ebx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else70
	call inject_int
	jmp endif70
else70:
	cmpl $1, %ebx
	jne else71
	call inject_bool
	jmp endif71
else71:
	cmpl $2, %ebx
	jne else72
	call inject_big
	jmp endif72
else72:
	cmpl $3, %ebx
	jne else73
	call inject_big
	jmp endif73
else73:
endif73:
endif72:
endif71:
endif70:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %edx, %ecx
	pushl %ecx
	call is_true
	addl $4, %esp
	cmpl $0, %eax
	jne else74
	movl %ecx, %ebx
	jmp endif74
else74:
	movl %ecx, %ecx
	movl %ecx, %ebx
endif74:
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $1, %eax
	jne else75
	movl %edx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else76
	call project_int
	jmp endif76
else76:
	cmpl $1, %ebx
	jne else77
	call project_bool
	jmp endif77
else77:
	cmpl $2, %ebx
	jne else78
	call project_big
	jmp endif78
else78:
	cmpl $3, %ebx
	jne else79
	call project_big
	jmp endif79
else79:
endif79:
endif78:
endif77:
endif76:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %edx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else80
	call project_int
	jmp endif80
else80:
	cmpl $1, %ebx
	jne else81
	call project_bool
	jmp endif81
else81:
	cmpl $2, %ebx
	jne else82
	call project_big
	jmp endif82
else82:
	cmpl $3, %ebx
	jne else83
	call project_big
	jmp endif83
else83:
endif83:
endif82:
endif81:
endif80:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ecx, %ebx
	movl %ebx, %ebx
	addl %ebx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else84
	call inject_int
	jmp endif84
else84:
	cmpl $1, %ebx
	jne else85
	call inject_bool
	jmp endif85
else85:
	cmpl $2, %ebx
	jne else86
	call inject_big
	jmp endif86
else86:
	cmpl $3, %ebx
	jne else87
	call inject_big
	jmp endif87
else87:
endif87:
endif86:
endif85:
endif84:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
	jmp endif75
else75:
	movl %edx, %ebx
	pushl %ebx
	call tag
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else88
	call inject_int
	jmp endif88
else88:
	cmpl $1, %ebx
	jne else89
	call inject_bool
	jmp endif89
else89:
	cmpl $2, %ebx
	jne else90
	call inject_big
	jmp endif90
else90:
	cmpl $3, %ebx
	jne else91
	call inject_big
	jmp endif91
else91:
endif91:
endif90:
endif89:
endif88:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl $1, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else92
	call inject_int
	jmp endif92
else92:
	cmpl $1, %ebx
	jne else93
	call inject_bool
	jmp endif93
else93:
	cmpl $2, %ebx
	jne else94
	call inject_big
	jmp endif94
else94:
	cmpl $3, %ebx
	jne else95
	call inject_big
	jmp endif95
else95:
endif95:
endif94:
endif93:
endif92:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %edx, %ebx
	movl %ecx, %ecx
	cmpl %ebx, %ecx
	jne else96
	movl $1, %ebx
	jmp endif96
else96:
	movl $0, %ebx
endif96:
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else97
	call inject_int
	jmp endif97
else97:
	cmpl $1, %ebx
	jne else98
	call inject_bool
	jmp endif98
else98:
	cmpl $2, %ebx
	jne else99
	call inject_big
	jmp endif99
else99:
	cmpl $3, %ebx
	jne else100
	call inject_big
	jmp endif100
else100:
endif100:
endif99:
endif98:
endif97:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %esi
	movl %edx, %ebx
	pushl %ebx
	call tag
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else101
	call inject_int
	jmp endif101
else101:
	cmpl $1, %ebx
	jne else102
	call inject_bool
	jmp endif102
else102:
	cmpl $2, %ebx
	jne else103
	call inject_big
	jmp endif103
else103:
	cmpl $3, %ebx
	jne else104
	call inject_big
	jmp endif104
else104:
endif104:
endif103:
endif102:
endif101:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl $0, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else105
	call inject_int
	jmp endif105
else105:
	cmpl $1, %ebx
	jne else106
	call inject_bool
	jmp endif106
else106:
	cmpl $2, %ebx
	jne else107
	call inject_big
	jmp endif107
else107:
	cmpl $3, %ebx
	jne else108
	call inject_big
	jmp endif108
else108:
endif108:
endif107:
endif106:
endif105:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %ecx, %ebx
	movl %edx, %ecx
	cmpl %ebx, %ecx
	jne else109
	movl $1, %ecx
	jmp endif109
else109:
	movl $0, %ecx
endif109:
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else110
	call inject_int
	jmp endif110
else110:
	cmpl $1, %ebx
	jne else111
	call inject_bool
	jmp endif111
else111:
	cmpl $2, %ebx
	jne else112
	call inject_big
	jmp endif112
else112:
	cmpl $3, %ebx
	jne else113
	call inject_big
	jmp endif113
else113:
endif113:
endif112:
endif111:
endif110:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %esi, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $0, %eax
	jne else114
	movl %ebx, %ebx
	jmp endif114
else114:
	movl %ebx, %ecx
	movl %ecx, %ebx
endif114:
	movl %ebx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $1, %eax
	jne else115
	movl %edx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else116
	call project_int
	jmp endif116
else116:
	cmpl $1, %ebx
	jne else117
	call project_bool
	jmp endif117
else117:
	cmpl $2, %ebx
	jne else118
	call project_big
	jmp endif118
else118:
	cmpl $3, %ebx
	jne else119
	call project_big
	jmp endif119
else119:
endif119:
endif118:
endif117:
endif116:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %edx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else120
	call project_int
	jmp endif120
else120:
	cmpl $1, %ebx
	jne else121
	call project_bool
	jmp endif121
else121:
	cmpl $2, %ebx
	jne else122
	call project_big
	jmp endif122
else122:
	cmpl $3, %ebx
	jne else123
	call project_big
	jmp endif123
else123:
endif123:
endif122:
endif121:
endif120:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ecx, %ecx
	addl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else124
	call inject_int
	jmp endif124
else124:
	cmpl $1, %ebx
	jne else125
	call inject_bool
	jmp endif125
else125:
	cmpl $2, %ebx
	jne else126
	call inject_big
	jmp endif126
else126:
	cmpl $3, %ebx
	jne else127
	call inject_big
	jmp endif127
else127:
endif127:
endif126:
endif125:
endif124:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	jmp endif115
else115:
	movl %edx, %ebx
	pushl %ebx
	call tag
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else128
	call inject_int
	jmp endif128
else128:
	cmpl $1, %ebx
	jne else129
	call inject_bool
	jmp endif129
else129:
	cmpl $2, %ebx
	jne else130
	call inject_big
	jmp endif130
else130:
	cmpl $3, %ebx
	jne else131
	call inject_big
	jmp endif131
else131:
endif131:
endif130:
endif129:
endif128:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl $1, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else132
	call inject_int
	jmp endif132
else132:
	cmpl $1, %ebx
	jne else133
	call inject_bool
	jmp endif133
else133:
	cmpl $2, %ebx
	jne else134
	call inject_big
	jmp endif134
else134:
	cmpl $3, %ebx
	jne else135
	call inject_big
	jmp endif135
else135:
endif135:
endif134:
endif133:
endif132:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ecx, %ebx
	movl %ebx, %ecx
	cmpl %ebx, %ecx
	jne else136
	movl $1, %ecx
	jmp endif136
else136:
	movl $0, %ecx
endif136:
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else137
	call inject_int
	jmp endif137
else137:
	cmpl $1, %ebx
	jne else138
	call inject_bool
	jmp endif138
else138:
	cmpl $2, %ebx
	jne else139
	call inject_big
	jmp endif139
else139:
	cmpl $3, %ebx
	jne else140
	call inject_big
	jmp endif140
else140:
endif140:
endif139:
endif138:
endif137:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %edx, %ebx
	pushl %ebx
	call tag
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else141
	call inject_int
	jmp endif141
else141:
	cmpl $1, %ebx
	jne else142
	call inject_bool
	jmp endif142
else142:
	cmpl $2, %ebx
	jne else143
	call inject_big
	jmp endif143
else143:
	cmpl $3, %ebx
	jne else144
	call inject_big
	jmp endif144
else144:
endif144:
endif143:
endif142:
endif141:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl $1, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else145
	call inject_int
	jmp endif145
else145:
	cmpl $1, %ebx
	jne else146
	call inject_bool
	jmp endif146
else146:
	cmpl $2, %ebx
	jne else147
	call inject_big
	jmp endif147
else147:
	cmpl $3, %ebx
	jne else148
	call inject_big
	jmp endif148
else148:
endif148:
endif147:
endif146:
endif145:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ecx, %ecx
	cmpl %ebx, %ecx
	jne else149
	movl $1, %ecx
	jmp endif149
else149:
	movl $0, %ecx
endif149:
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else150
	call inject_int
	jmp endif150
else150:
	cmpl $1, %ebx
	jne else151
	call inject_bool
	jmp endif151
else151:
	cmpl $2, %ebx
	jne else152
	call inject_big
	jmp endif152
else152:
	cmpl $3, %ebx
	jne else153
	call inject_big
	jmp endif153
else153:
endif153:
endif152:
endif151:
endif150:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ecx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $0, %eax
	jne else154
	movl %ebx, %ebx
	jmp endif154
else154:
	movl %ebx, %ebx
	movl %ebx, %ebx
endif154:
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $1, %eax
	jne else155
	movl %edx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else156
	call project_int
	jmp endif156
else156:
	cmpl $1, %ebx
	jne else157
	call project_bool
	jmp endif157
else157:
	cmpl $2, %ebx
	jne else158
	call project_big
	jmp endif158
else158:
	cmpl $3, %ebx
	jne else159
	call project_big
	jmp endif159
else159:
endif159:
endif158:
endif157:
endif156:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %edx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else160
	call project_int
	jmp endif160
else160:
	cmpl $1, %ebx
	jne else161
	call project_bool
	jmp endif161
else161:
	cmpl $2, %ebx
	jne else162
	call project_big
	jmp endif162
else162:
	cmpl $3, %ebx
	jne else163
	call project_big
	jmp endif163
else163:
endif163:
endif162:
endif161:
endif160:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %ebx, %ecx
	movl %edx, %ebx
	addl %ecx, %ebx
	movl %ebx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else164
	call inject_int
	jmp endif164
else164:
	cmpl $1, %ebx
	jne else165
	call inject_bool
	jmp endif165
else165:
	cmpl $2, %ebx
	jne else166
	call inject_big
	jmp endif166
else166:
	cmpl $3, %ebx
	jne else167
	call inject_big
	jmp endif167
else167:
endif167:
endif166:
endif165:
endif164:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ecx
	jmp endif155
else155:
	movl %edx, %ebx
	pushl %ebx
	call tag
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else168
	call inject_int
	jmp endif168
else168:
	cmpl $1, %ebx
	jne else169
	call inject_bool
	jmp endif169
else169:
	cmpl $2, %ebx
	jne else170
	call inject_big
	jmp endif170
else170:
	cmpl $3, %ebx
	jne else171
	call inject_big
	jmp endif171
else171:
endif171:
endif170:
endif169:
endif168:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl $3, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else172
	call inject_int
	jmp endif172
else172:
	cmpl $1, %ebx
	jne else173
	call inject_bool
	jmp endif173
else173:
	cmpl $2, %ebx
	jne else174
	call inject_big
	jmp endif174
else174:
	cmpl $3, %ebx
	jne else175
	call inject_big
	jmp endif175
else175:
endif175:
endif174:
endif173:
endif172:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %edx, %ecx
	movl %edx, %ebx
	cmpl %ecx, %ebx
	jne else176
	movl $1, %ebx
	jmp endif176
else176:
	movl $0, %ebx
endif176:
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else177
	call inject_int
	jmp endif177
else177:
	cmpl $1, %ebx
	jne else178
	call inject_bool
	jmp endif178
else178:
	cmpl $2, %ebx
	jne else179
	call inject_big
	jmp endif179
else179:
	cmpl $3, %ebx
	jne else180
	call inject_big
	jmp endif180
else180:
endif180:
endif179:
endif178:
endif177:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %edx, %ebx
	pushl %ebx
	call tag
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else181
	call inject_int
	jmp endif181
else181:
	cmpl $1, %ebx
	jne else182
	call inject_bool
	jmp endif182
else182:
	cmpl $2, %ebx
	jne else183
	call inject_big
	jmp endif183
else183:
	cmpl $3, %ebx
	jne else184
	call inject_big
	jmp endif184
else184:
endif184:
endif183:
endif182:
endif181:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl $3, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else185
	call inject_int
	jmp endif185
else185:
	cmpl $1, %ebx
	jne else186
	call inject_bool
	jmp endif186
else186:
	cmpl $2, %ebx
	jne else187
	call inject_big
	jmp endif187
else187:
	cmpl $3, %ebx
	jne else188
	call inject_big
	jmp endif188
else188:
endif188:
endif187:
endif186:
endif185:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ecx, %ecx
	cmpl %ebx, %ecx
	jne else189
	movl $1, %ebx
	jmp endif189
else189:
	movl $0, %ebx
endif189:
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else190
	call inject_int
	jmp endif190
else190:
	cmpl $1, %ebx
	jne else191
	call inject_bool
	jmp endif191
else191:
	cmpl $2, %ebx
	jne else192
	call inject_big
	jmp endif192
else192:
	cmpl $3, %ebx
	jne else193
	call inject_big
	jmp endif193
else193:
endif193:
endif192:
endif191:
endif190:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %edx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $0, %eax
	jne else194
	movl %ebx, %ebx
	jmp endif194
else194:
	movl %ebx, %ecx
	movl %ecx, %ebx
endif194:
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $1, %eax
	jne else195
	movl %edx, %ebx
	pushl %ebx
	movl $3, %ebx
	cmpl $0, %ebx
	jne else196
	call project_int
	jmp endif196
else196:
	cmpl $1, %ebx
	jne else197
	call project_bool
	jmp endif197
else197:
	cmpl $2, %ebx
	jne else198
	call project_big
	jmp endif198
else198:
	cmpl $3, %ebx
	jne else199
	call project_big
	jmp endif199
else199:
endif199:
endif198:
endif197:
endif196:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %edx, %ebx
	pushl %ebx
	movl $3, %ebx
	cmpl $0, %ebx
	jne else200
	call project_int
	jmp endif200
else200:
	cmpl $1, %ebx
	jne else201
	call project_bool
	jmp endif201
else201:
	cmpl $2, %ebx
	jne else202
	call project_big
	jmp endif202
else202:
	cmpl $3, %ebx
	jne else203
	call project_big
	jmp endif203
else203:
endif203:
endif202:
endif201:
endif200:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ecx, %ecx
	movl %ebx, %ebx
	pushl %ebx
	pushl %ecx
	call add
	addl $8, %esp
	movl %eax, %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $3, %ebx
	cmpl $0, %ebx
	jne else204
	call inject_int
	jmp endif204
else204:
	cmpl $1, %ebx
	jne else205
	call inject_bool
	jmp endif205
else205:
	cmpl $2, %ebx
	jne else206
	call inject_big
	jmp endif206
else206:
	cmpl $3, %ebx
	jne else207
	call inject_big
	jmp endif207
else207:
endif207:
endif206:
endif205:
endif204:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
	jmp endif195
else195:
	movl %esi, %ebx
	call type_error
	movl %eax, %ecx
	addl $0, %esp
	movl %ecx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
endif195:
	movl %ebx, %ebx
	movl %ebx, %ecx
endif155:
	movl %ecx, %ebx
	movl %ebx, %ebx
endif115:
	movl %ebx, %ecx
	movl %ecx, %ebx
endif75:
	movl %ebx, %ecx
	movl %ecx, %ebx
endif35:
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	call print_any
	addl $4, %esp
	movl $0, %ebx
	movl %ebx, %eax
	popl %edi
	popl %esi
	popl %ebx
	addl $348, %esp
	leave
	ret
