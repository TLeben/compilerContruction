# preamble

.globl main
main:
	pushl %ebp
	movl %esp, %ebp
	subl $4908, %esp
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
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %edx
	movl $1, %ebx
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
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
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
	movl %ebx, %ecx
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
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %ecx, %ebx
	movl %edx, %ecx
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
	movl %ebx, %ecx
	movl %ebx, %ecx
	movl %ecx, %ebx
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
	movl %esi, %ebx
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
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
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
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ecx
	movl %ebx, %ebx
	addl %ecx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
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
	movl %ebx, %ecx
	jmp endif35
else35:
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
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
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
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ecx
	movl %ebx, %ebx
	cmpl %ecx, %ebx
	jne else56
	movl $1, %ecx
	jmp endif56
else56:
	movl $0, %ecx
endif56:
	movl %ecx, %ebx
	movl %ebx, %ebx
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
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
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
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ecx, %ebx
	movl %ebx, %ecx
	cmpl %ebx, %ecx
	jne else69
	movl $1, %ecx
	jmp endif69
else69:
	movl $0, %ecx
endif69:
	movl %ecx, %ebx
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
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ecx, %ecx
	pushl %ecx
	call is_true
	addl $4, %esp
	cmpl $0, %eax
	jne else74
	movl %ecx, %ebx
	jmp endif74
else74:
	movl %ebx, %ecx
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
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	movl %ebx, %ecx
	jmp endif75
else75:
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
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %edx, %ebx
	movl %ebx, %ecx
	cmpl %ebx, %ecx
	jne else96
	movl $1, %ecx
	jmp endif96
else96:
	movl $0, %ecx
endif96:
	movl %ecx, %ebx
	movl %ebx, %ebx
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
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
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
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	movl %ebx, %ecx
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
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %ecx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $0, %eax
	jne else114
	movl %ebx, %ebx
	jmp endif114
else114:
	movl %edx, %ecx
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
	movl %ebx, %ebx
	movl %ecx, %ecx
	movl %ebx, %ebx
	addl %ecx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
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
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	movl %ebx, %ecx
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
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
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
	movl %ebx, %ecx
	movl %ebx, %ebx
	cmpl %ecx, %ebx
	jne else136
	movl $1, %ebx
	jmp endif136
else136:
	movl $0, %ebx
endif136:
	movl %ebx, %ecx
	movl %ecx, %ebx
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
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
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
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
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
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ecx
	movl %ebx, %ebx
	cmpl %ecx, %ebx
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
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %ebx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $0, %eax
	jne else154
	movl %ebx, %ebx
	jmp endif154
else154:
	movl %edx, %ecx
	movl %ecx, %ebx
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
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
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
	movl %edx, %ecx
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
	movl %ebx, %esi
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
	movl %esi, %ecx
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
	movl %ebx, %edx
	movl %ecx, %ebx
	movl %edx, %ecx
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
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %edx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $0, %eax
	jne else194
	movl %ebx, %ecx
	jmp endif194
else194:
	movl %edx, %ebx
	movl %ebx, %ecx
endif194:
	movl %ecx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
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
	movl %eax, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
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
	movl %ebx, %ecx
	jmp endif195
else195:
	movl -12(%ebp), %ebx
	call type_error
	movl %eax, %ebx
	addl $0, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ecx
endif195:
	movl %ecx, %ebx
	movl %ebx, %ecx
endif155:
	movl %ecx, %ebx
	movl %ebx, %ecx
endif115:
	movl %ecx, %ebx
	movl %ebx, %ecx
endif75:
	movl %ecx, %ebx
	movl %ebx, %ecx
endif35:
	movl %ecx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	call print_any
	addl $4, %esp
	movl $2, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else208
	call inject_int
	jmp endif208
else208:
	cmpl $1, %ebx
	jne else209
	call inject_bool
	jmp endif209
else209:
	cmpl $2, %ebx
	jne else210
	call inject_big
	jmp endif210
else210:
	cmpl $3, %ebx
	jne else211
	call inject_big
	jmp endif211
else211:
endif211:
endif210:
endif209:
endif208:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %esi
	movl $2, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else212
	call inject_int
	jmp endif212
else212:
	cmpl $1, %ebx
	jne else213
	call inject_bool
	jmp endif213
else213:
	cmpl $2, %ebx
	jne else214
	call inject_big
	jmp endif214
else214:
	cmpl $3, %ebx
	jne else215
	call inject_big
	jmp endif215
else215:
endif215:
endif214:
endif213:
endif212:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %esi
	movl %esi, %ebx
	pushl %ebx
	call tag
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else216
	call inject_int
	jmp endif216
else216:
	cmpl $1, %ebx
	jne else217
	call inject_bool
	jmp endif217
else217:
	cmpl $2, %ebx
	jne else218
	call inject_big
	jmp endif218
else218:
	cmpl $3, %ebx
	jne else219
	call inject_big
	jmp endif219
else219:
endif219:
endif218:
endif217:
endif216:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl $0, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else220
	call inject_int
	jmp endif220
else220:
	cmpl $1, %ebx
	jne else221
	call inject_bool
	jmp endif221
else221:
	cmpl $2, %ebx
	jne else222
	call inject_big
	jmp endif222
else222:
	cmpl $3, %ebx
	jne else223
	call inject_big
	jmp endif223
else223:
endif223:
endif222:
endif221:
endif220:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %ecx, %ebx
	movl %edx, %ecx
	cmpl %ebx, %ecx
	jne else224
	movl $1, %ebx
	jmp endif224
else224:
	movl $0, %ebx
endif224:
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else225
	call inject_int
	jmp endif225
else225:
	cmpl $1, %ebx
	jne else226
	call inject_bool
	jmp endif226
else226:
	cmpl $2, %ebx
	jne else227
	call inject_big
	jmp endif227
else227:
	cmpl $3, %ebx
	jne else228
	call inject_big
	jmp endif228
else228:
endif228:
endif227:
endif226:
endif225:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %esi
	movl %esi, %ebx
	pushl %ebx
	call tag
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else229
	call inject_int
	jmp endif229
else229:
	cmpl $1, %ebx
	jne else230
	call inject_bool
	jmp endif230
else230:
	cmpl $2, %ebx
	jne else231
	call inject_big
	jmp endif231
else231:
	cmpl $3, %ebx
	jne else232
	call inject_big
	jmp endif232
else232:
endif232:
endif231:
endif230:
endif229:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl $0, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else233
	call inject_int
	jmp endif233
else233:
	cmpl $1, %ebx
	jne else234
	call inject_bool
	jmp endif234
else234:
	cmpl $2, %ebx
	jne else235
	call inject_big
	jmp endif235
else235:
	cmpl $3, %ebx
	jne else236
	call inject_big
	jmp endif236
else236:
endif236:
endif235:
endif234:
endif233:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %ecx, %ebx
	movl %edx, %ecx
	cmpl %ebx, %ecx
	jne else237
	movl $1, %ebx
	jmp endif237
else237:
	movl $0, %ebx
endif237:
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else238
	call inject_int
	jmp endif238
else238:
	cmpl $1, %ebx
	jne else239
	call inject_bool
	jmp endif239
else239:
	cmpl $2, %ebx
	jne else240
	call inject_big
	jmp endif240
else240:
	cmpl $3, %ebx
	jne else241
	call inject_big
	jmp endif241
else241:
endif241:
endif240:
endif239:
endif238:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %esi, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $0, %eax
	jne else242
	movl %ebx, %ecx
	jmp endif242
else242:
	movl %edx, %ebx
	movl %ebx, %ecx
endif242:
	movl %ecx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $1, %eax
	jne else243
	movl %esi, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else244
	call project_int
	jmp endif244
else244:
	cmpl $1, %ebx
	jne else245
	call project_bool
	jmp endif245
else245:
	cmpl $2, %ebx
	jne else246
	call project_big
	jmp endif246
else246:
	cmpl $3, %ebx
	jne else247
	call project_big
	jmp endif247
else247:
endif247:
endif246:
endif245:
endif244:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %esi, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else248
	call project_int
	jmp endif248
else248:
	cmpl $1, %ebx
	jne else249
	call project_bool
	jmp endif249
else249:
	cmpl $2, %ebx
	jne else250
	call project_big
	jmp endif250
else250:
	cmpl $3, %ebx
	jne else251
	call project_big
	jmp endif251
else251:
endif251:
endif250:
endif249:
endif248:
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
	jne else252
	call inject_int
	jmp endif252
else252:
	cmpl $1, %ebx
	jne else253
	call inject_bool
	jmp endif253
else253:
	cmpl $2, %ebx
	jne else254
	call inject_big
	jmp endif254
else254:
	cmpl $3, %ebx
	jne else255
	call inject_big
	jmp endif255
else255:
endif255:
endif254:
endif253:
endif252:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	movl %ebx, %ecx
	jmp endif243
else243:
	movl %esi, %ebx
	pushl %ebx
	call tag
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else256
	call inject_int
	jmp endif256
else256:
	cmpl $1, %ebx
	jne else257
	call inject_bool
	jmp endif257
else257:
	cmpl $2, %ebx
	jne else258
	call inject_big
	jmp endif258
else258:
	cmpl $3, %ebx
	jne else259
	call inject_big
	jmp endif259
else259:
endif259:
endif258:
endif257:
endif256:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl $0, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else260
	call inject_int
	jmp endif260
else260:
	cmpl $1, %ebx
	jne else261
	call inject_bool
	jmp endif261
else261:
	cmpl $2, %ebx
	jne else262
	call inject_big
	jmp endif262
else262:
	cmpl $3, %ebx
	jne else263
	call inject_big
	jmp endif263
else263:
endif263:
endif262:
endif261:
endif260:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %edx, %ebx
	movl %ebx, %ecx
	cmpl %ebx, %ecx
	jne else264
	movl $1, %ebx
	jmp endif264
else264:
	movl $0, %ebx
endif264:
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else265
	call inject_int
	jmp endif265
else265:
	cmpl $1, %ebx
	jne else266
	call inject_bool
	jmp endif266
else266:
	cmpl $2, %ebx
	jne else267
	call inject_big
	jmp endif267
else267:
	cmpl $3, %ebx
	jne else268
	call inject_big
	jmp endif268
else268:
endif268:
endif267:
endif266:
endif265:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %esi, %ebx
	pushl %ebx
	call tag
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else269
	call inject_int
	jmp endif269
else269:
	cmpl $1, %ebx
	jne else270
	call inject_bool
	jmp endif270
else270:
	cmpl $2, %ebx
	jne else271
	call inject_big
	jmp endif271
else271:
	cmpl $3, %ebx
	jne else272
	call inject_big
	jmp endif272
else272:
endif272:
endif271:
endif270:
endif269:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl $1, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else273
	call inject_int
	jmp endif273
else273:
	cmpl $1, %ebx
	jne else274
	call inject_bool
	jmp endif274
else274:
	cmpl $2, %ebx
	jne else275
	call inject_big
	jmp endif275
else275:
	cmpl $3, %ebx
	jne else276
	call inject_big
	jmp endif276
else276:
endif276:
endif275:
endif274:
endif273:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %edx, %ecx
	movl %ebx, %ebx
	cmpl %ecx, %ebx
	jne else277
	movl $1, %ecx
	jmp endif277
else277:
	movl $0, %ecx
endif277:
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else278
	call inject_int
	jmp endif278
else278:
	cmpl $1, %ebx
	jne else279
	call inject_bool
	jmp endif279
else279:
	cmpl $2, %ebx
	jne else280
	call inject_big
	jmp endif280
else280:
	cmpl $3, %ebx
	jne else281
	call inject_big
	jmp endif281
else281:
endif281:
endif280:
endif279:
endif278:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %edx, %ecx
	pushl %ecx
	call is_true
	addl $4, %esp
	cmpl $0, %eax
	jne else282
	movl %ecx, %ebx
	jmp endif282
else282:
	movl %ecx, %ebx
	movl %ebx, %ebx
endif282:
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $1, %eax
	jne else283
	movl %esi, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else284
	call project_int
	jmp endif284
else284:
	cmpl $1, %ebx
	jne else285
	call project_bool
	jmp endif285
else285:
	cmpl $2, %ebx
	jne else286
	call project_big
	jmp endif286
else286:
	cmpl $3, %ebx
	jne else287
	call project_big
	jmp endif287
else287:
endif287:
endif286:
endif285:
endif284:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %esi, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else288
	call project_int
	jmp endif288
else288:
	cmpl $1, %ebx
	jne else289
	call project_bool
	jmp endif289
else289:
	cmpl $2, %ebx
	jne else290
	call project_big
	jmp endif290
else290:
	cmpl $3, %ebx
	jne else291
	call project_big
	jmp endif291
else291:
endif291:
endif290:
endif289:
endif288:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ebx
	movl %ecx, %ebx
	movl %ebx, %ecx
	addl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else292
	call inject_int
	jmp endif292
else292:
	cmpl $1, %ebx
	jne else293
	call inject_bool
	jmp endif293
else293:
	cmpl $2, %ebx
	jne else294
	call inject_big
	jmp endif294
else294:
	cmpl $3, %ebx
	jne else295
	call inject_big
	jmp endif295
else295:
endif295:
endif294:
endif293:
endif292:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
	jmp endif283
else283:
	movl %esi, %ebx
	pushl %ebx
	call tag
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else296
	call inject_int
	jmp endif296
else296:
	cmpl $1, %ebx
	jne else297
	call inject_bool
	jmp endif297
else297:
	cmpl $2, %ebx
	jne else298
	call inject_big
	jmp endif298
else298:
	cmpl $3, %ebx
	jne else299
	call inject_big
	jmp endif299
else299:
endif299:
endif298:
endif297:
endif296:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl $1, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else300
	call inject_int
	jmp endif300
else300:
	cmpl $1, %ebx
	jne else301
	call inject_bool
	jmp endif301
else301:
	cmpl $2, %ebx
	jne else302
	call inject_big
	jmp endif302
else302:
	cmpl $3, %ebx
	jne else303
	call inject_big
	jmp endif303
else303:
endif303:
endif302:
endif301:
endif300:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %ecx, %ebx
	movl %edx, %ecx
	cmpl %ebx, %ecx
	jne else304
	movl $1, %ebx
	jmp endif304
else304:
	movl $0, %ebx
endif304:
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else305
	call inject_int
	jmp endif305
else305:
	cmpl $1, %ebx
	jne else306
	call inject_bool
	jmp endif306
else306:
	cmpl $2, %ebx
	jne else307
	call inject_big
	jmp endif307
else307:
	cmpl $3, %ebx
	jne else308
	call inject_big
	jmp endif308
else308:
endif308:
endif307:
endif306:
endif305:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %esi, %ebx
	pushl %ebx
	call tag
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else309
	call inject_int
	jmp endif309
else309:
	cmpl $1, %ebx
	jne else310
	call inject_bool
	jmp endif310
else310:
	cmpl $2, %ebx
	jne else311
	call inject_big
	jmp endif311
else311:
	cmpl $3, %ebx
	jne else312
	call inject_big
	jmp endif312
else312:
endif312:
endif311:
endif310:
endif309:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl $0, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else313
	call inject_int
	jmp endif313
else313:
	cmpl $1, %ebx
	jne else314
	call inject_bool
	jmp endif314
else314:
	cmpl $2, %ebx
	jne else315
	call inject_big
	jmp endif315
else315:
	cmpl $3, %ebx
	jne else316
	call inject_big
	jmp endif316
else316:
endif316:
endif315:
endif314:
endif313:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ecx, %ebx
	movl %ebx, %ecx
	cmpl %ebx, %ecx
	jne else317
	movl $1, %ecx
	jmp endif317
else317:
	movl $0, %ecx
endif317:
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else318
	call inject_int
	jmp endif318
else318:
	cmpl $1, %ebx
	jne else319
	call inject_bool
	jmp endif319
else319:
	cmpl $2, %ebx
	jne else320
	call inject_big
	jmp endif320
else320:
	cmpl $3, %ebx
	jne else321
	call inject_big
	jmp endif321
else321:
endif321:
endif320:
endif319:
endif318:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %edx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $0, %eax
	jne else322
	movl %ebx, %ebx
	jmp endif322
else322:
	movl %ebx, %ebx
	movl %ebx, %ebx
endif322:
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $1, %eax
	jne else323
	movl %esi, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else324
	call project_int
	jmp endif324
else324:
	cmpl $1, %ebx
	jne else325
	call project_bool
	jmp endif325
else325:
	cmpl $2, %ebx
	jne else326
	call project_big
	jmp endif326
else326:
	cmpl $3, %ebx
	jne else327
	call project_big
	jmp endif327
else327:
endif327:
endif326:
endif325:
endif324:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %esi, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else328
	call project_int
	jmp endif328
else328:
	cmpl $1, %ebx
	jne else329
	call project_bool
	jmp endif329
else329:
	cmpl $2, %ebx
	jne else330
	call project_big
	jmp endif330
else330:
	cmpl $3, %ebx
	jne else331
	call project_big
	jmp endif331
else331:
endif331:
endif330:
endif329:
endif328:
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
	jne else332
	call inject_int
	jmp endif332
else332:
	cmpl $1, %ebx
	jne else333
	call inject_bool
	jmp endif333
else333:
	cmpl $2, %ebx
	jne else334
	call inject_big
	jmp endif334
else334:
	cmpl $3, %ebx
	jne else335
	call inject_big
	jmp endif335
else335:
endif335:
endif334:
endif333:
endif332:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ecx
	jmp endif323
else323:
	movl %esi, %ebx
	pushl %ebx
	call tag
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else336
	call inject_int
	jmp endif336
else336:
	cmpl $1, %ebx
	jne else337
	call inject_bool
	jmp endif337
else337:
	cmpl $2, %ebx
	jne else338
	call inject_big
	jmp endif338
else338:
	cmpl $3, %ebx
	jne else339
	call inject_big
	jmp endif339
else339:
endif339:
endif338:
endif337:
endif336:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl $1, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else340
	call inject_int
	jmp endif340
else340:
	cmpl $1, %ebx
	jne else341
	call inject_bool
	jmp endif341
else341:
	cmpl $2, %ebx
	jne else342
	call inject_big
	jmp endif342
else342:
	cmpl $3, %ebx
	jne else343
	call inject_big
	jmp endif343
else343:
endif343:
endif342:
endif341:
endif340:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %ecx, %ebx
	movl %edx, %ecx
	cmpl %ebx, %ecx
	jne else344
	movl $1, %ebx
	jmp endif344
else344:
	movl $0, %ebx
endif344:
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else345
	call inject_int
	jmp endif345
else345:
	cmpl $1, %ebx
	jne else346
	call inject_bool
	jmp endif346
else346:
	cmpl $2, %ebx
	jne else347
	call inject_big
	jmp endif347
else347:
	cmpl $3, %ebx
	jne else348
	call inject_big
	jmp endif348
else348:
endif348:
endif347:
endif346:
endif345:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %esi
	movl %esi, %ebx
	pushl %ebx
	call tag
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else349
	call inject_int
	jmp endif349
else349:
	cmpl $1, %ebx
	jne else350
	call inject_bool
	jmp endif350
else350:
	cmpl $2, %ebx
	jne else351
	call inject_big
	jmp endif351
else351:
	cmpl $3, %ebx
	jne else352
	call inject_big
	jmp endif352
else352:
endif352:
endif351:
endif350:
endif349:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %esi
	movl $1, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else353
	call inject_int
	jmp endif353
else353:
	cmpl $1, %ebx
	jne else354
	call inject_bool
	jmp endif354
else354:
	cmpl $2, %ebx
	jne else355
	call inject_big
	jmp endif355
else355:
	cmpl $3, %ebx
	jne else356
	call inject_big
	jmp endif356
else356:
endif356:
endif355:
endif354:
endif353:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %esi, %ecx
	movl %edx, %ebx
	cmpl %ecx, %ebx
	jne else357
	movl $1, %ebx
	jmp endif357
else357:
	movl $0, %ebx
endif357:
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else358
	call inject_int
	jmp endif358
else358:
	cmpl $1, %ebx
	jne else359
	call inject_bool
	jmp endif359
else359:
	cmpl $2, %ebx
	jne else360
	call inject_big
	jmp endif360
else360:
	cmpl $3, %ebx
	jne else361
	call inject_big
	jmp endif361
else361:
endif361:
endif360:
endif359:
endif358:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %esi, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $0, %eax
	jne else362
	movl %ebx, %ebx
	jmp endif362
else362:
	movl %edx, %ecx
	movl %ecx, %ebx
endif362:
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $1, %eax
	jne else363
	movl %esi, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else364
	call project_int
	jmp endif364
else364:
	cmpl $1, %ebx
	jne else365
	call project_bool
	jmp endif365
else365:
	cmpl $2, %ebx
	jne else366
	call project_big
	jmp endif366
else366:
	cmpl $3, %ebx
	jne else367
	call project_big
	jmp endif367
else367:
endif367:
endif366:
endif365:
endif364:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %esi, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else368
	call project_int
	jmp endif368
else368:
	cmpl $1, %ebx
	jne else369
	call project_bool
	jmp endif369
else369:
	cmpl $2, %ebx
	jne else370
	call project_big
	jmp endif370
else370:
	cmpl $3, %ebx
	jne else371
	call project_big
	jmp endif371
else371:
endif371:
endif370:
endif369:
endif368:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %edx, %ebx
	movl %ebx, %ecx
	addl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else372
	call inject_int
	jmp endif372
else372:
	cmpl $1, %ebx
	jne else373
	call inject_bool
	jmp endif373
else373:
	cmpl $2, %ebx
	jne else374
	call inject_big
	jmp endif374
else374:
	cmpl $3, %ebx
	jne else375
	call inject_big
	jmp endif375
else375:
endif375:
endif374:
endif373:
endif372:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	movl %ebx, %ecx
	jmp endif363
else363:
	movl %esi, %ebx
	pushl %ebx
	call tag
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else376
	call inject_int
	jmp endif376
else376:
	cmpl $1, %ebx
	jne else377
	call inject_bool
	jmp endif377
else377:
	cmpl $2, %ebx
	jne else378
	call inject_big
	jmp endif378
else378:
	cmpl $3, %ebx
	jne else379
	call inject_big
	jmp endif379
else379:
endif379:
endif378:
endif377:
endif376:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl $3, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else380
	call inject_int
	jmp endif380
else380:
	cmpl $1, %ebx
	jne else381
	call inject_bool
	jmp endif381
else381:
	cmpl $2, %ebx
	jne else382
	call inject_big
	jmp endif382
else382:
	cmpl $3, %ebx
	jne else383
	call inject_big
	jmp endif383
else383:
endif383:
endif382:
endif381:
endif380:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %ecx, %ebx
	movl %edx, %ecx
	cmpl %ebx, %ecx
	jne else384
	movl $1, %ebx
	jmp endif384
else384:
	movl $0, %ebx
endif384:
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else385
	call inject_int
	jmp endif385
else385:
	cmpl $1, %ebx
	jne else386
	call inject_bool
	jmp endif386
else386:
	cmpl $2, %ebx
	jne else387
	call inject_big
	jmp endif387
else387:
	cmpl $3, %ebx
	jne else388
	call inject_big
	jmp endif388
else388:
endif388:
endif387:
endif386:
endif385:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %esi
	movl %esi, %ebx
	pushl %ebx
	call tag
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else389
	call inject_int
	jmp endif389
else389:
	cmpl $1, %ebx
	jne else390
	call inject_bool
	jmp endif390
else390:
	cmpl $2, %ebx
	jne else391
	call inject_big
	jmp endif391
else391:
	cmpl $3, %ebx
	jne else392
	call inject_big
	jmp endif392
else392:
endif392:
endif391:
endif390:
endif389:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl $3, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else393
	call inject_int
	jmp endif393
else393:
	cmpl $1, %ebx
	jne else394
	call inject_bool
	jmp endif394
else394:
	cmpl $2, %ebx
	jne else395
	call inject_big
	jmp endif395
else395:
	cmpl $3, %ebx
	jne else396
	call inject_big
	jmp endif396
else396:
endif396:
endif395:
endif394:
endif393:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %edx, %ecx
	movl %edx, %ebx
	cmpl %ecx, %ebx
	jne else397
	movl $1, %ebx
	jmp endif397
else397:
	movl $0, %ebx
endif397:
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else398
	call inject_int
	jmp endif398
else398:
	cmpl $1, %ebx
	jne else399
	call inject_bool
	jmp endif399
else399:
	cmpl $2, %ebx
	jne else400
	call inject_big
	jmp endif400
else400:
	cmpl $3, %ebx
	jne else401
	call inject_big
	jmp endif401
else401:
endif401:
endif400:
endif399:
endif398:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %esi, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $0, %eax
	jne else402
	movl %ebx, %ecx
	jmp endif402
else402:
	movl %edx, %ebx
	movl %ebx, %ecx
endif402:
	movl %ecx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $1, %eax
	jne else403
	movl %esi, %ebx
	pushl %ebx
	movl $3, %ebx
	cmpl $0, %ebx
	jne else404
	call project_int
	jmp endif404
else404:
	cmpl $1, %ebx
	jne else405
	call project_bool
	jmp endif405
else405:
	cmpl $2, %ebx
	jne else406
	call project_big
	jmp endif406
else406:
	cmpl $3, %ebx
	jne else407
	call project_big
	jmp endif407
else407:
endif407:
endif406:
endif405:
endif404:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %esi, %ebx
	pushl %ebx
	movl $3, %ebx
	cmpl $0, %ebx
	jne else408
	call project_int
	jmp endif408
else408:
	cmpl $1, %ebx
	jne else409
	call project_bool
	jmp endif409
else409:
	cmpl $2, %ebx
	jne else410
	call project_big
	jmp endif410
else410:
	cmpl $3, %ebx
	jne else411
	call project_big
	jmp endif411
else411:
endif411:
endif410:
endif409:
endif408:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %edx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	pushl %ecx
	call add
	addl $8, %esp
	movl %eax, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $3, %ebx
	cmpl $0, %ebx
	jne else412
	call inject_int
	jmp endif412
else412:
	cmpl $1, %ebx
	jne else413
	call inject_bool
	jmp endif413
else413:
	cmpl $2, %ebx
	jne else414
	call inject_big
	jmp endif414
else414:
	cmpl $3, %ebx
	jne else415
	call inject_big
	jmp endif415
else415:
endif415:
endif414:
endif413:
endif412:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ecx
	jmp endif403
else403:
	movl -12(%ebp), %ebx
	call type_error
	movl %eax, %ebx
	addl $0, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ecx
endif403:
	movl %ecx, %ebx
	movl %ebx, %ecx
endif363:
	movl %ecx, %ebx
	movl %ebx, %ecx
endif323:
	movl %ecx, %ebx
	movl %ebx, %ebx
endif283:
	movl %ebx, %ebx
	movl %ebx, %ecx
endif243:
	movl %ecx, %ebx
	movl %ebx, %esi
	movl $2, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else416
	call inject_int
	jmp endif416
else416:
	cmpl $1, %ebx
	jne else417
	call inject_bool
	jmp endif417
else417:
	cmpl $2, %ebx
	jne else418
	call inject_big
	jmp endif418
else418:
	cmpl $3, %ebx
	jne else419
	call inject_big
	jmp endif419
else419:
endif419:
endif418:
endif417:
endif416:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	call tag
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else420
	call inject_int
	jmp endif420
else420:
	cmpl $1, %ebx
	jne else421
	call inject_bool
	jmp endif421
else421:
	cmpl $2, %ebx
	jne else422
	call inject_big
	jmp endif422
else422:
	cmpl $3, %ebx
	jne else423
	call inject_big
	jmp endif423
else423:
endif423:
endif422:
endif421:
endif420:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl $0, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else424
	call inject_int
	jmp endif424
else424:
	cmpl $1, %ebx
	jne else425
	call inject_bool
	jmp endif425
else425:
	cmpl $2, %ebx
	jne else426
	call inject_big
	jmp endif426
else426:
	cmpl $3, %ebx
	jne else427
	call inject_big
	jmp endif427
else427:
endif427:
endif426:
endif425:
endif424:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ebx, %ecx
	movl %ecx, %ebx
	cmpl %ecx, %ebx
	jne else428
	movl $1, %ecx
	jmp endif428
else428:
	movl $0, %ecx
endif428:
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else429
	call inject_int
	jmp endif429
else429:
	cmpl $1, %ebx
	jne else430
	call inject_bool
	jmp endif430
else430:
	cmpl $2, %ebx
	jne else431
	call inject_big
	jmp endif431
else431:
	cmpl $3, %ebx
	jne else432
	call inject_big
	jmp endif432
else432:
endif432:
endif431:
endif430:
endif429:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $1, %eax
	jne else433
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else434
	call project_int
	jmp endif434
else434:
	cmpl $1, %ebx
	jne else435
	call project_bool
	jmp endif435
else435:
	cmpl $2, %ebx
	jne else436
	call project_big
	jmp endif436
else436:
	cmpl $3, %ebx
	jne else437
	call project_big
	jmp endif437
else437:
endif437:
endif436:
endif435:
endif434:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ecx
	negl %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else438
	call inject_int
	jmp endif438
else438:
	cmpl $1, %ebx
	jne else439
	call inject_bool
	jmp endif439
else439:
	cmpl $2, %ebx
	jne else440
	call inject_big
	jmp endif440
else440:
	cmpl $3, %ebx
	jne else441
	call inject_big
	jmp endif441
else441:
endif441:
endif440:
endif439:
endif438:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	movl %ebx, %ebx
	jmp endif433
else433:
	movl %ecx, %ebx
	pushl %ebx
	call tag
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else442
	call inject_int
	jmp endif442
else442:
	cmpl $1, %ebx
	jne else443
	call inject_bool
	jmp endif443
else443:
	cmpl $2, %ebx
	jne else444
	call inject_big
	jmp endif444
else444:
	cmpl $3, %ebx
	jne else445
	call inject_big
	jmp endif445
else445:
endif445:
endif444:
endif443:
endif442:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl $1, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else446
	call inject_int
	jmp endif446
else446:
	cmpl $1, %ebx
	jne else447
	call inject_bool
	jmp endif447
else447:
	cmpl $2, %ebx
	jne else448
	call inject_big
	jmp endif448
else448:
	cmpl $3, %ebx
	jne else449
	call inject_big
	jmp endif449
else449:
endif449:
endif448:
endif447:
endif446:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ecx
	movl %ebx, %ebx
	cmpl %ecx, %ebx
	jne else450
	movl $1, %ecx
	jmp endif450
else450:
	movl $0, %ecx
endif450:
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else451
	call inject_int
	jmp endif451
else451:
	cmpl $1, %ebx
	jne else452
	call inject_bool
	jmp endif452
else452:
	cmpl $2, %ebx
	jne else453
	call inject_big
	jmp endif453
else453:
	cmpl $3, %ebx
	jne else454
	call inject_big
	jmp endif454
else454:
endif454:
endif453:
endif452:
endif451:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $1, %eax
	jne else455
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else456
	call project_int
	jmp endif456
else456:
	cmpl $1, %ebx
	jne else457
	call project_bool
	jmp endif457
else457:
	cmpl $2, %ebx
	jne else458
	call project_big
	jmp endif458
else458:
	cmpl $3, %ebx
	jne else459
	call project_big
	jmp endif459
else459:
endif459:
endif458:
endif457:
endif456:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	negl %ebx
	movl %ebx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else460
	call inject_int
	jmp endif460
else460:
	cmpl $1, %ebx
	jne else461
	call inject_bool
	jmp endif461
else461:
	cmpl $2, %ebx
	jne else462
	call inject_big
	jmp endif462
else462:
	cmpl $3, %ebx
	jne else463
	call inject_big
	jmp endif463
else463:
endif463:
endif462:
endif461:
endif460:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	jmp endif455
else455:
	movl -12(%ebp), %ebx
	call type_error
	movl %eax, %ecx
	addl $0, %esp
	movl %ecx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
endif455:
	movl %ebx, %ecx
	movl %ecx, %ebx
endif433:
	movl %ebx, %ebx
	movl %ebx, %edx
	movl %esi, %ebx
	pushl %ebx
	call tag
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else464
	call inject_int
	jmp endif464
else464:
	cmpl $1, %ebx
	jne else465
	call inject_bool
	jmp endif465
else465:
	cmpl $2, %ebx
	jne else466
	call inject_big
	jmp endif466
else466:
	cmpl $3, %ebx
	jne else467
	call inject_big
	jmp endif467
else467:
endif467:
endif466:
endif465:
endif464:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl $0, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else468
	call inject_int
	jmp endif468
else468:
	cmpl $1, %ebx
	jne else469
	call inject_bool
	jmp endif469
else469:
	cmpl $2, %ebx
	jne else470
	call inject_big
	jmp endif470
else470:
	cmpl $3, %ebx
	jne else471
	call inject_big
	jmp endif471
else471:
endif471:
endif470:
endif469:
endif468:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ecx, %ebx
	movl %ebx, %ecx
	cmpl %ebx, %ecx
	jne else472
	movl $1, %ecx
	jmp endif472
else472:
	movl $0, %ecx
endif472:
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else473
	call inject_int
	jmp endif473
else473:
	cmpl $1, %ebx
	jne else474
	call inject_bool
	jmp endif474
else474:
	cmpl $2, %ebx
	jne else475
	call inject_big
	jmp endif475
else475:
	cmpl $3, %ebx
	jne else476
	call inject_big
	jmp endif476
else476:
endif476:
endif475:
endif474:
endif473:
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
	jne else477
	call inject_int
	jmp endif477
else477:
	cmpl $1, %ebx
	jne else478
	call inject_bool
	jmp endif478
else478:
	cmpl $2, %ebx
	jne else479
	call inject_big
	jmp endif479
else479:
	cmpl $3, %ebx
	jne else480
	call inject_big
	jmp endif480
else480:
endif480:
endif479:
endif478:
endif477:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl $0, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else481
	call inject_int
	jmp endif481
else481:
	cmpl $1, %ebx
	jne else482
	call inject_bool
	jmp endif482
else482:
	cmpl $2, %ebx
	jne else483
	call inject_big
	jmp endif483
else483:
	cmpl $3, %ebx
	jne else484
	call inject_big
	jmp endif484
else484:
endif484:
endif483:
endif482:
endif481:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ecx, %ebx
	movl %ebx, %ecx
	cmpl %ebx, %ecx
	jne else485
	movl $1, %ebx
	jmp endif485
else485:
	movl $0, %ebx
endif485:
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else486
	call inject_int
	jmp endif486
else486:
	cmpl $1, %ebx
	jne else487
	call inject_bool
	jmp endif487
else487:
	cmpl $2, %ebx
	jne else488
	call inject_big
	jmp endif488
else488:
	cmpl $3, %ebx
	jne else489
	call inject_big
	jmp endif489
else489:
endif489:
endif488:
endif487:
endif486:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %edx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $0, %eax
	jne else490
	movl %ebx, %ecx
	jmp endif490
else490:
	movl %ecx, %ebx
	movl %ebx, %ecx
endif490:
	movl %ecx, %ebx
	movl %ebx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $1, %eax
	jne else491
	movl %esi, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else492
	call project_int
	jmp endif492
else492:
	cmpl $1, %ebx
	jne else493
	call project_bool
	jmp endif493
else493:
	cmpl $2, %ebx
	jne else494
	call project_big
	jmp endif494
else494:
	cmpl $3, %ebx
	jne else495
	call project_big
	jmp endif495
else495:
endif495:
endif494:
endif493:
endif492:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %edx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else496
	call project_int
	jmp endif496
else496:
	cmpl $1, %ebx
	jne else497
	call project_bool
	jmp endif497
else497:
	cmpl $2, %ebx
	jne else498
	call project_big
	jmp endif498
else498:
	cmpl $3, %ebx
	jne else499
	call project_big
	jmp endif499
else499:
endif499:
endif498:
endif497:
endif496:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ecx
	movl %ebx, %ebx
	addl %ecx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else500
	call inject_int
	jmp endif500
else500:
	cmpl $1, %ebx
	jne else501
	call inject_bool
	jmp endif501
else501:
	cmpl $2, %ebx
	jne else502
	call inject_big
	jmp endif502
else502:
	cmpl $3, %ebx
	jne else503
	call inject_big
	jmp endif503
else503:
endif503:
endif502:
endif501:
endif500:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ecx
	jmp endif491
else491:
	movl %esi, %ebx
	pushl %ebx
	call tag
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else504
	call inject_int
	jmp endif504
else504:
	cmpl $1, %ebx
	jne else505
	call inject_bool
	jmp endif505
else505:
	cmpl $2, %ebx
	jne else506
	call inject_big
	jmp endif506
else506:
	cmpl $3, %ebx
	jne else507
	call inject_big
	jmp endif507
else507:
endif507:
endif506:
endif505:
endif504:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl $0, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else508
	call inject_int
	jmp endif508
else508:
	cmpl $1, %ebx
	jne else509
	call inject_bool
	jmp endif509
else509:
	cmpl $2, %ebx
	jne else510
	call inject_big
	jmp endif510
else510:
	cmpl $3, %ebx
	jne else511
	call inject_big
	jmp endif511
else511:
endif511:
endif510:
endif509:
endif508:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %ebx, %ecx
	movl %edx, %ebx
	cmpl %ecx, %ebx
	jne else512
	movl $1, %ecx
	jmp endif512
else512:
	movl $0, %ecx
endif512:
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else513
	call inject_int
	jmp endif513
else513:
	cmpl $1, %ebx
	jne else514
	call inject_bool
	jmp endif514
else514:
	cmpl $2, %ebx
	jne else515
	call inject_big
	jmp endif515
else515:
	cmpl $3, %ebx
	jne else516
	call inject_big
	jmp endif516
else516:
endif516:
endif515:
endif514:
endif513:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %edx, %ebx
	pushl %ebx
	call tag
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else517
	call inject_int
	jmp endif517
else517:
	cmpl $1, %ebx
	jne else518
	call inject_bool
	jmp endif518
else518:
	cmpl $2, %ebx
	jne else519
	call inject_big
	jmp endif519
else519:
	cmpl $3, %ebx
	jne else520
	call inject_big
	jmp endif520
else520:
endif520:
endif519:
endif518:
endif517:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl $1, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else521
	call inject_int
	jmp endif521
else521:
	cmpl $1, %ebx
	jne else522
	call inject_bool
	jmp endif522
else522:
	cmpl $2, %ebx
	jne else523
	call inject_big
	jmp endif523
else523:
	cmpl $3, %ebx
	jne else524
	call inject_big
	jmp endif524
else524:
endif524:
endif523:
endif522:
endif521:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	movl %ebx, %ecx
	cmpl %ebx, %ecx
	jne else525
	movl $1, %ebx
	jmp endif525
else525:
	movl $0, %ebx
endif525:
	movl %ebx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else526
	call inject_int
	jmp endif526
else526:
	cmpl $1, %ebx
	jne else527
	call inject_bool
	jmp endif527
else527:
	cmpl $2, %ebx
	jne else528
	call inject_big
	jmp endif528
else528:
	cmpl $3, %ebx
	jne else529
	call inject_big
	jmp endif529
else529:
endif529:
endif528:
endif527:
endif526:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %edx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $0, %eax
	jne else530
	movl %ebx, %ecx
	jmp endif530
else530:
	movl %ebx, %ebx
	movl %ebx, %ecx
endif530:
	movl %ecx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $1, %eax
	jne else531
	movl %esi, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else532
	call project_int
	jmp endif532
else532:
	cmpl $1, %ebx
	jne else533
	call project_bool
	jmp endif533
else533:
	cmpl $2, %ebx
	jne else534
	call project_big
	jmp endif534
else534:
	cmpl $3, %ebx
	jne else535
	call project_big
	jmp endif535
else535:
endif535:
endif534:
endif533:
endif532:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %edx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else536
	call project_int
	jmp endif536
else536:
	cmpl $1, %ebx
	jne else537
	call project_bool
	jmp endif537
else537:
	cmpl $2, %ebx
	jne else538
	call project_big
	jmp endif538
else538:
	cmpl $3, %ebx
	jne else539
	call project_big
	jmp endif539
else539:
endif539:
endif538:
endif537:
endif536:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ecx, %ecx
	movl %ebx, %ebx
	addl %ecx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else540
	call inject_int
	jmp endif540
else540:
	cmpl $1, %ebx
	jne else541
	call inject_bool
	jmp endif541
else541:
	cmpl $2, %ebx
	jne else542
	call inject_big
	jmp endif542
else542:
	cmpl $3, %ebx
	jne else543
	call inject_big
	jmp endif543
else543:
endif543:
endif542:
endif541:
endif540:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ecx
	jmp endif531
else531:
	movl %esi, %ebx
	pushl %ebx
	call tag
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else544
	call inject_int
	jmp endif544
else544:
	cmpl $1, %ebx
	jne else545
	call inject_bool
	jmp endif545
else545:
	cmpl $2, %ebx
	jne else546
	call inject_big
	jmp endif546
else546:
	cmpl $3, %ebx
	jne else547
	call inject_big
	jmp endif547
else547:
endif547:
endif546:
endif545:
endif544:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl $1, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else548
	call inject_int
	jmp endif548
else548:
	cmpl $1, %ebx
	jne else549
	call inject_bool
	jmp endif549
else549:
	cmpl $2, %ebx
	jne else550
	call inject_big
	jmp endif550
else550:
	cmpl $3, %ebx
	jne else551
	call inject_big
	jmp endif551
else551:
endif551:
endif550:
endif549:
endif548:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ecx, %ecx
	cmpl %ebx, %ecx
	jne else552
	movl $1, %ebx
	jmp endif552
else552:
	movl $0, %ebx
endif552:
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else553
	call inject_int
	jmp endif553
else553:
	cmpl $1, %ebx
	jne else554
	call inject_bool
	jmp endif554
else554:
	cmpl $2, %ebx
	jne else555
	call inject_big
	jmp endif555
else555:
	cmpl $3, %ebx
	jne else556
	call inject_big
	jmp endif556
else556:
endif556:
endif555:
endif554:
endif553:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %esi
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
	jne else557
	call inject_int
	jmp endif557
else557:
	cmpl $1, %ebx
	jne else558
	call inject_bool
	jmp endif558
else558:
	cmpl $2, %ebx
	jne else559
	call inject_big
	jmp endif559
else559:
	cmpl $3, %ebx
	jne else560
	call inject_big
	jmp endif560
else560:
endif560:
endif559:
endif558:
endif557:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl $0, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else561
	call inject_int
	jmp endif561
else561:
	cmpl $1, %ebx
	jne else562
	call inject_bool
	jmp endif562
else562:
	cmpl $2, %ebx
	jne else563
	call inject_big
	jmp endif563
else563:
	cmpl $3, %ebx
	jne else564
	call inject_big
	jmp endif564
else564:
endif564:
endif563:
endif562:
endif561:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %edx, %ecx
	movl %ebx, %ebx
	cmpl %ecx, %ebx
	jne else565
	movl $1, %ebx
	jmp endif565
else565:
	movl $0, %ebx
endif565:
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else566
	call inject_int
	jmp endif566
else566:
	cmpl $1, %ebx
	jne else567
	call inject_bool
	jmp endif567
else567:
	cmpl $2, %ebx
	jne else568
	call inject_big
	jmp endif568
else568:
	cmpl $3, %ebx
	jne else569
	call inject_big
	jmp endif569
else569:
endif569:
endif568:
endif567:
endif566:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %esi, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $0, %eax
	jne else570
	movl %ebx, %ecx
	jmp endif570
else570:
	movl %edx, %ebx
	movl %ebx, %ecx
endif570:
	movl %ecx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $1, %eax
	jne else571
	movl %esi, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else572
	call project_int
	jmp endif572
else572:
	cmpl $1, %ebx
	jne else573
	call project_bool
	jmp endif573
else573:
	cmpl $2, %ebx
	jne else574
	call project_big
	jmp endif574
else574:
	cmpl $3, %ebx
	jne else575
	call project_big
	jmp endif575
else575:
endif575:
endif574:
endif573:
endif572:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %edx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else576
	call project_int
	jmp endif576
else576:
	cmpl $1, %ebx
	jne else577
	call project_bool
	jmp endif577
else577:
	cmpl $2, %ebx
	jne else578
	call project_big
	jmp endif578
else578:
	cmpl $3, %ebx
	jne else579
	call project_big
	jmp endif579
else579:
endif579:
endif578:
endif577:
endif576:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ecx, %ebx
	addl %ebx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else580
	call inject_int
	jmp endif580
else580:
	cmpl $1, %ebx
	jne else581
	call inject_bool
	jmp endif581
else581:
	cmpl $2, %ebx
	jne else582
	call inject_big
	jmp endif582
else582:
	cmpl $3, %ebx
	jne else583
	call inject_big
	jmp endif583
else583:
endif583:
endif582:
endif581:
endif580:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	movl %ebx, %ecx
	jmp endif571
else571:
	movl %esi, %ebx
	pushl %ebx
	call tag
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else584
	call inject_int
	jmp endif584
else584:
	cmpl $1, %ebx
	jne else585
	call inject_bool
	jmp endif585
else585:
	cmpl $2, %ebx
	jne else586
	call inject_big
	jmp endif586
else586:
	cmpl $3, %ebx
	jne else587
	call inject_big
	jmp endif587
else587:
endif587:
endif586:
endif585:
endif584:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl $1, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else588
	call inject_int
	jmp endif588
else588:
	cmpl $1, %ebx
	jne else589
	call inject_bool
	jmp endif589
else589:
	cmpl $2, %ebx
	jne else590
	call inject_big
	jmp endif590
else590:
	cmpl $3, %ebx
	jne else591
	call inject_big
	jmp endif591
else591:
endif591:
endif590:
endif589:
endif588:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ecx, %ebx
	movl %ebx, %ecx
	cmpl %ebx, %ecx
	jne else592
	movl $1, %ecx
	jmp endif592
else592:
	movl $0, %ecx
endif592:
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else593
	call inject_int
	jmp endif593
else593:
	cmpl $1, %ebx
	jne else594
	call inject_bool
	jmp endif594
else594:
	cmpl $2, %ebx
	jne else595
	call inject_big
	jmp endif595
else595:
	cmpl $3, %ebx
	jne else596
	call inject_big
	jmp endif596
else596:
endif596:
endif595:
endif594:
endif593:
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
	jne else597
	call inject_int
	jmp endif597
else597:
	cmpl $1, %ebx
	jne else598
	call inject_bool
	jmp endif598
else598:
	cmpl $2, %ebx
	jne else599
	call inject_big
	jmp endif599
else599:
	cmpl $3, %ebx
	jne else600
	call inject_big
	jmp endif600
else600:
endif600:
endif599:
endif598:
endif597:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl $1, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else601
	call inject_int
	jmp endif601
else601:
	cmpl $1, %ebx
	jne else602
	call inject_bool
	jmp endif602
else602:
	cmpl $2, %ebx
	jne else603
	call inject_big
	jmp endif603
else603:
	cmpl $3, %ebx
	jne else604
	call inject_big
	jmp endif604
else604:
endif604:
endif603:
endif602:
endif601:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ecx, %ecx
	movl %ebx, %ebx
	cmpl %ecx, %ebx
	jne else605
	movl $1, %ebx
	jmp endif605
else605:
	movl $0, %ebx
endif605:
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else606
	call inject_int
	jmp endif606
else606:
	cmpl $1, %ebx
	jne else607
	call inject_bool
	jmp endif607
else607:
	cmpl $2, %ebx
	jne else608
	call inject_big
	jmp endif608
else608:
	cmpl $3, %ebx
	jne else609
	call inject_big
	jmp endif609
else609:
endif609:
endif608:
endif607:
endif606:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %ecx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $0, %eax
	jne else610
	movl %ebx, %ecx
	jmp endif610
else610:
	movl %edx, %ebx
	movl %ebx, %ecx
endif610:
	movl %ecx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $1, %eax
	jne else611
	movl %esi, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else612
	call project_int
	jmp endif612
else612:
	cmpl $1, %ebx
	jne else613
	call project_bool
	jmp endif613
else613:
	cmpl $2, %ebx
	jne else614
	call project_big
	jmp endif614
else614:
	cmpl $3, %ebx
	jne else615
	call project_big
	jmp endif615
else615:
endif615:
endif614:
endif613:
endif612:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %esi
	movl %edx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else616
	call project_int
	jmp endif616
else616:
	cmpl $1, %ebx
	jne else617
	call project_bool
	jmp endif617
else617:
	cmpl $2, %ebx
	jne else618
	call project_big
	jmp endif618
else618:
	cmpl $3, %ebx
	jne else619
	call project_big
	jmp endif619
else619:
endif619:
endif618:
endif617:
endif616:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %esi, %ecx
	movl %edx, %ebx
	addl %ecx, %ebx
	movl %ebx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else620
	call inject_int
	jmp endif620
else620:
	cmpl $1, %ebx
	jne else621
	call inject_bool
	jmp endif621
else621:
	cmpl $2, %ebx
	jne else622
	call inject_big
	jmp endif622
else622:
	cmpl $3, %ebx
	jne else623
	call inject_big
	jmp endif623
else623:
endif623:
endif622:
endif621:
endif620:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ecx
	jmp endif611
else611:
	movl %esi, %ebx
	pushl %ebx
	call tag
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else624
	call inject_int
	jmp endif624
else624:
	cmpl $1, %ebx
	jne else625
	call inject_bool
	jmp endif625
else625:
	cmpl $2, %ebx
	jne else626
	call inject_big
	jmp endif626
else626:
	cmpl $3, %ebx
	jne else627
	call inject_big
	jmp endif627
else627:
endif627:
endif626:
endif625:
endif624:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl $3, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else628
	call inject_int
	jmp endif628
else628:
	cmpl $1, %ebx
	jne else629
	call inject_bool
	jmp endif629
else629:
	cmpl $2, %ebx
	jne else630
	call inject_big
	jmp endif630
else630:
	cmpl $3, %ebx
	jne else631
	call inject_big
	jmp endif631
else631:
endif631:
endif630:
endif629:
endif628:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ecx, %ecx
	movl %ebx, %ebx
	cmpl %ecx, %ebx
	jne else632
	movl $1, %ecx
	jmp endif632
else632:
	movl $0, %ecx
endif632:
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else633
	call inject_int
	jmp endif633
else633:
	cmpl $1, %ebx
	jne else634
	call inject_bool
	jmp endif634
else634:
	cmpl $2, %ebx
	jne else635
	call inject_big
	jmp endif635
else635:
	cmpl $3, %ebx
	jne else636
	call inject_big
	jmp endif636
else636:
endif636:
endif635:
endif634:
endif633:
	movl %eax, %ebx
	addl $4, %esp
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
	jne else637
	call inject_int
	jmp endif637
else637:
	cmpl $1, %ebx
	jne else638
	call inject_bool
	jmp endif638
else638:
	cmpl $2, %ebx
	jne else639
	call inject_big
	jmp endif639
else639:
	cmpl $3, %ebx
	jne else640
	call inject_big
	jmp endif640
else640:
endif640:
endif639:
endif638:
endif637:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl $3, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else641
	call inject_int
	jmp endif641
else641:
	cmpl $1, %ebx
	jne else642
	call inject_bool
	jmp endif642
else642:
	cmpl $2, %ebx
	jne else643
	call inject_big
	jmp endif643
else643:
	cmpl $3, %ebx
	jne else644
	call inject_big
	jmp endif644
else644:
endif644:
endif643:
endif642:
endif641:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %edx, %ecx
	movl %ecx, %ebx
	cmpl %ecx, %ebx
	jne else645
	movl $1, %ecx
	jmp endif645
else645:
	movl $0, %ecx
endif645:
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else646
	call inject_int
	jmp endif646
else646:
	cmpl $1, %ebx
	jne else647
	call inject_bool
	jmp endif647
else647:
	cmpl $2, %ebx
	jne else648
	call inject_big
	jmp endif648
else648:
	cmpl $3, %ebx
	jne else649
	call inject_big
	jmp endif649
else649:
endif649:
endif648:
endif647:
endif646:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %edx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $0, %eax
	jne else650
	movl %ebx, %ebx
	jmp endif650
else650:
	movl %ecx, %ebx
	movl %ebx, %ebx
endif650:
	movl %ebx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $1, %eax
	jne else651
	movl %esi, %ebx
	pushl %ebx
	movl $3, %ebx
	cmpl $0, %ebx
	jne else652
	call project_int
	jmp endif652
else652:
	cmpl $1, %ebx
	jne else653
	call project_bool
	jmp endif653
else653:
	cmpl $2, %ebx
	jne else654
	call project_big
	jmp endif654
else654:
	cmpl $3, %ebx
	jne else655
	call project_big
	jmp endif655
else655:
endif655:
endif654:
endif653:
endif652:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %esi
	movl %edx, %ebx
	pushl %ebx
	movl $3, %ebx
	cmpl $0, %ebx
	jne else656
	call project_int
	jmp endif656
else656:
	cmpl $1, %ebx
	jne else657
	call project_bool
	jmp endif657
else657:
	cmpl $2, %ebx
	jne else658
	call project_big
	jmp endif658
else658:
	cmpl $3, %ebx
	jne else659
	call project_big
	jmp endif659
else659:
endif659:
endif658:
endif657:
endif656:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %esi, %ecx
	movl %edx, %ebx
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
	jne else660
	call inject_int
	jmp endif660
else660:
	cmpl $1, %ebx
	jne else661
	call inject_bool
	jmp endif661
else661:
	cmpl $2, %ebx
	jne else662
	call inject_big
	jmp endif662
else662:
	cmpl $3, %ebx
	jne else663
	call inject_big
	jmp endif663
else663:
endif663:
endif662:
endif661:
endif660:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	movl %ebx, %ecx
	jmp endif651
else651:
	movl -12(%ebp), %ebx
	call type_error
	movl %eax, %ebx
	addl $0, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ecx
endif651:
	movl %ecx, %ebx
	movl %ebx, %ecx
endif611:
	movl %ecx, %ebx
	movl %ebx, %ecx
endif571:
	movl %ecx, %ebx
	movl %ebx, %ecx
endif531:
	movl %ecx, %ebx
	movl %ebx, %ecx
endif491:
	movl %ecx, %ebx
	movl %ebx, -8(%ebp)
	movl $3, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else664
	call inject_int
	jmp endif664
else664:
	cmpl $1, %ebx
	jne else665
	call inject_bool
	jmp endif665
else665:
	cmpl $2, %ebx
	jne else666
	call inject_big
	jmp endif666
else666:
	cmpl $3, %ebx
	jne else667
	call inject_big
	jmp endif667
else667:
endif667:
endif666:
endif665:
endif664:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %edx
	movl $2, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else668
	call inject_int
	jmp endif668
else668:
	cmpl $1, %ebx
	jne else669
	call inject_bool
	jmp endif669
else669:
	cmpl $2, %ebx
	jne else670
	call inject_big
	jmp endif670
else670:
	cmpl $3, %ebx
	jne else671
	call inject_big
	jmp endif671
else671:
endif671:
endif670:
endif669:
endif668:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %esi
	movl $3, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else672
	call inject_int
	jmp endif672
else672:
	cmpl $1, %ebx
	jne else673
	call inject_bool
	jmp endif673
else673:
	cmpl $2, %ebx
	jne else674
	call inject_big
	jmp endif674
else674:
	cmpl $3, %ebx
	jne else675
	call inject_big
	jmp endif675
else675:
endif675:
endif674:
endif673:
endif672:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
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
	jne else676
	call inject_int
	jmp endif676
else676:
	cmpl $1, %ebx
	jne else677
	call inject_bool
	jmp endif677
else677:
	cmpl $2, %ebx
	jne else678
	call inject_big
	jmp endif678
else678:
	cmpl $3, %ebx
	jne else679
	call inject_big
	jmp endif679
else679:
endif679:
endif678:
endif677:
endif676:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %esi
	movl $0, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else680
	call inject_int
	jmp endif680
else680:
	cmpl $1, %ebx
	jne else681
	call inject_bool
	jmp endif681
else681:
	cmpl $2, %ebx
	jne else682
	call inject_big
	jmp endif682
else682:
	cmpl $3, %ebx
	jne else683
	call inject_big
	jmp endif683
else683:
endif683:
endif682:
endif681:
endif680:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %esi, %ecx
	movl %edx, %ebx
	cmpl %ecx, %ebx
	jne else684
	movl $1, %ebx
	jmp endif684
else684:
	movl $0, %ebx
endif684:
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else685
	call inject_int
	jmp endif685
else685:
	cmpl $1, %ebx
	jne else686
	call inject_bool
	jmp endif686
else686:
	cmpl $2, %ebx
	jne else687
	call inject_big
	jmp endif687
else687:
	cmpl $3, %ebx
	jne else688
	call inject_big
	jmp endif688
else688:
endif688:
endif687:
endif686:
endif685:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $1, %eax
	jne else689
	movl %edx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else690
	call project_int
	jmp endif690
else690:
	cmpl $1, %ebx
	jne else691
	call project_bool
	jmp endif691
else691:
	cmpl $2, %ebx
	jne else692
	call project_big
	jmp endif692
else692:
	cmpl $3, %ebx
	jne else693
	call project_big
	jmp endif693
else693:
endif693:
endif692:
endif691:
endif690:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	negl %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else694
	call inject_int
	jmp endif694
else694:
	cmpl $1, %ebx
	jne else695
	call inject_bool
	jmp endif695
else695:
	cmpl $2, %ebx
	jne else696
	call inject_big
	jmp endif696
else696:
	cmpl $3, %ebx
	jne else697
	call inject_big
	jmp endif697
else697:
endif697:
endif696:
endif695:
endif694:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ecx
	jmp endif689
else689:
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
	jne else698
	call inject_int
	jmp endif698
else698:
	cmpl $1, %ebx
	jne else699
	call inject_bool
	jmp endif699
else699:
	cmpl $2, %ebx
	jne else700
	call inject_big
	jmp endif700
else700:
	cmpl $3, %ebx
	jne else701
	call inject_big
	jmp endif701
else701:
endif701:
endif700:
endif699:
endif698:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl $1, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else702
	call inject_int
	jmp endif702
else702:
	cmpl $1, %ebx
	jne else703
	call inject_bool
	jmp endif703
else703:
	cmpl $2, %ebx
	jne else704
	call inject_big
	jmp endif704
else704:
	cmpl $3, %ebx
	jne else705
	call inject_big
	jmp endif705
else705:
endif705:
endif704:
endif703:
endif702:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %edx, %ecx
	movl %edx, %ebx
	cmpl %ecx, %ebx
	jne else706
	movl $1, %ebx
	jmp endif706
else706:
	movl $0, %ebx
endif706:
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else707
	call inject_int
	jmp endif707
else707:
	cmpl $1, %ebx
	jne else708
	call inject_bool
	jmp endif708
else708:
	cmpl $2, %ebx
	jne else709
	call inject_big
	jmp endif709
else709:
	cmpl $3, %ebx
	jne else710
	call inject_big
	jmp endif710
else710:
endif710:
endif709:
endif708:
endif707:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $1, %eax
	jne else711
	movl %edx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else712
	call project_int
	jmp endif712
else712:
	cmpl $1, %ebx
	jne else713
	call project_bool
	jmp endif713
else713:
	cmpl $2, %ebx
	jne else714
	call project_big
	jmp endif714
else714:
	cmpl $3, %ebx
	jne else715
	call project_big
	jmp endif715
else715:
endif715:
endif714:
endif713:
endif712:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	negl %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else716
	call inject_int
	jmp endif716
else716:
	cmpl $1, %ebx
	jne else717
	call inject_bool
	jmp endif717
else717:
	cmpl $2, %ebx
	jne else718
	call inject_big
	jmp endif718
else718:
	cmpl $3, %ebx
	jne else719
	call inject_big
	jmp endif719
else719:
endif719:
endif718:
endif717:
endif716:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ebx
	movl %ebx, %ebx
	movl %ebx, %ecx
	jmp endif711
else711:
	movl -12(%ebp), %ebx
	call type_error
	movl %eax, %ebx
	addl $0, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ecx
endif711:
	movl %ecx, %ebx
	movl %ebx, %ecx
endif689:
	movl %ecx, %ebx
	movl %ebx, %edx
	movl %esi, %ebx
	pushl %ebx
	call tag
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else720
	call inject_int
	jmp endif720
else720:
	cmpl $1, %ebx
	jne else721
	call inject_bool
	jmp endif721
else721:
	cmpl $2, %ebx
	jne else722
	call inject_big
	jmp endif722
else722:
	cmpl $3, %ebx
	jne else723
	call inject_big
	jmp endif723
else723:
endif723:
endif722:
endif721:
endif720:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl $0, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else724
	call inject_int
	jmp endif724
else724:
	cmpl $1, %ebx
	jne else725
	call inject_bool
	jmp endif725
else725:
	cmpl $2, %ebx
	jne else726
	call inject_big
	jmp endif726
else726:
	cmpl $3, %ebx
	jne else727
	call inject_big
	jmp endif727
else727:
endif727:
endif726:
endif725:
endif724:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %edx, %ecx
	movl %edx, %ebx
	cmpl %ecx, %ebx
	jne else728
	movl $1, %ebx
	jmp endif728
else728:
	movl $0, %ebx
endif728:
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else729
	call inject_int
	jmp endif729
else729:
	cmpl $1, %ebx
	jne else730
	call inject_bool
	jmp endif730
else730:
	cmpl $2, %ebx
	jne else731
	call inject_big
	jmp endif731
else731:
	cmpl $3, %ebx
	jne else732
	call inject_big
	jmp endif732
else732:
endif732:
endif731:
endif730:
endif729:
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
	jne else733
	call inject_int
	jmp endif733
else733:
	cmpl $1, %ebx
	jne else734
	call inject_bool
	jmp endif734
else734:
	cmpl $2, %ebx
	jne else735
	call inject_big
	jmp endif735
else735:
	cmpl $3, %ebx
	jne else736
	call inject_big
	jmp endif736
else736:
endif736:
endif735:
endif734:
endif733:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %esi
	movl $0, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else737
	call inject_int
	jmp endif737
else737:
	cmpl $1, %ebx
	jne else738
	call inject_bool
	jmp endif738
else738:
	cmpl $2, %ebx
	jne else739
	call inject_big
	jmp endif739
else739:
	cmpl $3, %ebx
	jne else740
	call inject_big
	jmp endif740
else740:
endif740:
endif739:
endif738:
endif737:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %esi, %ecx
	movl %edx, %ebx
	cmpl %ecx, %ebx
	jne else741
	movl $1, %ebx
	jmp endif741
else741:
	movl $0, %ebx
endif741:
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else742
	call inject_int
	jmp endif742
else742:
	cmpl $1, %ebx
	jne else743
	call inject_bool
	jmp endif743
else743:
	cmpl $2, %ebx
	jne else744
	call inject_big
	jmp endif744
else744:
	cmpl $3, %ebx
	jne else745
	call inject_big
	jmp endif745
else745:
endif745:
endif744:
endif743:
endif742:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %edx, %ecx
	pushl %ecx
	call is_true
	addl $4, %esp
	cmpl $0, %eax
	jne else746
	movl %ecx, %ebx
	jmp endif746
else746:
	movl %edx, %ecx
	movl %ecx, %ebx
endif746:
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $1, %eax
	jne else747
	movl %esi, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else748
	call project_int
	jmp endif748
else748:
	cmpl $1, %ebx
	jne else749
	call project_bool
	jmp endif749
else749:
	cmpl $2, %ebx
	jne else750
	call project_big
	jmp endif750
else750:
	cmpl $3, %ebx
	jne else751
	call project_big
	jmp endif751
else751:
endif751:
endif750:
endif749:
endif748:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %edx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else752
	call project_int
	jmp endif752
else752:
	cmpl $1, %ebx
	jne else753
	call project_bool
	jmp endif753
else753:
	cmpl $2, %ebx
	jne else754
	call project_big
	jmp endif754
else754:
	cmpl $3, %ebx
	jne else755
	call project_big
	jmp endif755
else755:
endif755:
endif754:
endif753:
endif752:
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
	jne else756
	call inject_int
	jmp endif756
else756:
	cmpl $1, %ebx
	jne else757
	call inject_bool
	jmp endif757
else757:
	cmpl $2, %ebx
	jne else758
	call inject_big
	jmp endif758
else758:
	cmpl $3, %ebx
	jne else759
	call inject_big
	jmp endif759
else759:
endif759:
endif758:
endif757:
endif756:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	jmp endif747
else747:
	movl %esi, %ebx
	pushl %ebx
	call tag
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else760
	call inject_int
	jmp endif760
else760:
	cmpl $1, %ebx
	jne else761
	call inject_bool
	jmp endif761
else761:
	cmpl $2, %ebx
	jne else762
	call inject_big
	jmp endif762
else762:
	cmpl $3, %ebx
	jne else763
	call inject_big
	jmp endif763
else763:
endif763:
endif762:
endif761:
endif760:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl $0, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else764
	call inject_int
	jmp endif764
else764:
	cmpl $1, %ebx
	jne else765
	call inject_bool
	jmp endif765
else765:
	cmpl $2, %ebx
	jne else766
	call inject_big
	jmp endif766
else766:
	cmpl $3, %ebx
	jne else767
	call inject_big
	jmp endif767
else767:
endif767:
endif766:
endif765:
endif764:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %edx, %ecx
	movl %ebx, %ebx
	cmpl %ecx, %ebx
	jne else768
	movl $1, %ecx
	jmp endif768
else768:
	movl $0, %ecx
endif768:
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else769
	call inject_int
	jmp endif769
else769:
	cmpl $1, %ebx
	jne else770
	call inject_bool
	jmp endif770
else770:
	cmpl $2, %ebx
	jne else771
	call inject_big
	jmp endif771
else771:
	cmpl $3, %ebx
	jne else772
	call inject_big
	jmp endif772
else772:
endif772:
endif771:
endif770:
endif769:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
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
	jne else773
	call inject_int
	jmp endif773
else773:
	cmpl $1, %ebx
	jne else774
	call inject_bool
	jmp endif774
else774:
	cmpl $2, %ebx
	jne else775
	call inject_big
	jmp endif775
else775:
	cmpl $3, %ebx
	jne else776
	call inject_big
	jmp endif776
else776:
endif776:
endif775:
endif774:
endif773:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl $1, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else777
	call inject_int
	jmp endif777
else777:
	cmpl $1, %ebx
	jne else778
	call inject_bool
	jmp endif778
else778:
	cmpl $2, %ebx
	jne else779
	call inject_big
	jmp endif779
else779:
	cmpl $3, %ebx
	jne else780
	call inject_big
	jmp endif780
else780:
endif780:
endif779:
endif778:
endif777:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %ecx, %ebx
	movl %edx, %ecx
	cmpl %ebx, %ecx
	jne else781
	movl $1, %ebx
	jmp endif781
else781:
	movl $0, %ebx
endif781:
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else782
	call inject_int
	jmp endif782
else782:
	cmpl $1, %ebx
	jne else783
	call inject_bool
	jmp endif783
else783:
	cmpl $2, %ebx
	jne else784
	call inject_big
	jmp endif784
else784:
	cmpl $3, %ebx
	jne else785
	call inject_big
	jmp endif785
else785:
endif785:
endif784:
endif783:
endif782:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %ebx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $0, %eax
	jne else786
	movl %ebx, %ecx
	jmp endif786
else786:
	movl %edx, %ebx
	movl %ebx, %ecx
endif786:
	movl %ecx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $1, %eax
	jne else787
	movl %esi, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else788
	call project_int
	jmp endif788
else788:
	cmpl $1, %ebx
	jne else789
	call project_bool
	jmp endif789
else789:
	cmpl $2, %ebx
	jne else790
	call project_big
	jmp endif790
else790:
	cmpl $3, %ebx
	jne else791
	call project_big
	jmp endif791
else791:
endif791:
endif790:
endif789:
endif788:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %edx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else792
	call project_int
	jmp endif792
else792:
	cmpl $1, %ebx
	jne else793
	call project_bool
	jmp endif793
else793:
	cmpl $2, %ebx
	jne else794
	call project_big
	jmp endif794
else794:
	cmpl $3, %ebx
	jne else795
	call project_big
	jmp endif795
else795:
endif795:
endif794:
endif793:
endif792:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %edx, %ebx
	movl %ecx, %ebx
	addl %ebx, %ebx
	movl %ebx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else796
	call inject_int
	jmp endif796
else796:
	cmpl $1, %ebx
	jne else797
	call inject_bool
	jmp endif797
else797:
	cmpl $2, %ebx
	jne else798
	call inject_big
	jmp endif798
else798:
	cmpl $3, %ebx
	jne else799
	call inject_big
	jmp endif799
else799:
endif799:
endif798:
endif797:
endif796:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	jmp endif787
else787:
	movl %esi, %ebx
	pushl %ebx
	call tag
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else800
	call inject_int
	jmp endif800
else800:
	cmpl $1, %ebx
	jne else801
	call inject_bool
	jmp endif801
else801:
	cmpl $2, %ebx
	jne else802
	call inject_big
	jmp endif802
else802:
	cmpl $3, %ebx
	jne else803
	call inject_big
	jmp endif803
else803:
endif803:
endif802:
endif801:
endif800:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl $1, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else804
	call inject_int
	jmp endif804
else804:
	cmpl $1, %ebx
	jne else805
	call inject_bool
	jmp endif805
else805:
	cmpl $2, %ebx
	jne else806
	call inject_big
	jmp endif806
else806:
	cmpl $3, %ebx
	jne else807
	call inject_big
	jmp endif807
else807:
endif807:
endif806:
endif805:
endif804:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	movl %ebx, %ecx
	cmpl %ebx, %ecx
	jne else808
	movl $1, %ecx
	jmp endif808
else808:
	movl $0, %ecx
endif808:
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else809
	call inject_int
	jmp endif809
else809:
	cmpl $1, %ebx
	jne else810
	call inject_bool
	jmp endif810
else810:
	cmpl $2, %ebx
	jne else811
	call inject_big
	jmp endif811
else811:
	cmpl $3, %ebx
	jne else812
	call inject_big
	jmp endif812
else812:
endif812:
endif811:
endif810:
endif809:
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
	jne else813
	call inject_int
	jmp endif813
else813:
	cmpl $1, %ebx
	jne else814
	call inject_bool
	jmp endif814
else814:
	cmpl $2, %ebx
	jne else815
	call inject_big
	jmp endif815
else815:
	cmpl $3, %ebx
	jne else816
	call inject_big
	jmp endif816
else816:
endif816:
endif815:
endif814:
endif813:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl $0, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else817
	call inject_int
	jmp endif817
else817:
	cmpl $1, %ebx
	jne else818
	call inject_bool
	jmp endif818
else818:
	cmpl $2, %ebx
	jne else819
	call inject_big
	jmp endif819
else819:
	cmpl $3, %ebx
	jne else820
	call inject_big
	jmp endif820
else820:
endif820:
endif819:
endif818:
endif817:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ecx, %ecx
	movl %ebx, %ebx
	cmpl %ecx, %ebx
	jne else821
	movl $1, %ebx
	jmp endif821
else821:
	movl $0, %ebx
endif821:
	movl %ebx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else822
	call inject_int
	jmp endif822
else822:
	cmpl $1, %ebx
	jne else823
	call inject_bool
	jmp endif823
else823:
	cmpl $2, %ebx
	jne else824
	call inject_big
	jmp endif824
else824:
	cmpl $3, %ebx
	jne else825
	call inject_big
	jmp endif825
else825:
endif825:
endif824:
endif823:
endif822:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ecx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $0, %eax
	jne else826
	movl %ebx, %ebx
	jmp endif826
else826:
	movl %ebx, %ecx
	movl %ecx, %ebx
endif826:
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $1, %eax
	jne else827
	movl %esi, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else828
	call project_int
	jmp endif828
else828:
	cmpl $1, %ebx
	jne else829
	call project_bool
	jmp endif829
else829:
	cmpl $2, %ebx
	jne else830
	call project_big
	jmp endif830
else830:
	cmpl $3, %ebx
	jne else831
	call project_big
	jmp endif831
else831:
endif831:
endif830:
endif829:
endif828:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %edx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else832
	call project_int
	jmp endif832
else832:
	cmpl $1, %ebx
	jne else833
	call project_bool
	jmp endif833
else833:
	cmpl $2, %ebx
	jne else834
	call project_big
	jmp endif834
else834:
	cmpl $3, %ebx
	jne else835
	call project_big
	jmp endif835
else835:
endif835:
endif834:
endif833:
endif832:
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
	jne else836
	call inject_int
	jmp endif836
else836:
	cmpl $1, %ebx
	jne else837
	call inject_bool
	jmp endif837
else837:
	cmpl $2, %ebx
	jne else838
	call inject_big
	jmp endif838
else838:
	cmpl $3, %ebx
	jne else839
	call inject_big
	jmp endif839
else839:
endif839:
endif838:
endif837:
endif836:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	jmp endif827
else827:
	movl %esi, %ebx
	pushl %ebx
	call tag
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else840
	call inject_int
	jmp endif840
else840:
	cmpl $1, %ebx
	jne else841
	call inject_bool
	jmp endif841
else841:
	cmpl $2, %ebx
	jne else842
	call inject_big
	jmp endif842
else842:
	cmpl $3, %ebx
	jne else843
	call inject_big
	jmp endif843
else843:
endif843:
endif842:
endif841:
endif840:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl $1, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else844
	call inject_int
	jmp endif844
else844:
	cmpl $1, %ebx
	jne else845
	call inject_bool
	jmp endif845
else845:
	cmpl $2, %ebx
	jne else846
	call inject_big
	jmp endif846
else846:
	cmpl $3, %ebx
	jne else847
	call inject_big
	jmp endif847
else847:
endif847:
endif846:
endif845:
endif844:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	movl %ebx, %ecx
	cmpl %ebx, %ecx
	jne else848
	movl $1, %ecx
	jmp endif848
else848:
	movl $0, %ecx
endif848:
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else849
	call inject_int
	jmp endif849
else849:
	cmpl $1, %ebx
	jne else850
	call inject_bool
	jmp endif850
else850:
	cmpl $2, %ebx
	jne else851
	call inject_big
	jmp endif851
else851:
	cmpl $3, %ebx
	jne else852
	call inject_big
	jmp endif852
else852:
endif852:
endif851:
endif850:
endif849:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
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
	jne else853
	call inject_int
	jmp endif853
else853:
	cmpl $1, %ebx
	jne else854
	call inject_bool
	jmp endif854
else854:
	cmpl $2, %ebx
	jne else855
	call inject_big
	jmp endif855
else855:
	cmpl $3, %ebx
	jne else856
	call inject_big
	jmp endif856
else856:
endif856:
endif855:
endif854:
endif853:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl $1, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else857
	call inject_int
	jmp endif857
else857:
	cmpl $1, %ebx
	jne else858
	call inject_bool
	jmp endif858
else858:
	cmpl $2, %ebx
	jne else859
	call inject_big
	jmp endif859
else859:
	cmpl $3, %ebx
	jne else860
	call inject_big
	jmp endif860
else860:
endif860:
endif859:
endif858:
endif857:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %ebx, %ecx
	movl %edx, %ebx
	cmpl %ecx, %ebx
	jne else861
	movl $1, %ebx
	jmp endif861
else861:
	movl $0, %ebx
endif861:
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else862
	call inject_int
	jmp endif862
else862:
	cmpl $1, %ebx
	jne else863
	call inject_bool
	jmp endif863
else863:
	cmpl $2, %ebx
	jne else864
	call inject_big
	jmp endif864
else864:
	cmpl $3, %ebx
	jne else865
	call inject_big
	jmp endif865
else865:
endif865:
endif864:
endif863:
endif862:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %ebx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $0, %eax
	jne else866
	movl %ebx, %ecx
	jmp endif866
else866:
	movl %edx, %ebx
	movl %ebx, %ecx
endif866:
	movl %ecx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $1, %eax
	jne else867
	movl %esi, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else868
	call project_int
	jmp endif868
else868:
	cmpl $1, %ebx
	jne else869
	call project_bool
	jmp endif869
else869:
	cmpl $2, %ebx
	jne else870
	call project_big
	jmp endif870
else870:
	cmpl $3, %ebx
	jne else871
	call project_big
	jmp endif871
else871:
endif871:
endif870:
endif869:
endif868:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %edx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else872
	call project_int
	jmp endif872
else872:
	cmpl $1, %ebx
	jne else873
	call project_bool
	jmp endif873
else873:
	cmpl $2, %ebx
	jne else874
	call project_big
	jmp endif874
else874:
	cmpl $3, %ebx
	jne else875
	call project_big
	jmp endif875
else875:
endif875:
endif874:
endif873:
endif872:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %edx, %ebx
	movl %ecx, %ebx
	addl %ebx, %ebx
	movl %ebx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else876
	call inject_int
	jmp endif876
else876:
	cmpl $1, %ebx
	jne else877
	call inject_bool
	jmp endif877
else877:
	cmpl $2, %ebx
	jne else878
	call inject_big
	jmp endif878
else878:
	cmpl $3, %ebx
	jne else879
	call inject_big
	jmp endif879
else879:
endif879:
endif878:
endif877:
endif876:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	jmp endif867
else867:
	movl %esi, %ebx
	pushl %ebx
	call tag
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else880
	call inject_int
	jmp endif880
else880:
	cmpl $1, %ebx
	jne else881
	call inject_bool
	jmp endif881
else881:
	cmpl $2, %ebx
	jne else882
	call inject_big
	jmp endif882
else882:
	cmpl $3, %ebx
	jne else883
	call inject_big
	jmp endif883
else883:
endif883:
endif882:
endif881:
endif880:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl $3, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else884
	call inject_int
	jmp endif884
else884:
	cmpl $1, %ebx
	jne else885
	call inject_bool
	jmp endif885
else885:
	cmpl $2, %ebx
	jne else886
	call inject_big
	jmp endif886
else886:
	cmpl $3, %ebx
	jne else887
	call inject_big
	jmp endif887
else887:
endif887:
endif886:
endif885:
endif884:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %ecx, %ebx
	movl %edx, %ecx
	cmpl %ebx, %ecx
	jne else888
	movl $1, %ebx
	jmp endif888
else888:
	movl $0, %ebx
endif888:
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else889
	call inject_int
	jmp endif889
else889:
	cmpl $1, %ebx
	jne else890
	call inject_bool
	jmp endif890
else890:
	cmpl $2, %ebx
	jne else891
	call inject_big
	jmp endif891
else891:
	cmpl $3, %ebx
	jne else892
	call inject_big
	jmp endif892
else892:
endif892:
endif891:
endif890:
endif889:
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
	jne else893
	call inject_int
	jmp endif893
else893:
	cmpl $1, %ebx
	jne else894
	call inject_bool
	jmp endif894
else894:
	cmpl $2, %ebx
	jne else895
	call inject_big
	jmp endif895
else895:
	cmpl $3, %ebx
	jne else896
	call inject_big
	jmp endif896
else896:
endif896:
endif895:
endif894:
endif893:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl $3, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else897
	call inject_int
	jmp endif897
else897:
	cmpl $1, %ebx
	jne else898
	call inject_bool
	jmp endif898
else898:
	cmpl $2, %ebx
	jne else899
	call inject_big
	jmp endif899
else899:
	cmpl $3, %ebx
	jne else900
	call inject_big
	jmp endif900
else900:
endif900:
endif899:
endif898:
endif897:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ecx
	movl %ebx, %ebx
	cmpl %ecx, %ebx
	jne else901
	movl $1, %ecx
	jmp endif901
else901:
	movl $0, %ecx
endif901:
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else902
	call inject_int
	jmp endif902
else902:
	cmpl $1, %ebx
	jne else903
	call inject_bool
	jmp endif903
else903:
	cmpl $2, %ebx
	jne else904
	call inject_big
	jmp endif904
else904:
	cmpl $3, %ebx
	jne else905
	call inject_big
	jmp endif905
else905:
endif905:
endif904:
endif903:
endif902:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ecx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $0, %eax
	jne else906
	movl %ebx, %ebx
	jmp endif906
else906:
	movl %ebx, %ebx
	movl %ebx, %ebx
endif906:
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $1, %eax
	jne else907
	movl %esi, %ebx
	pushl %ebx
	movl $3, %ebx
	cmpl $0, %ebx
	jne else908
	call project_int
	jmp endif908
else908:
	cmpl $1, %ebx
	jne else909
	call project_bool
	jmp endif909
else909:
	cmpl $2, %ebx
	jne else910
	call project_big
	jmp endif910
else910:
	cmpl $3, %ebx
	jne else911
	call project_big
	jmp endif911
else911:
endif911:
endif910:
endif909:
endif908:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %edx, %ebx
	pushl %ebx
	movl $3, %ebx
	cmpl $0, %ebx
	jne else912
	call project_int
	jmp endif912
else912:
	cmpl $1, %ebx
	jne else913
	call project_bool
	jmp endif913
else913:
	cmpl $2, %ebx
	jne else914
	call project_big
	jmp endif914
else914:
	cmpl $3, %ebx
	jne else915
	call project_big
	jmp endif915
else915:
endif915:
endif914:
endif913:
endif912:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	movl %ebx, %ecx
	pushl %ecx
	pushl %ebx
	call add
	addl $8, %esp
	movl %eax, %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $3, %ebx
	cmpl $0, %ebx
	jne else916
	call inject_int
	jmp endif916
else916:
	cmpl $1, %ebx
	jne else917
	call inject_bool
	jmp endif917
else917:
	cmpl $2, %ebx
	jne else918
	call inject_big
	jmp endif918
else918:
	cmpl $3, %ebx
	jne else919
	call inject_big
	jmp endif919
else919:
endif919:
endif918:
endif917:
endif916:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	jmp endif907
else907:
	movl -12(%ebp), %ebx
	call type_error
	movl %eax, %ecx
	addl $0, %esp
	movl %ecx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
endif907:
	movl %ebx, %ecx
	movl %ecx, %ebx
endif867:
	movl %ebx, %ecx
	movl %ecx, %ebx
endif827:
	movl %ebx, %ecx
	movl %ecx, %ebx
endif787:
	movl %ebx, %ecx
	movl %ecx, %ebx
endif747:
	movl %ebx, %ecx
	movl %ecx, %ebx
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
	jne else920
	call inject_int
	jmp endif920
else920:
	cmpl $1, %ebx
	jne else921
	call inject_bool
	jmp endif921
else921:
	cmpl $2, %ebx
	jne else922
	call inject_big
	jmp endif922
else922:
	cmpl $3, %ebx
	jne else923
	call inject_big
	jmp endif923
else923:
endif923:
endif922:
endif921:
endif920:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl $0, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else924
	call inject_int
	jmp endif924
else924:
	cmpl $1, %ebx
	jne else925
	call inject_bool
	jmp endif925
else925:
	cmpl $2, %ebx
	jne else926
	call inject_big
	jmp endif926
else926:
	cmpl $3, %ebx
	jne else927
	call inject_big
	jmp endif927
else927:
endif927:
endif926:
endif925:
endif924:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ecx
	movl %ebx, %ebx
	cmpl %ecx, %ebx
	jne else928
	movl $1, %ecx
	jmp endif928
else928:
	movl $0, %ecx
endif928:
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else929
	call inject_int
	jmp endif929
else929:
	cmpl $1, %ebx
	jne else930
	call inject_bool
	jmp endif930
else930:
	cmpl $2, %ebx
	jne else931
	call inject_big
	jmp endif931
else931:
	cmpl $3, %ebx
	jne else932
	call inject_big
	jmp endif932
else932:
endif932:
endif931:
endif930:
endif929:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ebx, %ebx
	pushl %ebx
	call tag
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else933
	call inject_int
	jmp endif933
else933:
	cmpl $1, %ebx
	jne else934
	call inject_bool
	jmp endif934
else934:
	cmpl $2, %ebx
	jne else935
	call inject_big
	jmp endif935
else935:
	cmpl $3, %ebx
	jne else936
	call inject_big
	jmp endif936
else936:
endif936:
endif935:
endif934:
endif933:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl $0, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else937
	call inject_int
	jmp endif937
else937:
	cmpl $1, %ebx
	jne else938
	call inject_bool
	jmp endif938
else938:
	cmpl $2, %ebx
	jne else939
	call inject_big
	jmp endif939
else939:
	cmpl $3, %ebx
	jne else940
	call inject_big
	jmp endif940
else940:
endif940:
endif939:
endif938:
endif937:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	movl %ebx, %ecx
	cmpl %ebx, %ecx
	jne else941
	movl $1, %ecx
	jmp endif941
else941:
	movl $0, %ecx
endif941:
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else942
	call inject_int
	jmp endif942
else942:
	cmpl $1, %ebx
	jne else943
	call inject_bool
	jmp endif943
else943:
	cmpl $2, %ebx
	jne else944
	call inject_big
	jmp endif944
else944:
	cmpl $3, %ebx
	jne else945
	call inject_big
	jmp endif945
else945:
endif945:
endif944:
endif943:
endif942:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ecx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $0, %eax
	jne else946
	movl %ebx, %ebx
	jmp endif946
else946:
	movl %ebx, %ecx
	movl %ecx, %ebx
endif946:
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $1, %eax
	jne else947
	movl %edx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else948
	call project_int
	jmp endif948
else948:
	cmpl $1, %ebx
	jne else949
	call project_bool
	jmp endif949
else949:
	cmpl $2, %ebx
	jne else950
	call project_big
	jmp endif950
else950:
	cmpl $3, %ebx
	jne else951
	call project_big
	jmp endif951
else951:
endif951:
endif950:
endif949:
endif948:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else952
	call project_int
	jmp endif952
else952:
	cmpl $1, %ebx
	jne else953
	call project_bool
	jmp endif953
else953:
	cmpl $2, %ebx
	jne else954
	call project_big
	jmp endif954
else954:
	cmpl $3, %ebx
	jne else955
	call project_big
	jmp endif955
else955:
endif955:
endif954:
endif953:
endif952:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %edx, %ebx
	movl %ecx, %ebx
	addl %ebx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else956
	call inject_int
	jmp endif956
else956:
	cmpl $1, %ebx
	jne else957
	call inject_bool
	jmp endif957
else957:
	cmpl $2, %ebx
	jne else958
	call inject_big
	jmp endif958
else958:
	cmpl $3, %ebx
	jne else959
	call inject_big
	jmp endif959
else959:
endif959:
endif958:
endif957:
endif956:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	movl %ebx, %ebx
	jmp endif947
else947:
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
	jne else960
	call inject_int
	jmp endif960
else960:
	cmpl $1, %ebx
	jne else961
	call inject_bool
	jmp endif961
else961:
	cmpl $2, %ebx
	jne else962
	call inject_big
	jmp endif962
else962:
	cmpl $3, %ebx
	jne else963
	call inject_big
	jmp endif963
else963:
endif963:
endif962:
endif961:
endif960:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %esi
	movl $0, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else964
	call inject_int
	jmp endif964
else964:
	cmpl $1, %ebx
	jne else965
	call inject_bool
	jmp endif965
else965:
	cmpl $2, %ebx
	jne else966
	call inject_big
	jmp endif966
else966:
	cmpl $3, %ebx
	jne else967
	call inject_big
	jmp endif967
else967:
endif967:
endif966:
endif965:
endif964:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %esi, %ecx
	movl %edx, %ebx
	cmpl %ecx, %ebx
	jne else968
	movl $1, %ebx
	jmp endif968
else968:
	movl $0, %ebx
endif968:
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else969
	call inject_int
	jmp endif969
else969:
	cmpl $1, %ebx
	jne else970
	call inject_bool
	jmp endif970
else970:
	cmpl $2, %ebx
	jne else971
	call inject_big
	jmp endif971
else971:
	cmpl $3, %ebx
	jne else972
	call inject_big
	jmp endif972
else972:
endif972:
endif971:
endif970:
endif969:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %ebx, %ebx
	pushl %ebx
	call tag
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else973
	call inject_int
	jmp endif973
else973:
	cmpl $1, %ebx
	jne else974
	call inject_bool
	jmp endif974
else974:
	cmpl $2, %ebx
	jne else975
	call inject_big
	jmp endif975
else975:
	cmpl $3, %ebx
	jne else976
	call inject_big
	jmp endif976
else976:
endif976:
endif975:
endif974:
endif973:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl $1, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else977
	call inject_int
	jmp endif977
else977:
	cmpl $1, %ebx
	jne else978
	call inject_bool
	jmp endif978
else978:
	cmpl $2, %ebx
	jne else979
	call inject_big
	jmp endif979
else979:
	cmpl $3, %ebx
	jne else980
	call inject_big
	jmp endif980
else980:
endif980:
endif979:
endif978:
endif977:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %ecx, %ebx
	movl %edx, %ecx
	cmpl %ebx, %ecx
	jne else981
	movl $1, %ebx
	jmp endif981
else981:
	movl $0, %ebx
endif981:
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else982
	call inject_int
	jmp endif982
else982:
	cmpl $1, %ebx
	jne else983
	call inject_bool
	jmp endif983
else983:
	cmpl $2, %ebx
	jne else984
	call inject_big
	jmp endif984
else984:
	cmpl $3, %ebx
	jne else985
	call inject_big
	jmp endif985
else985:
endif985:
endif984:
endif983:
endif982:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %edx, %ecx
	pushl %ecx
	call is_true
	addl $4, %esp
	cmpl $0, %eax
	jne else986
	movl %ecx, %ebx
	jmp endif986
else986:
	movl %edx, %ecx
	movl %ecx, %ebx
endif986:
	movl %ebx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $1, %eax
	jne else987
	movl %edx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else988
	call project_int
	jmp endif988
else988:
	cmpl $1, %ebx
	jne else989
	call project_bool
	jmp endif989
else989:
	cmpl $2, %ebx
	jne else990
	call project_big
	jmp endif990
else990:
	cmpl $3, %ebx
	jne else991
	call project_big
	jmp endif991
else991:
endif991:
endif990:
endif989:
endif988:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else992
	call project_int
	jmp endif992
else992:
	cmpl $1, %ebx
	jne else993
	call project_bool
	jmp endif993
else993:
	cmpl $2, %ebx
	jne else994
	call project_big
	jmp endif994
else994:
	cmpl $3, %ebx
	jne else995
	call project_big
	jmp endif995
else995:
endif995:
endif994:
endif993:
endif992:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ebx, %ecx
	movl %ecx, %ebx
	addl %ecx, %ebx
	movl %ebx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else996
	call inject_int
	jmp endif996
else996:
	cmpl $1, %ebx
	jne else997
	call inject_bool
	jmp endif997
else997:
	cmpl $2, %ebx
	jne else998
	call inject_big
	jmp endif998
else998:
	cmpl $3, %ebx
	jne else999
	call inject_big
	jmp endif999
else999:
endif999:
endif998:
endif997:
endif996:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
	jmp endif987
else987:
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
	jne else1000
	call inject_int
	jmp endif1000
else1000:
	cmpl $1, %ebx
	jne else1001
	call inject_bool
	jmp endif1001
else1001:
	cmpl $2, %ebx
	jne else1002
	call inject_big
	jmp endif1002
else1002:
	cmpl $3, %ebx
	jne else1003
	call inject_big
	jmp endif1003
else1003:
endif1003:
endif1002:
endif1001:
endif1000:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl $1, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1004
	call inject_int
	jmp endif1004
else1004:
	cmpl $1, %ebx
	jne else1005
	call inject_bool
	jmp endif1005
else1005:
	cmpl $2, %ebx
	jne else1006
	call inject_big
	jmp endif1006
else1006:
	cmpl $3, %ebx
	jne else1007
	call inject_big
	jmp endif1007
else1007:
endif1007:
endif1006:
endif1005:
endif1004:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %edx, %ecx
	movl %edx, %ebx
	cmpl %ecx, %ebx
	jne else1008
	movl $1, %ebx
	jmp endif1008
else1008:
	movl $0, %ebx
endif1008:
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else1009
	call inject_int
	jmp endif1009
else1009:
	cmpl $1, %ebx
	jne else1010
	call inject_bool
	jmp endif1010
else1010:
	cmpl $2, %ebx
	jne else1011
	call inject_big
	jmp endif1011
else1011:
	cmpl $3, %ebx
	jne else1012
	call inject_big
	jmp endif1012
else1012:
endif1012:
endif1011:
endif1010:
endif1009:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	call tag
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1013
	call inject_int
	jmp endif1013
else1013:
	cmpl $1, %ebx
	jne else1014
	call inject_bool
	jmp endif1014
else1014:
	cmpl $2, %ebx
	jne else1015
	call inject_big
	jmp endif1015
else1015:
	cmpl $3, %ebx
	jne else1016
	call inject_big
	jmp endif1016
else1016:
endif1016:
endif1015:
endif1014:
endif1013:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl $0, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1017
	call inject_int
	jmp endif1017
else1017:
	cmpl $1, %ebx
	jne else1018
	call inject_bool
	jmp endif1018
else1018:
	cmpl $2, %ebx
	jne else1019
	call inject_big
	jmp endif1019
else1019:
	cmpl $3, %ebx
	jne else1020
	call inject_big
	jmp endif1020
else1020:
endif1020:
endif1019:
endif1018:
endif1017:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %ecx, %ebx
	movl %edx, %ecx
	cmpl %ebx, %ecx
	jne else1021
	movl $1, %ebx
	jmp endif1021
else1021:
	movl $0, %ebx
endif1021:
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else1022
	call inject_int
	jmp endif1022
else1022:
	cmpl $1, %ebx
	jne else1023
	call inject_bool
	jmp endif1023
else1023:
	cmpl $2, %ebx
	jne else1024
	call inject_big
	jmp endif1024
else1024:
	cmpl $3, %ebx
	jne else1025
	call inject_big
	jmp endif1025
else1025:
endif1025:
endif1024:
endif1023:
endif1022:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %ebx, %ecx
	pushl %ecx
	call is_true
	addl $4, %esp
	cmpl $0, %eax
	jne else1026
	movl %ecx, %ebx
	jmp endif1026
else1026:
	movl %edx, %ecx
	movl %ecx, %ebx
endif1026:
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $1, %eax
	jne else1027
	movl %edx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else1028
	call project_int
	jmp endif1028
else1028:
	cmpl $1, %ebx
	jne else1029
	call project_bool
	jmp endif1029
else1029:
	cmpl $2, %ebx
	jne else1030
	call project_big
	jmp endif1030
else1030:
	cmpl $3, %ebx
	jne else1031
	call project_big
	jmp endif1031
else1031:
endif1031:
endif1030:
endif1029:
endif1028:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %esi
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1032
	call project_int
	jmp endif1032
else1032:
	cmpl $1, %ebx
	jne else1033
	call project_bool
	jmp endif1033
else1033:
	cmpl $2, %ebx
	jne else1034
	call project_big
	jmp endif1034
else1034:
	cmpl $3, %ebx
	jne else1035
	call project_big
	jmp endif1035
else1035:
endif1035:
endif1034:
endif1033:
endif1032:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %esi, %ecx
	movl %edx, %ebx
	addl %ecx, %ebx
	movl %ebx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1036
	call inject_int
	jmp endif1036
else1036:
	cmpl $1, %ebx
	jne else1037
	call inject_bool
	jmp endif1037
else1037:
	cmpl $2, %ebx
	jne else1038
	call inject_big
	jmp endif1038
else1038:
	cmpl $3, %ebx
	jne else1039
	call inject_big
	jmp endif1039
else1039:
endif1039:
endif1038:
endif1037:
endif1036:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
	jmp endif1027
else1027:
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
	jne else1040
	call inject_int
	jmp endif1040
else1040:
	cmpl $1, %ebx
	jne else1041
	call inject_bool
	jmp endif1041
else1041:
	cmpl $2, %ebx
	jne else1042
	call inject_big
	jmp endif1042
else1042:
	cmpl $3, %ebx
	jne else1043
	call inject_big
	jmp endif1043
else1043:
endif1043:
endif1042:
endif1041:
endif1040:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl $1, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1044
	call inject_int
	jmp endif1044
else1044:
	cmpl $1, %ebx
	jne else1045
	call inject_bool
	jmp endif1045
else1045:
	cmpl $2, %ebx
	jne else1046
	call inject_big
	jmp endif1046
else1046:
	cmpl $3, %ebx
	jne else1047
	call inject_big
	jmp endif1047
else1047:
endif1047:
endif1046:
endif1045:
endif1044:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %edx, %ebx
	movl %ecx, %ecx
	cmpl %ebx, %ecx
	jne else1048
	movl $1, %ebx
	jmp endif1048
else1048:
	movl $0, %ebx
endif1048:
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else1049
	call inject_int
	jmp endif1049
else1049:
	cmpl $1, %ebx
	jne else1050
	call inject_bool
	jmp endif1050
else1050:
	cmpl $2, %ebx
	jne else1051
	call inject_big
	jmp endif1051
else1051:
	cmpl $3, %ebx
	jne else1052
	call inject_big
	jmp endif1052
else1052:
endif1052:
endif1051:
endif1050:
endif1049:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ebx, %ebx
	pushl %ebx
	call tag
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1053
	call inject_int
	jmp endif1053
else1053:
	cmpl $1, %ebx
	jne else1054
	call inject_bool
	jmp endif1054
else1054:
	cmpl $2, %ebx
	jne else1055
	call inject_big
	jmp endif1055
else1055:
	cmpl $3, %ebx
	jne else1056
	call inject_big
	jmp endif1056
else1056:
endif1056:
endif1055:
endif1054:
endif1053:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl $1, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1057
	call inject_int
	jmp endif1057
else1057:
	cmpl $1, %ebx
	jne else1058
	call inject_bool
	jmp endif1058
else1058:
	cmpl $2, %ebx
	jne else1059
	call inject_big
	jmp endif1059
else1059:
	cmpl $3, %ebx
	jne else1060
	call inject_big
	jmp endif1060
else1060:
endif1060:
endif1059:
endif1058:
endif1057:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	movl %ebx, %ecx
	cmpl %ebx, %ecx
	jne else1061
	movl $1, %ebx
	jmp endif1061
else1061:
	movl $0, %ebx
endif1061:
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else1062
	call inject_int
	jmp endif1062
else1062:
	cmpl $1, %ebx
	jne else1063
	call inject_bool
	jmp endif1063
else1063:
	cmpl $2, %ebx
	jne else1064
	call inject_big
	jmp endif1064
else1064:
	cmpl $3, %ebx
	jne else1065
	call inject_big
	jmp endif1065
else1065:
endif1065:
endif1064:
endif1063:
endif1062:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ebx
	movl %ecx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $0, %eax
	jne else1066
	movl %ebx, %ecx
	jmp endif1066
else1066:
	movl %ebx, %ebx
	movl %ebx, %ecx
endif1066:
	movl %ecx, %ebx
	movl %ebx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $1, %eax
	jne else1067
	movl %edx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else1068
	call project_int
	jmp endif1068
else1068:
	cmpl $1, %ebx
	jne else1069
	call project_bool
	jmp endif1069
else1069:
	cmpl $2, %ebx
	jne else1070
	call project_big
	jmp endif1070
else1070:
	cmpl $3, %ebx
	jne else1071
	call project_big
	jmp endif1071
else1071:
endif1071:
endif1070:
endif1069:
endif1068:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ebx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else1072
	call project_int
	jmp endif1072
else1072:
	cmpl $1, %ebx
	jne else1073
	call project_bool
	jmp endif1073
else1073:
	cmpl $2, %ebx
	jne else1074
	call project_big
	jmp endif1074
else1074:
	cmpl $3, %ebx
	jne else1075
	call project_big
	jmp endif1075
else1075:
endif1075:
endif1074:
endif1073:
endif1072:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ecx, %ecx
	movl %ebx, %ebx
	addl %ecx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1076
	call inject_int
	jmp endif1076
else1076:
	cmpl $1, %ebx
	jne else1077
	call inject_bool
	jmp endif1077
else1077:
	cmpl $2, %ebx
	jne else1078
	call inject_big
	jmp endif1078
else1078:
	cmpl $3, %ebx
	jne else1079
	call inject_big
	jmp endif1079
else1079:
endif1079:
endif1078:
endif1077:
endif1076:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ecx
	jmp endif1067
else1067:
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
	jne else1080
	call inject_int
	jmp endif1080
else1080:
	cmpl $1, %ebx
	jne else1081
	call inject_bool
	jmp endif1081
else1081:
	cmpl $2, %ebx
	jne else1082
	call inject_big
	jmp endif1082
else1082:
	cmpl $3, %ebx
	jne else1083
	call inject_big
	jmp endif1083
else1083:
endif1083:
endif1082:
endif1081:
endif1080:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl $3, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1084
	call inject_int
	jmp endif1084
else1084:
	cmpl $1, %ebx
	jne else1085
	call inject_bool
	jmp endif1085
else1085:
	cmpl $2, %ebx
	jne else1086
	call inject_big
	jmp endif1086
else1086:
	cmpl $3, %ebx
	jne else1087
	call inject_big
	jmp endif1087
else1087:
endif1087:
endif1086:
endif1085:
endif1084:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ebx, %ebx
	movl %ecx, %ecx
	cmpl %ebx, %ecx
	jne else1088
	movl $1, %ecx
	jmp endif1088
else1088:
	movl $0, %ecx
endif1088:
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else1089
	call inject_int
	jmp endif1089
else1089:
	cmpl $1, %ebx
	jne else1090
	call inject_bool
	jmp endif1090
else1090:
	cmpl $2, %ebx
	jne else1091
	call inject_big
	jmp endif1091
else1091:
	cmpl $3, %ebx
	jne else1092
	call inject_big
	jmp endif1092
else1092:
endif1092:
endif1091:
endif1090:
endif1089:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ebx, %ebx
	pushl %ebx
	call tag
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1093
	call inject_int
	jmp endif1093
else1093:
	cmpl $1, %ebx
	jne else1094
	call inject_bool
	jmp endif1094
else1094:
	cmpl $2, %ebx
	jne else1095
	call inject_big
	jmp endif1095
else1095:
	cmpl $3, %ebx
	jne else1096
	call inject_big
	jmp endif1096
else1096:
endif1096:
endif1095:
endif1094:
endif1093:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl $3, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1097
	call inject_int
	jmp endif1097
else1097:
	cmpl $1, %ebx
	jne else1098
	call inject_bool
	jmp endif1098
else1098:
	cmpl $2, %ebx
	jne else1099
	call inject_big
	jmp endif1099
else1099:
	cmpl $3, %ebx
	jne else1100
	call inject_big
	jmp endif1100
else1100:
endif1100:
endif1099:
endif1098:
endif1097:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %edx, %ecx
	movl %ebx, %ebx
	cmpl %ecx, %ebx
	jne else1101
	movl $1, %ecx
	jmp endif1101
else1101:
	movl $0, %ecx
endif1101:
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else1102
	call inject_int
	jmp endif1102
else1102:
	cmpl $1, %ebx
	jne else1103
	call inject_bool
	jmp endif1103
else1103:
	cmpl $2, %ebx
	jne else1104
	call inject_big
	jmp endif1104
else1104:
	cmpl $3, %ebx
	jne else1105
	call inject_big
	jmp endif1105
else1105:
endif1105:
endif1104:
endif1103:
endif1102:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ebx
	movl %ecx, %ecx
	pushl %ecx
	call is_true
	addl $4, %esp
	cmpl $0, %eax
	jne else1106
	movl %ecx, %ebx
	jmp endif1106
else1106:
	movl %ebx, %ecx
	movl %ecx, %ebx
endif1106:
	movl %ebx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $1, %eax
	jne else1107
	movl %edx, %ebx
	pushl %ebx
	movl $3, %ebx
	cmpl $0, %ebx
	jne else1108
	call project_int
	jmp endif1108
else1108:
	cmpl $1, %ebx
	jne else1109
	call project_bool
	jmp endif1109
else1109:
	cmpl $2, %ebx
	jne else1110
	call project_big
	jmp endif1110
else1110:
	cmpl $3, %ebx
	jne else1111
	call project_big
	jmp endif1111
else1111:
endif1111:
endif1110:
endif1109:
endif1108:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %ebx, %ebx
	pushl %ebx
	movl $3, %ebx
	cmpl $0, %ebx
	jne else1112
	call project_int
	jmp endif1112
else1112:
	cmpl $1, %ebx
	jne else1113
	call project_bool
	jmp endif1113
else1113:
	cmpl $2, %ebx
	jne else1114
	call project_big
	jmp endif1114
else1114:
	cmpl $3, %ebx
	jne else1115
	call project_big
	jmp endif1115
else1115:
endif1115:
endif1114:
endif1113:
endif1112:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %edx, %ecx
	movl %edx, %ebx
	pushl %ebx
	pushl %ecx
	call add
	addl $8, %esp
	movl %eax, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $3, %ebx
	cmpl $0, %ebx
	jne else1116
	call inject_int
	jmp endif1116
else1116:
	cmpl $1, %ebx
	jne else1117
	call inject_bool
	jmp endif1117
else1117:
	cmpl $2, %ebx
	jne else1118
	call inject_big
	jmp endif1118
else1118:
	cmpl $3, %ebx
	jne else1119
	call inject_big
	jmp endif1119
else1119:
endif1119:
endif1118:
endif1117:
endif1116:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
	jmp endif1107
else1107:
	movl -12(%ebp), %ebx
	call type_error
	movl %eax, %ebx
	addl $0, %esp
	movl %ebx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
endif1107:
	movl %ebx, %ebx
	movl %ebx, %ecx
endif1067:
	movl %ecx, %ebx
	movl %ebx, %ebx
endif1027:
	movl %ebx, %ecx
	movl %ecx, %ebx
endif987:
	movl %ebx, %ecx
	movl %ecx, %ebx
endif947:
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl -8(%ebp), %ebx
	pushl %ebx
	call print_any
	addl $4, %esp
	movl %ebx, %ebx
	pushl %ebx
	call print_any
	addl $4, %esp
	movl $1, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1120
	call inject_int
	jmp endif1120
else1120:
	cmpl $1, %ebx
	jne else1121
	call inject_bool
	jmp endif1121
else1121:
	cmpl $2, %ebx
	jne else1122
	call inject_big
	jmp endif1122
else1122:
	cmpl $3, %ebx
	jne else1123
	call inject_big
	jmp endif1123
else1123:
endif1123:
endif1122:
endif1121:
endif1120:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	movl %ebx, %edx
	movl $4, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1124
	call inject_int
	jmp endif1124
else1124:
	cmpl $1, %ebx
	jne else1125
	call inject_bool
	jmp endif1125
else1125:
	cmpl $2, %ebx
	jne else1126
	call inject_big
	jmp endif1126
else1126:
	cmpl $3, %ebx
	jne else1127
	call inject_big
	jmp endif1127
else1127:
endif1127:
endif1126:
endif1125:
endif1124:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	movl %ebx, %ecx
	movl %edx, %ebx
	pushl %ebx
	call tag
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1128
	call inject_int
	jmp endif1128
else1128:
	cmpl $1, %ebx
	jne else1129
	call inject_bool
	jmp endif1129
else1129:
	cmpl $2, %ebx
	jne else1130
	call inject_big
	jmp endif1130
else1130:
	cmpl $3, %ebx
	jne else1131
	call inject_big
	jmp endif1131
else1131:
endif1131:
endif1130:
endif1129:
endif1128:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %esi
	movl $0, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1132
	call inject_int
	jmp endif1132
else1132:
	cmpl $1, %ebx
	jne else1133
	call inject_bool
	jmp endif1133
else1133:
	cmpl $2, %ebx
	jne else1134
	call inject_big
	jmp endif1134
else1134:
	cmpl $3, %ebx
	jne else1135
	call inject_big
	jmp endif1135
else1135:
endif1135:
endif1134:
endif1133:
endif1132:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %esi, %ecx
	movl %edx, %ebx
	cmpl %ecx, %ebx
	jne else1136
	movl $1, %ebx
	jmp endif1136
else1136:
	movl $0, %ebx
endif1136:
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else1137
	call inject_int
	jmp endif1137
else1137:
	cmpl $1, %ebx
	jne else1138
	call inject_bool
	jmp endif1138
else1138:
	cmpl $2, %ebx
	jne else1139
	call inject_big
	jmp endif1139
else1139:
	cmpl $3, %ebx
	jne else1140
	call inject_big
	jmp endif1140
else1140:
endif1140:
endif1139:
endif1138:
endif1137:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %ecx, %ebx
	pushl %ebx
	call tag
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1141
	call inject_int
	jmp endif1141
else1141:
	cmpl $1, %ebx
	jne else1142
	call inject_bool
	jmp endif1142
else1142:
	cmpl $2, %ebx
	jne else1143
	call inject_big
	jmp endif1143
else1143:
	cmpl $3, %ebx
	jne else1144
	call inject_big
	jmp endif1144
else1144:
endif1144:
endif1143:
endif1142:
endif1141:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl $0, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1145
	call inject_int
	jmp endif1145
else1145:
	cmpl $1, %ebx
	jne else1146
	call inject_bool
	jmp endif1146
else1146:
	cmpl $2, %ebx
	jne else1147
	call inject_big
	jmp endif1147
else1147:
	cmpl $3, %ebx
	jne else1148
	call inject_big
	jmp endif1148
else1148:
endif1148:
endif1147:
endif1146:
endif1145:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %ecx, %ebx
	movl %edx, %ecx
	cmpl %ebx, %ecx
	jne else1149
	movl $1, %ebx
	jmp endif1149
else1149:
	movl $0, %ebx
endif1149:
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else1150
	call inject_int
	jmp endif1150
else1150:
	cmpl $1, %ebx
	jne else1151
	call inject_bool
	jmp endif1151
else1151:
	cmpl $2, %ebx
	jne else1152
	call inject_big
	jmp endif1152
else1152:
	cmpl $3, %ebx
	jne else1153
	call inject_big
	jmp endif1153
else1153:
endif1153:
endif1152:
endif1151:
endif1150:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %edx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $0, %eax
	jne else1154
	movl %ebx, %ecx
	jmp endif1154
else1154:
	movl %edx, %ebx
	movl %ebx, %ecx
endif1154:
	movl %ecx, %ebx
	movl %ebx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $1, %eax
	jne else1155
	movl %edx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1156
	call project_int
	jmp endif1156
else1156:
	cmpl $1, %ebx
	jne else1157
	call project_bool
	jmp endif1157
else1157:
	cmpl $2, %ebx
	jne else1158
	call project_big
	jmp endif1158
else1158:
	cmpl $3, %ebx
	jne else1159
	call project_big
	jmp endif1159
else1159:
endif1159:
endif1158:
endif1157:
endif1156:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1160
	call project_int
	jmp endif1160
else1160:
	cmpl $1, %ebx
	jne else1161
	call project_bool
	jmp endif1161
else1161:
	cmpl $2, %ebx
	jne else1162
	call project_big
	jmp endif1162
else1162:
	cmpl $3, %ebx
	jne else1163
	call project_big
	jmp endif1163
else1163:
endif1163:
endif1162:
endif1161:
endif1160:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %edx, %ebx
	movl %ecx, %ebx
	addl %ebx, %ebx
	movl %ebx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1164
	call inject_int
	jmp endif1164
else1164:
	cmpl $1, %ebx
	jne else1165
	call inject_bool
	jmp endif1165
else1165:
	cmpl $2, %ebx
	jne else1166
	call inject_big
	jmp endif1166
else1166:
	cmpl $3, %ebx
	jne else1167
	call inject_big
	jmp endif1167
else1167:
endif1167:
endif1166:
endif1165:
endif1164:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ecx
	jmp endif1155
else1155:
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
	jne else1168
	call inject_int
	jmp endif1168
else1168:
	cmpl $1, %ebx
	jne else1169
	call inject_bool
	jmp endif1169
else1169:
	cmpl $2, %ebx
	jne else1170
	call inject_big
	jmp endif1170
else1170:
	cmpl $3, %ebx
	jne else1171
	call inject_big
	jmp endif1171
else1171:
endif1171:
endif1170:
endif1169:
endif1168:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl $0, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1172
	call inject_int
	jmp endif1172
else1172:
	cmpl $1, %ebx
	jne else1173
	call inject_bool
	jmp endif1173
else1173:
	cmpl $2, %ebx
	jne else1174
	call inject_big
	jmp endif1174
else1174:
	cmpl $3, %ebx
	jne else1175
	call inject_big
	jmp endif1175
else1175:
endif1175:
endif1174:
endif1173:
endif1172:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %ecx, %ebx
	movl %edx, %ecx
	cmpl %ebx, %ecx
	jne else1176
	movl $1, %ebx
	jmp endif1176
else1176:
	movl $0, %ebx
endif1176:
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else1177
	call inject_int
	jmp endif1177
else1177:
	cmpl $1, %ebx
	jne else1178
	call inject_bool
	jmp endif1178
else1178:
	cmpl $2, %ebx
	jne else1179
	call inject_big
	jmp endif1179
else1179:
	cmpl $3, %ebx
	jne else1180
	call inject_big
	jmp endif1180
else1180:
endif1180:
endif1179:
endif1178:
endif1177:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %esi
	movl %ecx, %ebx
	pushl %ebx
	call tag
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1181
	call inject_int
	jmp endif1181
else1181:
	cmpl $1, %ebx
	jne else1182
	call inject_bool
	jmp endif1182
else1182:
	cmpl $2, %ebx
	jne else1183
	call inject_big
	jmp endif1183
else1183:
	cmpl $3, %ebx
	jne else1184
	call inject_big
	jmp endif1184
else1184:
endif1184:
endif1183:
endif1182:
endif1181:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl $1, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1185
	call inject_int
	jmp endif1185
else1185:
	cmpl $1, %ebx
	jne else1186
	call inject_bool
	jmp endif1186
else1186:
	cmpl $2, %ebx
	jne else1187
	call inject_big
	jmp endif1187
else1187:
	cmpl $3, %ebx
	jne else1188
	call inject_big
	jmp endif1188
else1188:
endif1188:
endif1187:
endif1186:
endif1185:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %ecx, %ebx
	movl %edx, %ecx
	cmpl %ebx, %ecx
	jne else1189
	movl $1, %ebx
	jmp endif1189
else1189:
	movl $0, %ebx
endif1189:
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else1190
	call inject_int
	jmp endif1190
else1190:
	cmpl $1, %ebx
	jne else1191
	call inject_bool
	jmp endif1191
else1191:
	cmpl $2, %ebx
	jne else1192
	call inject_big
	jmp endif1192
else1192:
	cmpl $3, %ebx
	jne else1193
	call inject_big
	jmp endif1193
else1193:
endif1193:
endif1192:
endif1191:
endif1190:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %esi, %ecx
	pushl %ecx
	call is_true
	addl $4, %esp
	cmpl $0, %eax
	jne else1194
	movl %ecx, %ebx
	jmp endif1194
else1194:
	movl %edx, %ecx
	movl %ecx, %ebx
endif1194:
	movl %ebx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $1, %eax
	jne else1195
	movl %edx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1196
	call project_int
	jmp endif1196
else1196:
	cmpl $1, %ebx
	jne else1197
	call project_bool
	jmp endif1197
else1197:
	cmpl $2, %ebx
	jne else1198
	call project_big
	jmp endif1198
else1198:
	cmpl $3, %ebx
	jne else1199
	call project_big
	jmp endif1199
else1199:
endif1199:
endif1198:
endif1197:
endif1196:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else1200
	call project_int
	jmp endif1200
else1200:
	cmpl $1, %ebx
	jne else1201
	call project_bool
	jmp endif1201
else1201:
	cmpl $2, %ebx
	jne else1202
	call project_big
	jmp endif1202
else1202:
	cmpl $3, %ebx
	jne else1203
	call project_big
	jmp endif1203
else1203:
endif1203:
endif1202:
endif1201:
endif1200:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	movl %ebx, %ebx
	addl %ebx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1204
	call inject_int
	jmp endif1204
else1204:
	cmpl $1, %ebx
	jne else1205
	call inject_bool
	jmp endif1205
else1205:
	cmpl $2, %ebx
	jne else1206
	call inject_big
	jmp endif1206
else1206:
	cmpl $3, %ebx
	jne else1207
	call inject_big
	jmp endif1207
else1207:
endif1207:
endif1206:
endif1205:
endif1204:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	movl %ebx, %ecx
	jmp endif1195
else1195:
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
	jne else1208
	call inject_int
	jmp endif1208
else1208:
	cmpl $1, %ebx
	jne else1209
	call inject_bool
	jmp endif1209
else1209:
	cmpl $2, %ebx
	jne else1210
	call inject_big
	jmp endif1210
else1210:
	cmpl $3, %ebx
	jne else1211
	call inject_big
	jmp endif1211
else1211:
endif1211:
endif1210:
endif1209:
endif1208:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl $1, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1212
	call inject_int
	jmp endif1212
else1212:
	cmpl $1, %ebx
	jne else1213
	call inject_bool
	jmp endif1213
else1213:
	cmpl $2, %ebx
	jne else1214
	call inject_big
	jmp endif1214
else1214:
	cmpl $3, %ebx
	jne else1215
	call inject_big
	jmp endif1215
else1215:
endif1215:
endif1214:
endif1213:
endif1212:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ecx
	movl %ebx, %ebx
	cmpl %ecx, %ebx
	jne else1216
	movl $1, %ebx
	jmp endif1216
else1216:
	movl $0, %ebx
endif1216:
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else1217
	call inject_int
	jmp endif1217
else1217:
	cmpl $1, %ebx
	jne else1218
	call inject_bool
	jmp endif1218
else1218:
	cmpl $2, %ebx
	jne else1219
	call inject_big
	jmp endif1219
else1219:
	cmpl $3, %ebx
	jne else1220
	call inject_big
	jmp endif1220
else1220:
endif1220:
endif1219:
endif1218:
endif1217:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ecx, %ebx
	pushl %ebx
	call tag
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1221
	call inject_int
	jmp endif1221
else1221:
	cmpl $1, %ebx
	jne else1222
	call inject_bool
	jmp endif1222
else1222:
	cmpl $2, %ebx
	jne else1223
	call inject_big
	jmp endif1223
else1223:
	cmpl $3, %ebx
	jne else1224
	call inject_big
	jmp endif1224
else1224:
endif1224:
endif1223:
endif1222:
endif1221:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl $0, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1225
	call inject_int
	jmp endif1225
else1225:
	cmpl $1, %ebx
	jne else1226
	call inject_bool
	jmp endif1226
else1226:
	cmpl $2, %ebx
	jne else1227
	call inject_big
	jmp endif1227
else1227:
	cmpl $3, %ebx
	jne else1228
	call inject_big
	jmp endif1228
else1228:
endif1228:
endif1227:
endif1226:
endif1225:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ecx, %ecx
	movl %ebx, %ebx
	cmpl %ecx, %ebx
	jne else1229
	movl $1, %ecx
	jmp endif1229
else1229:
	movl $0, %ecx
endif1229:
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else1230
	call inject_int
	jmp endif1230
else1230:
	cmpl $1, %ebx
	jne else1231
	call inject_bool
	jmp endif1231
else1231:
	cmpl $2, %ebx
	jne else1232
	call inject_big
	jmp endif1232
else1232:
	cmpl $3, %ebx
	jne else1233
	call inject_big
	jmp endif1233
else1233:
endif1233:
endif1232:
endif1231:
endif1230:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $0, %eax
	jne else1234
	movl %ebx, %ebx
	jmp endif1234
else1234:
	movl %ebx, %ebx
	movl %ebx, %ebx
endif1234:
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $1, %eax
	jne else1235
	movl %edx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else1236
	call project_int
	jmp endif1236
else1236:
	cmpl $1, %ebx
	jne else1237
	call project_bool
	jmp endif1237
else1237:
	cmpl $2, %ebx
	jne else1238
	call project_big
	jmp endif1238
else1238:
	cmpl $3, %ebx
	jne else1239
	call project_big
	jmp endif1239
else1239:
endif1239:
endif1238:
endif1237:
endif1236:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1240
	call project_int
	jmp endif1240
else1240:
	cmpl $1, %ebx
	jne else1241
	call project_bool
	jmp endif1241
else1241:
	cmpl $2, %ebx
	jne else1242
	call project_big
	jmp endif1242
else1242:
	cmpl $3, %ebx
	jne else1243
	call project_big
	jmp endif1243
else1243:
endif1243:
endif1242:
endif1241:
endif1240:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ecx, %ecx
	movl %ebx, %ebx
	addl %ecx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1244
	call inject_int
	jmp endif1244
else1244:
	cmpl $1, %ebx
	jne else1245
	call inject_bool
	jmp endif1245
else1245:
	cmpl $2, %ebx
	jne else1246
	call inject_big
	jmp endif1246
else1246:
	cmpl $3, %ebx
	jne else1247
	call inject_big
	jmp endif1247
else1247:
endif1247:
endif1246:
endif1245:
endif1244:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	movl %ebx, %ecx
	jmp endif1235
else1235:
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
	jne else1248
	call inject_int
	jmp endif1248
else1248:
	cmpl $1, %ebx
	jne else1249
	call inject_bool
	jmp endif1249
else1249:
	cmpl $2, %ebx
	jne else1250
	call inject_big
	jmp endif1250
else1250:
	cmpl $3, %ebx
	jne else1251
	call inject_big
	jmp endif1251
else1251:
endif1251:
endif1250:
endif1249:
endif1248:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl $1, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1252
	call inject_int
	jmp endif1252
else1252:
	cmpl $1, %ebx
	jne else1253
	call inject_bool
	jmp endif1253
else1253:
	cmpl $2, %ebx
	jne else1254
	call inject_big
	jmp endif1254
else1254:
	cmpl $3, %ebx
	jne else1255
	call inject_big
	jmp endif1255
else1255:
endif1255:
endif1254:
endif1253:
endif1252:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %ecx, %ebx
	movl %edx, %ecx
	cmpl %ebx, %ecx
	jne else1256
	movl $1, %ecx
	jmp endif1256
else1256:
	movl $0, %ecx
endif1256:
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else1257
	call inject_int
	jmp endif1257
else1257:
	cmpl $1, %ebx
	jne else1258
	call inject_bool
	jmp endif1258
else1258:
	cmpl $2, %ebx
	jne else1259
	call inject_big
	jmp endif1259
else1259:
	cmpl $3, %ebx
	jne else1260
	call inject_big
	jmp endif1260
else1260:
endif1260:
endif1259:
endif1258:
endif1257:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %esi
	movl %ecx, %ebx
	pushl %ebx
	call tag
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1261
	call inject_int
	jmp endif1261
else1261:
	cmpl $1, %ebx
	jne else1262
	call inject_bool
	jmp endif1262
else1262:
	cmpl $2, %ebx
	jne else1263
	call inject_big
	jmp endif1263
else1263:
	cmpl $3, %ebx
	jne else1264
	call inject_big
	jmp endif1264
else1264:
endif1264:
endif1263:
endif1262:
endif1261:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl $1, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1265
	call inject_int
	jmp endif1265
else1265:
	cmpl $1, %ebx
	jne else1266
	call inject_bool
	jmp endif1266
else1266:
	cmpl $2, %ebx
	jne else1267
	call inject_big
	jmp endif1267
else1267:
	cmpl $3, %ebx
	jne else1268
	call inject_big
	jmp endif1268
else1268:
endif1268:
endif1267:
endif1266:
endif1265:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %edx, %ecx
	movl %edx, %ebx
	cmpl %ecx, %ebx
	jne else1269
	movl $1, %ebx
	jmp endif1269
else1269:
	movl $0, %ebx
endif1269:
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else1270
	call inject_int
	jmp endif1270
else1270:
	cmpl $1, %ebx
	jne else1271
	call inject_bool
	jmp endif1271
else1271:
	cmpl $2, %ebx
	jne else1272
	call inject_big
	jmp endif1272
else1272:
	cmpl $3, %ebx
	jne else1273
	call inject_big
	jmp endif1273
else1273:
endif1273:
endif1272:
endif1271:
endif1270:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %esi, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $0, %eax
	jne else1274
	movl %ebx, %ecx
	jmp endif1274
else1274:
	movl %edx, %ebx
	movl %ebx, %ecx
endif1274:
	movl %ecx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $1, %eax
	jne else1275
	movl %edx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else1276
	call project_int
	jmp endif1276
else1276:
	cmpl $1, %ebx
	jne else1277
	call project_bool
	jmp endif1277
else1277:
	cmpl $2, %ebx
	jne else1278
	call project_big
	jmp endif1278
else1278:
	cmpl $3, %ebx
	jne else1279
	call project_big
	jmp endif1279
else1279:
endif1279:
endif1278:
endif1277:
endif1276:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else1280
	call project_int
	jmp endif1280
else1280:
	cmpl $1, %ebx
	jne else1281
	call project_bool
	jmp endif1281
else1281:
	cmpl $2, %ebx
	jne else1282
	call project_big
	jmp endif1282
else1282:
	cmpl $3, %ebx
	jne else1283
	call project_big
	jmp endif1283
else1283:
endif1283:
endif1282:
endif1281:
endif1280:
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
	jne else1284
	call inject_int
	jmp endif1284
else1284:
	cmpl $1, %ebx
	jne else1285
	call inject_bool
	jmp endif1285
else1285:
	cmpl $2, %ebx
	jne else1286
	call inject_big
	jmp endif1286
else1286:
	cmpl $3, %ebx
	jne else1287
	call inject_big
	jmp endif1287
else1287:
endif1287:
endif1286:
endif1285:
endif1284:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ecx
	jmp endif1275
else1275:
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
	jne else1288
	call inject_int
	jmp endif1288
else1288:
	cmpl $1, %ebx
	jne else1289
	call inject_bool
	jmp endif1289
else1289:
	cmpl $2, %ebx
	jne else1290
	call inject_big
	jmp endif1290
else1290:
	cmpl $3, %ebx
	jne else1291
	call inject_big
	jmp endif1291
else1291:
endif1291:
endif1290:
endif1289:
endif1288:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl $3, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1292
	call inject_int
	jmp endif1292
else1292:
	cmpl $1, %ebx
	jne else1293
	call inject_bool
	jmp endif1293
else1293:
	cmpl $2, %ebx
	jne else1294
	call inject_big
	jmp endif1294
else1294:
	cmpl $3, %ebx
	jne else1295
	call inject_big
	jmp endif1295
else1295:
endif1295:
endif1294:
endif1293:
endif1292:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ecx, %ecx
	movl %ebx, %ebx
	cmpl %ecx, %ebx
	jne else1296
	movl $1, %ecx
	jmp endif1296
else1296:
	movl $0, %ecx
endif1296:
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else1297
	call inject_int
	jmp endif1297
else1297:
	cmpl $1, %ebx
	jne else1298
	call inject_bool
	jmp endif1298
else1298:
	cmpl $2, %ebx
	jne else1299
	call inject_big
	jmp endif1299
else1299:
	cmpl $3, %ebx
	jne else1300
	call inject_big
	jmp endif1300
else1300:
endif1300:
endif1299:
endif1298:
endif1297:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %ecx, %ebx
	pushl %ebx
	call tag
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1301
	call inject_int
	jmp endif1301
else1301:
	cmpl $1, %ebx
	jne else1302
	call inject_bool
	jmp endif1302
else1302:
	cmpl $2, %ebx
	jne else1303
	call inject_big
	jmp endif1303
else1303:
	cmpl $3, %ebx
	jne else1304
	call inject_big
	jmp endif1304
else1304:
endif1304:
endif1303:
endif1302:
endif1301:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl $3, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1305
	call inject_int
	jmp endif1305
else1305:
	cmpl $1, %ebx
	jne else1306
	call inject_bool
	jmp endif1306
else1306:
	cmpl $2, %ebx
	jne else1307
	call inject_big
	jmp endif1307
else1307:
	cmpl $3, %ebx
	jne else1308
	call inject_big
	jmp endif1308
else1308:
endif1308:
endif1307:
endif1306:
endif1305:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ecx, %ecx
	movl %ebx, %ebx
	cmpl %ecx, %ebx
	jne else1309
	movl $1, %ecx
	jmp endif1309
else1309:
	movl $0, %ecx
endif1309:
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else1310
	call inject_int
	jmp endif1310
else1310:
	cmpl $1, %ebx
	jne else1311
	call inject_bool
	jmp endif1311
else1311:
	cmpl $2, %ebx
	jne else1312
	call inject_big
	jmp endif1312
else1312:
	cmpl $3, %ebx
	jne else1313
	call inject_big
	jmp endif1313
else1313:
endif1313:
endif1312:
endif1311:
endif1310:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %edx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $0, %eax
	jne else1314
	movl %ebx, %ecx
	jmp endif1314
else1314:
	movl %ecx, %ebx
	movl %ebx, %ecx
endif1314:
	movl %ecx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $1, %eax
	jne else1315
	movl %edx, %ebx
	pushl %ebx
	movl $3, %ebx
	cmpl $0, %ebx
	jne else1316
	call project_int
	jmp endif1316
else1316:
	cmpl $1, %ebx
	jne else1317
	call project_bool
	jmp endif1317
else1317:
	cmpl $2, %ebx
	jne else1318
	call project_big
	jmp endif1318
else1318:
	cmpl $3, %ebx
	jne else1319
	call project_big
	jmp endif1319
else1319:
endif1319:
endif1318:
endif1317:
endif1316:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $3, %ebx
	cmpl $0, %ebx
	jne else1320
	call project_int
	jmp endif1320
else1320:
	cmpl $1, %ebx
	jne else1321
	call project_bool
	jmp endif1321
else1321:
	cmpl $2, %ebx
	jne else1322
	call project_big
	jmp endif1322
else1322:
	cmpl $3, %ebx
	jne else1323
	call project_big
	jmp endif1323
else1323:
endif1323:
endif1322:
endif1321:
endif1320:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %ecx, %ebx
	movl %edx, %ecx
	pushl %ecx
	pushl %ebx
	call add
	addl $8, %esp
	movl %eax, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $3, %ebx
	cmpl $0, %ebx
	jne else1324
	call inject_int
	jmp endif1324
else1324:
	cmpl $1, %ebx
	jne else1325
	call inject_bool
	jmp endif1325
else1325:
	cmpl $2, %ebx
	jne else1326
	call inject_big
	jmp endif1326
else1326:
	cmpl $3, %ebx
	jne else1327
	call inject_big
	jmp endif1327
else1327:
endif1327:
endif1326:
endif1325:
endif1324:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ecx
	jmp endif1315
else1315:
	movl -12(%ebp), %ebx
	call type_error
	movl %eax, %ebx
	addl $0, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ecx
endif1315:
	movl %ecx, %ebx
	movl %ebx, %ecx
endif1275:
	movl %ecx, %ebx
	movl %ebx, %ecx
endif1235:
	movl %ecx, %ebx
	movl %ebx, %ecx
endif1195:
	movl %ecx, %ebx
	movl %ebx, %ecx
endif1155:
	movl %ecx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	call print_any
	addl $4, %esp
	movl $1, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1328
	call inject_int
	jmp endif1328
else1328:
	cmpl $1, %ebx
	jne else1329
	call inject_bool
	jmp endif1329
else1329:
	cmpl $2, %ebx
	jne else1330
	call inject_big
	jmp endif1330
else1330:
	cmpl $3, %ebx
	jne else1331
	call inject_big
	jmp endif1331
else1331:
endif1331:
endif1330:
endif1329:
endif1328:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl $2, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1332
	call inject_int
	jmp endif1332
else1332:
	cmpl $1, %ebx
	jne else1333
	call inject_bool
	jmp endif1333
else1333:
	cmpl $2, %ebx
	jne else1334
	call inject_big
	jmp endif1334
else1334:
	cmpl $3, %ebx
	jne else1335
	call inject_big
	jmp endif1335
else1335:
endif1335:
endif1334:
endif1333:
endif1332:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	call tag
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1336
	call inject_int
	jmp endif1336
else1336:
	cmpl $1, %ebx
	jne else1337
	call inject_bool
	jmp endif1337
else1337:
	cmpl $2, %ebx
	jne else1338
	call inject_big
	jmp endif1338
else1338:
	cmpl $3, %ebx
	jne else1339
	call inject_big
	jmp endif1339
else1339:
endif1339:
endif1338:
endif1337:
endif1336:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl $0, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1340
	call inject_int
	jmp endif1340
else1340:
	cmpl $1, %ebx
	jne else1341
	call inject_bool
	jmp endif1341
else1341:
	cmpl $2, %ebx
	jne else1342
	call inject_big
	jmp endif1342
else1342:
	cmpl $3, %ebx
	jne else1343
	call inject_big
	jmp endif1343
else1343:
endif1343:
endif1342:
endif1341:
endif1340:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %ecx, %ebx
	movl %edx, %ecx
	cmpl %ebx, %ecx
	jne else1344
	movl $1, %ebx
	jmp endif1344
else1344:
	movl $0, %ebx
endif1344:
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else1345
	call inject_int
	jmp endif1345
else1345:
	cmpl $1, %ebx
	jne else1346
	call inject_bool
	jmp endif1346
else1346:
	cmpl $2, %ebx
	jne else1347
	call inject_big
	jmp endif1347
else1347:
	cmpl $3, %ebx
	jne else1348
	call inject_big
	jmp endif1348
else1348:
endif1348:
endif1347:
endif1346:
endif1345:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %ebx, %ebx
	pushl %ebx
	call tag
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1349
	call inject_int
	jmp endif1349
else1349:
	cmpl $1, %ebx
	jne else1350
	call inject_bool
	jmp endif1350
else1350:
	cmpl $2, %ebx
	jne else1351
	call inject_big
	jmp endif1351
else1351:
	cmpl $3, %ebx
	jne else1352
	call inject_big
	jmp endif1352
else1352:
endif1352:
endif1351:
endif1350:
endif1349:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl $0, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1353
	call inject_int
	jmp endif1353
else1353:
	cmpl $1, %ebx
	jne else1354
	call inject_bool
	jmp endif1354
else1354:
	cmpl $2, %ebx
	jne else1355
	call inject_big
	jmp endif1355
else1355:
	cmpl $3, %ebx
	jne else1356
	call inject_big
	jmp endif1356
else1356:
endif1356:
endif1355:
endif1354:
endif1353:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %ecx, %ebx
	movl %edx, %ecx
	cmpl %ebx, %ecx
	jne else1357
	movl $1, %ebx
	jmp endif1357
else1357:
	movl $0, %ebx
endif1357:
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else1358
	call inject_int
	jmp endif1358
else1358:
	cmpl $1, %ebx
	jne else1359
	call inject_bool
	jmp endif1359
else1359:
	cmpl $2, %ebx
	jne else1360
	call inject_big
	jmp endif1360
else1360:
	cmpl $3, %ebx
	jne else1361
	call inject_big
	jmp endif1361
else1361:
endif1361:
endif1360:
endif1359:
endif1358:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %edx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $0, %eax
	jne else1362
	movl %ebx, %ecx
	jmp endif1362
else1362:
	movl %edx, %ebx
	movl %ebx, %ecx
endif1362:
	movl %ecx, %ebx
	movl %ebx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $1, %eax
	jne else1363
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1364
	call project_int
	jmp endif1364
else1364:
	cmpl $1, %ebx
	jne else1365
	call project_bool
	jmp endif1365
else1365:
	cmpl $2, %ebx
	jne else1366
	call project_big
	jmp endif1366
else1366:
	cmpl $3, %ebx
	jne else1367
	call project_big
	jmp endif1367
else1367:
endif1367:
endif1366:
endif1365:
endif1364:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1368
	call project_int
	jmp endif1368
else1368:
	cmpl $1, %ebx
	jne else1369
	call project_bool
	jmp endif1369
else1369:
	cmpl $2, %ebx
	jne else1370
	call project_big
	jmp endif1370
else1370:
	cmpl $3, %ebx
	jne else1371
	call project_big
	jmp endif1371
else1371:
endif1371:
endif1370:
endif1369:
endif1368:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %edx, %ebx
	movl %ecx, %ebx
	addl %ebx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1372
	call inject_int
	jmp endif1372
else1372:
	cmpl $1, %ebx
	jne else1373
	call inject_bool
	jmp endif1373
else1373:
	cmpl $2, %ebx
	jne else1374
	call inject_big
	jmp endif1374
else1374:
	cmpl $3, %ebx
	jne else1375
	call inject_big
	jmp endif1375
else1375:
endif1375:
endif1374:
endif1373:
endif1372:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	movl %ebx, %ecx
	jmp endif1363
else1363:
	movl %ebx, %ebx
	pushl %ebx
	call tag
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1376
	call inject_int
	jmp endif1376
else1376:
	cmpl $1, %ebx
	jne else1377
	call inject_bool
	jmp endif1377
else1377:
	cmpl $2, %ebx
	jne else1378
	call inject_big
	jmp endif1378
else1378:
	cmpl $3, %ebx
	jne else1379
	call inject_big
	jmp endif1379
else1379:
endif1379:
endif1378:
endif1377:
endif1376:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl $0, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1380
	call inject_int
	jmp endif1380
else1380:
	cmpl $1, %ebx
	jne else1381
	call inject_bool
	jmp endif1381
else1381:
	cmpl $2, %ebx
	jne else1382
	call inject_big
	jmp endif1382
else1382:
	cmpl $3, %ebx
	jne else1383
	call inject_big
	jmp endif1383
else1383:
endif1383:
endif1382:
endif1381:
endif1380:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %ecx, %ecx
	movl %edx, %ebx
	cmpl %ecx, %ebx
	jne else1384
	movl $1, %ebx
	jmp endif1384
else1384:
	movl $0, %ebx
endif1384:
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else1385
	call inject_int
	jmp endif1385
else1385:
	cmpl $1, %ebx
	jne else1386
	call inject_bool
	jmp endif1386
else1386:
	cmpl $2, %ebx
	jne else1387
	call inject_big
	jmp endif1387
else1387:
	cmpl $3, %ebx
	jne else1388
	call inject_big
	jmp endif1388
else1388:
endif1388:
endif1387:
endif1386:
endif1385:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %ebx, %ebx
	pushl %ebx
	call tag
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1389
	call inject_int
	jmp endif1389
else1389:
	cmpl $1, %ebx
	jne else1390
	call inject_bool
	jmp endif1390
else1390:
	cmpl $2, %ebx
	jne else1391
	call inject_big
	jmp endif1391
else1391:
	cmpl $3, %ebx
	jne else1392
	call inject_big
	jmp endif1392
else1392:
endif1392:
endif1391:
endif1390:
endif1389:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl $1, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1393
	call inject_int
	jmp endif1393
else1393:
	cmpl $1, %ebx
	jne else1394
	call inject_bool
	jmp endif1394
else1394:
	cmpl $2, %ebx
	jne else1395
	call inject_big
	jmp endif1395
else1395:
	cmpl $3, %ebx
	jne else1396
	call inject_big
	jmp endif1396
else1396:
endif1396:
endif1395:
endif1394:
endif1393:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ecx, %ecx
	movl %ebx, %ebx
	cmpl %ecx, %ebx
	jne else1397
	movl $1, %ebx
	jmp endif1397
else1397:
	movl $0, %ebx
endif1397:
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else1398
	call inject_int
	jmp endif1398
else1398:
	cmpl $1, %ebx
	jne else1399
	call inject_bool
	jmp endif1399
else1399:
	cmpl $2, %ebx
	jne else1400
	call inject_big
	jmp endif1400
else1400:
	cmpl $3, %ebx
	jne else1401
	call inject_big
	jmp endif1401
else1401:
endif1401:
endif1400:
endif1399:
endif1398:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %edx, %ecx
	pushl %ecx
	call is_true
	addl $4, %esp
	cmpl $0, %eax
	jne else1402
	movl %ecx, %ebx
	jmp endif1402
else1402:
	movl %ecx, %ecx
	movl %ecx, %ebx
endif1402:
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $1, %eax
	jne else1403
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1404
	call project_int
	jmp endif1404
else1404:
	cmpl $1, %ebx
	jne else1405
	call project_bool
	jmp endif1405
else1405:
	cmpl $2, %ebx
	jne else1406
	call project_big
	jmp endif1406
else1406:
	cmpl $3, %ebx
	jne else1407
	call project_big
	jmp endif1407
else1407:
endif1407:
endif1406:
endif1405:
endif1404:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ebx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else1408
	call project_int
	jmp endif1408
else1408:
	cmpl $1, %ebx
	jne else1409
	call project_bool
	jmp endif1409
else1409:
	cmpl $2, %ebx
	jne else1410
	call project_big
	jmp endif1410
else1410:
	cmpl $3, %ebx
	jne else1411
	call project_big
	jmp endif1411
else1411:
endif1411:
endif1410:
endif1409:
endif1408:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ecx, %ebx
	addl %ebx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1412
	call inject_int
	jmp endif1412
else1412:
	cmpl $1, %ebx
	jne else1413
	call inject_bool
	jmp endif1413
else1413:
	cmpl $2, %ebx
	jne else1414
	call inject_big
	jmp endif1414
else1414:
	cmpl $3, %ebx
	jne else1415
	call inject_big
	jmp endif1415
else1415:
endif1415:
endif1414:
endif1413:
endif1412:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ebx
	movl %ebx, %ebx
	movl %ebx, %ecx
	jmp endif1403
else1403:
	movl %ebx, %ebx
	pushl %ebx
	call tag
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1416
	call inject_int
	jmp endif1416
else1416:
	cmpl $1, %ebx
	jne else1417
	call inject_bool
	jmp endif1417
else1417:
	cmpl $2, %ebx
	jne else1418
	call inject_big
	jmp endif1418
else1418:
	cmpl $3, %ebx
	jne else1419
	call inject_big
	jmp endif1419
else1419:
endif1419:
endif1418:
endif1417:
endif1416:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl $1, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1420
	call inject_int
	jmp endif1420
else1420:
	cmpl $1, %ebx
	jne else1421
	call inject_bool
	jmp endif1421
else1421:
	cmpl $2, %ebx
	jne else1422
	call inject_big
	jmp endif1422
else1422:
	cmpl $3, %ebx
	jne else1423
	call inject_big
	jmp endif1423
else1423:
endif1423:
endif1422:
endif1421:
endif1420:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ecx, %ecx
	movl %ebx, %ebx
	cmpl %ecx, %ebx
	jne else1424
	movl $1, %ebx
	jmp endif1424
else1424:
	movl $0, %ebx
endif1424:
	movl %ebx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else1425
	call inject_int
	jmp endif1425
else1425:
	cmpl $1, %ebx
	jne else1426
	call inject_bool
	jmp endif1426
else1426:
	cmpl $2, %ebx
	jne else1427
	call inject_big
	jmp endif1427
else1427:
	cmpl $3, %ebx
	jne else1428
	call inject_big
	jmp endif1428
else1428:
endif1428:
endif1427:
endif1426:
endif1425:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ebx, %ebx
	pushl %ebx
	call tag
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1429
	call inject_int
	jmp endif1429
else1429:
	cmpl $1, %ebx
	jne else1430
	call inject_bool
	jmp endif1430
else1430:
	cmpl $2, %ebx
	jne else1431
	call inject_big
	jmp endif1431
else1431:
	cmpl $3, %ebx
	jne else1432
	call inject_big
	jmp endif1432
else1432:
endif1432:
endif1431:
endif1430:
endif1429:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl $0, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1433
	call inject_int
	jmp endif1433
else1433:
	cmpl $1, %ebx
	jne else1434
	call inject_bool
	jmp endif1434
else1434:
	cmpl $2, %ebx
	jne else1435
	call inject_big
	jmp endif1435
else1435:
	cmpl $3, %ebx
	jne else1436
	call inject_big
	jmp endif1436
else1436:
endif1436:
endif1435:
endif1434:
endif1433:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ebx
	movl %ecx, %ecx
	movl %ebx, %ebx
	cmpl %ecx, %ebx
	jne else1437
	movl $1, %ecx
	jmp endif1437
else1437:
	movl $0, %ecx
endif1437:
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else1438
	call inject_int
	jmp endif1438
else1438:
	cmpl $1, %ebx
	jne else1439
	call inject_bool
	jmp endif1439
else1439:
	cmpl $2, %ebx
	jne else1440
	call inject_big
	jmp endif1440
else1440:
	cmpl $3, %ebx
	jne else1441
	call inject_big
	jmp endif1441
else1441:
endif1441:
endif1440:
endif1439:
endif1438:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ecx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $0, %eax
	jne else1442
	movl %ebx, %ecx
	jmp endif1442
else1442:
	movl %ebx, %ebx
	movl %ebx, %ecx
endif1442:
	movl %ecx, %ebx
	movl %ebx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $1, %eax
	jne else1443
	movl %ebx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else1444
	call project_int
	jmp endif1444
else1444:
	cmpl $1, %ebx
	jne else1445
	call project_bool
	jmp endif1445
else1445:
	cmpl $2, %ebx
	jne else1446
	call project_big
	jmp endif1446
else1446:
	cmpl $3, %ebx
	jne else1447
	call project_big
	jmp endif1447
else1447:
endif1447:
endif1446:
endif1445:
endif1444:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1448
	call project_int
	jmp endif1448
else1448:
	cmpl $1, %ebx
	jne else1449
	call project_bool
	jmp endif1449
else1449:
	cmpl $2, %ebx
	jne else1450
	call project_big
	jmp endif1450
else1450:
	cmpl $3, %ebx
	jne else1451
	call project_big
	jmp endif1451
else1451:
endif1451:
endif1450:
endif1449:
endif1448:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	movl %ebx, %ecx
	addl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1452
	call inject_int
	jmp endif1452
else1452:
	cmpl $1, %ebx
	jne else1453
	call inject_bool
	jmp endif1453
else1453:
	cmpl $2, %ebx
	jne else1454
	call inject_big
	jmp endif1454
else1454:
	cmpl $3, %ebx
	jne else1455
	call inject_big
	jmp endif1455
else1455:
endif1455:
endif1454:
endif1453:
endif1452:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	movl %ebx, %ecx
	jmp endif1443
else1443:
	movl %ebx, %ebx
	pushl %ebx
	call tag
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1456
	call inject_int
	jmp endif1456
else1456:
	cmpl $1, %ebx
	jne else1457
	call inject_bool
	jmp endif1457
else1457:
	cmpl $2, %ebx
	jne else1458
	call inject_big
	jmp endif1458
else1458:
	cmpl $3, %ebx
	jne else1459
	call inject_big
	jmp endif1459
else1459:
endif1459:
endif1458:
endif1457:
endif1456:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl $1, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1460
	call inject_int
	jmp endif1460
else1460:
	cmpl $1, %ebx
	jne else1461
	call inject_bool
	jmp endif1461
else1461:
	cmpl $2, %ebx
	jne else1462
	call inject_big
	jmp endif1462
else1462:
	cmpl $3, %ebx
	jne else1463
	call inject_big
	jmp endif1463
else1463:
endif1463:
endif1462:
endif1461:
endif1460:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ecx, %ebx
	movl %ebx, %ecx
	cmpl %ebx, %ecx
	jne else1464
	movl $1, %ecx
	jmp endif1464
else1464:
	movl $0, %ecx
endif1464:
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else1465
	call inject_int
	jmp endif1465
else1465:
	cmpl $1, %ebx
	jne else1466
	call inject_bool
	jmp endif1466
else1466:
	cmpl $2, %ebx
	jne else1467
	call inject_big
	jmp endif1467
else1467:
	cmpl $3, %ebx
	jne else1468
	call inject_big
	jmp endif1468
else1468:
endif1468:
endif1467:
endif1466:
endif1465:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %esi
	movl %ebx, %ebx
	pushl %ebx
	call tag
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1469
	call inject_int
	jmp endif1469
else1469:
	cmpl $1, %ebx
	jne else1470
	call inject_bool
	jmp endif1470
else1470:
	cmpl $2, %ebx
	jne else1471
	call inject_big
	jmp endif1471
else1471:
	cmpl $3, %ebx
	jne else1472
	call inject_big
	jmp endif1472
else1472:
endif1472:
endif1471:
endif1470:
endif1469:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl $1, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1473
	call inject_int
	jmp endif1473
else1473:
	cmpl $1, %ebx
	jne else1474
	call inject_bool
	jmp endif1474
else1474:
	cmpl $2, %ebx
	jne else1475
	call inject_big
	jmp endif1475
else1475:
	cmpl $3, %ebx
	jne else1476
	call inject_big
	jmp endif1476
else1476:
endif1476:
endif1475:
endif1474:
endif1473:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %edx, %ebx
	movl %ecx, %ecx
	cmpl %ebx, %ecx
	jne else1477
	movl $1, %ebx
	jmp endif1477
else1477:
	movl $0, %ebx
endif1477:
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else1478
	call inject_int
	jmp endif1478
else1478:
	cmpl $1, %ebx
	jne else1479
	call inject_bool
	jmp endif1479
else1479:
	cmpl $2, %ebx
	jne else1480
	call inject_big
	jmp endif1480
else1480:
	cmpl $3, %ebx
	jne else1481
	call inject_big
	jmp endif1481
else1481:
endif1481:
endif1480:
endif1479:
endif1478:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %esi, %ecx
	pushl %ecx
	call is_true
	addl $4, %esp
	cmpl $0, %eax
	jne else1482
	movl %ecx, %ebx
	jmp endif1482
else1482:
	movl %ebx, %ecx
	movl %ecx, %ebx
endif1482:
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $1, %eax
	jne else1483
	movl %ebx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else1484
	call project_int
	jmp endif1484
else1484:
	cmpl $1, %ebx
	jne else1485
	call project_bool
	jmp endif1485
else1485:
	cmpl $2, %ebx
	jne else1486
	call project_big
	jmp endif1486
else1486:
	cmpl $3, %ebx
	jne else1487
	call project_big
	jmp endif1487
else1487:
endif1487:
endif1486:
endif1485:
endif1484:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ebx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else1488
	call project_int
	jmp endif1488
else1488:
	cmpl $1, %ebx
	jne else1489
	call project_bool
	jmp endif1489
else1489:
	cmpl $2, %ebx
	jne else1490
	call project_big
	jmp endif1490
else1490:
	cmpl $3, %ebx
	jne else1491
	call project_big
	jmp endif1491
else1491:
endif1491:
endif1490:
endif1489:
endif1488:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %ecx, %ebx
	movl %edx, %ecx
	addl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1492
	call inject_int
	jmp endif1492
else1492:
	cmpl $1, %ebx
	jne else1493
	call inject_bool
	jmp endif1493
else1493:
	cmpl $2, %ebx
	jne else1494
	call inject_big
	jmp endif1494
else1494:
	cmpl $3, %ebx
	jne else1495
	call inject_big
	jmp endif1495
else1495:
endif1495:
endif1494:
endif1493:
endif1492:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ecx
	jmp endif1483
else1483:
	movl %ebx, %ebx
	pushl %ebx
	call tag
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1496
	call inject_int
	jmp endif1496
else1496:
	cmpl $1, %ebx
	jne else1497
	call inject_bool
	jmp endif1497
else1497:
	cmpl $2, %ebx
	jne else1498
	call inject_big
	jmp endif1498
else1498:
	cmpl $3, %ebx
	jne else1499
	call inject_big
	jmp endif1499
else1499:
endif1499:
endif1498:
endif1497:
endif1496:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl $3, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1500
	call inject_int
	jmp endif1500
else1500:
	cmpl $1, %ebx
	jne else1501
	call inject_bool
	jmp endif1501
else1501:
	cmpl $2, %ebx
	jne else1502
	call inject_big
	jmp endif1502
else1502:
	cmpl $3, %ebx
	jne else1503
	call inject_big
	jmp endif1503
else1503:
endif1503:
endif1502:
endif1501:
endif1500:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %ecx, %ebx
	movl %edx, %ecx
	cmpl %ebx, %ecx
	jne else1504
	movl $1, %ecx
	jmp endif1504
else1504:
	movl $0, %ecx
endif1504:
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else1505
	call inject_int
	jmp endif1505
else1505:
	cmpl $1, %ebx
	jne else1506
	call inject_bool
	jmp endif1506
else1506:
	cmpl $2, %ebx
	jne else1507
	call inject_big
	jmp endif1507
else1507:
	cmpl $3, %ebx
	jne else1508
	call inject_big
	jmp endif1508
else1508:
endif1508:
endif1507:
endif1506:
endif1505:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %ebx, %ebx
	pushl %ebx
	call tag
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1509
	call inject_int
	jmp endif1509
else1509:
	cmpl $1, %ebx
	jne else1510
	call inject_bool
	jmp endif1510
else1510:
	cmpl $2, %ebx
	jne else1511
	call inject_big
	jmp endif1511
else1511:
	cmpl $3, %ebx
	jne else1512
	call inject_big
	jmp endif1512
else1512:
endif1512:
endif1511:
endif1510:
endif1509:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl $3, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1513
	call inject_int
	jmp endif1513
else1513:
	cmpl $1, %ebx
	jne else1514
	call inject_bool
	jmp endif1514
else1514:
	cmpl $2, %ebx
	jne else1515
	call inject_big
	jmp endif1515
else1515:
	cmpl $3, %ebx
	jne else1516
	call inject_big
	jmp endif1516
else1516:
endif1516:
endif1515:
endif1514:
endif1513:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %edx, %ecx
	movl %ecx, %ebx
	cmpl %ecx, %ebx
	jne else1517
	movl $1, %ebx
	jmp endif1517
else1517:
	movl $0, %ebx
endif1517:
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else1518
	call inject_int
	jmp endif1518
else1518:
	cmpl $1, %ebx
	jne else1519
	call inject_bool
	jmp endif1519
else1519:
	cmpl $2, %ebx
	jne else1520
	call inject_big
	jmp endif1520
else1520:
	cmpl $3, %ebx
	jne else1521
	call inject_big
	jmp endif1521
else1521:
endif1521:
endif1520:
endif1519:
endif1518:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %edx, %ecx
	pushl %ecx
	call is_true
	addl $4, %esp
	cmpl $0, %eax
	jne else1522
	movl %ecx, %ebx
	jmp endif1522
else1522:
	movl %ecx, %ecx
	movl %ecx, %ebx
endif1522:
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $1, %eax
	jne else1523
	movl %ebx, %ebx
	pushl %ebx
	movl $3, %ebx
	cmpl $0, %ebx
	jne else1524
	call project_int
	jmp endif1524
else1524:
	cmpl $1, %ebx
	jne else1525
	call project_bool
	jmp endif1525
else1525:
	cmpl $2, %ebx
	jne else1526
	call project_big
	jmp endif1526
else1526:
	cmpl $3, %ebx
	jne else1527
	call project_big
	jmp endif1527
else1527:
endif1527:
endif1526:
endif1525:
endif1524:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ebx, %ebx
	pushl %ebx
	movl $3, %ebx
	cmpl $0, %ebx
	jne else1528
	call project_int
	jmp endif1528
else1528:
	cmpl $1, %ebx
	jne else1529
	call project_bool
	jmp endif1529
else1529:
	cmpl $2, %ebx
	jne else1530
	call project_big
	jmp endif1530
else1530:
	cmpl $3, %ebx
	jne else1531
	call project_big
	jmp endif1531
else1531:
endif1531:
endif1530:
endif1529:
endif1528:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %ecx, %ebx
	movl %edx, %ecx
	pushl %ecx
	pushl %ebx
	call add
	addl $8, %esp
	movl %eax, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $3, %ebx
	cmpl $0, %ebx
	jne else1532
	call inject_int
	jmp endif1532
else1532:
	cmpl $1, %ebx
	jne else1533
	call inject_bool
	jmp endif1533
else1533:
	cmpl $2, %ebx
	jne else1534
	call inject_big
	jmp endif1534
else1534:
	cmpl $3, %ebx
	jne else1535
	call inject_big
	jmp endif1535
else1535:
endif1535:
endif1534:
endif1533:
endif1532:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ecx
	jmp endif1523
else1523:
	movl -12(%ebp), %ebx
	call type_error
	movl %eax, %ebx
	addl $0, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ecx
endif1523:
	movl %ecx, %ebx
	movl %ebx, %ecx
endif1483:
	movl %ecx, %ebx
	movl %ebx, %ecx
endif1443:
	movl %ecx, %ebx
	movl %ebx, %ecx
endif1403:
	movl %ecx, %ebx
	movl %ebx, %ecx
endif1363:
	movl %ecx, %ebx
	movl %ebx, %esi
	movl $2, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1536
	call inject_int
	jmp endif1536
else1536:
	cmpl $1, %ebx
	jne else1537
	call inject_bool
	jmp endif1537
else1537:
	cmpl $2, %ebx
	jne else1538
	call inject_big
	jmp endif1538
else1538:
	cmpl $3, %ebx
	jne else1539
	call inject_big
	jmp endif1539
else1539:
endif1539:
endif1538:
endif1537:
endif1536:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %esi
	movl $5, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1540
	call inject_int
	jmp endif1540
else1540:
	cmpl $1, %ebx
	jne else1541
	call inject_bool
	jmp endif1541
else1541:
	cmpl $2, %ebx
	jne else1542
	call inject_big
	jmp endif1542
else1542:
	cmpl $3, %ebx
	jne else1543
	call inject_big
	jmp endif1543
else1543:
endif1543:
endif1542:
endif1541:
endif1540:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	call tag
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1544
	call inject_int
	jmp endif1544
else1544:
	cmpl $1, %ebx
	jne else1545
	call inject_bool
	jmp endif1545
else1545:
	cmpl $2, %ebx
	jne else1546
	call inject_big
	jmp endif1546
else1546:
	cmpl $3, %ebx
	jne else1547
	call inject_big
	jmp endif1547
else1547:
endif1547:
endif1546:
endif1545:
endif1544:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl $0, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1548
	call inject_int
	jmp endif1548
else1548:
	cmpl $1, %ebx
	jne else1549
	call inject_bool
	jmp endif1549
else1549:
	cmpl $2, %ebx
	jne else1550
	call inject_big
	jmp endif1550
else1550:
	cmpl $3, %ebx
	jne else1551
	call inject_big
	jmp endif1551
else1551:
endif1551:
endif1550:
endif1549:
endif1548:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ecx, %ecx
	movl %ebx, %ebx
	cmpl %ecx, %ebx
	jne else1552
	movl $1, %ebx
	jmp endif1552
else1552:
	movl $0, %ebx
endif1552:
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else1553
	call inject_int
	jmp endif1553
else1553:
	cmpl $1, %ebx
	jne else1554
	call inject_bool
	jmp endif1554
else1554:
	cmpl $2, %ebx
	jne else1555
	call inject_big
	jmp endif1555
else1555:
	cmpl $3, %ebx
	jne else1556
	call inject_big
	jmp endif1556
else1556:
endif1556:
endif1555:
endif1554:
endif1553:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $1, %eax
	jne else1557
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1558
	call project_int
	jmp endif1558
else1558:
	cmpl $1, %ebx
	jne else1559
	call project_bool
	jmp endif1559
else1559:
	cmpl $2, %ebx
	jne else1560
	call project_big
	jmp endif1560
else1560:
	cmpl $3, %ebx
	jne else1561
	call project_big
	jmp endif1561
else1561:
endif1561:
endif1560:
endif1559:
endif1558:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	negl %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1562
	call inject_int
	jmp endif1562
else1562:
	cmpl $1, %ebx
	jne else1563
	call inject_bool
	jmp endif1563
else1563:
	cmpl $2, %ebx
	jne else1564
	call inject_big
	jmp endif1564
else1564:
	cmpl $3, %ebx
	jne else1565
	call inject_big
	jmp endif1565
else1565:
endif1565:
endif1564:
endif1563:
endif1562:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	movl %ebx, %ecx
	jmp endif1557
else1557:
	movl %ecx, %ebx
	pushl %ebx
	call tag
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1566
	call inject_int
	jmp endif1566
else1566:
	cmpl $1, %ebx
	jne else1567
	call inject_bool
	jmp endif1567
else1567:
	cmpl $2, %ebx
	jne else1568
	call inject_big
	jmp endif1568
else1568:
	cmpl $3, %ebx
	jne else1569
	call inject_big
	jmp endif1569
else1569:
endif1569:
endif1568:
endif1567:
endif1566:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl $1, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1570
	call inject_int
	jmp endif1570
else1570:
	cmpl $1, %ebx
	jne else1571
	call inject_bool
	jmp endif1571
else1571:
	cmpl $2, %ebx
	jne else1572
	call inject_big
	jmp endif1572
else1572:
	cmpl $3, %ebx
	jne else1573
	call inject_big
	jmp endif1573
else1573:
endif1573:
endif1572:
endif1571:
endif1570:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %edx, %ecx
	movl %edx, %ebx
	cmpl %ecx, %ebx
	jne else1574
	movl $1, %ecx
	jmp endif1574
else1574:
	movl $0, %ecx
endif1574:
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else1575
	call inject_int
	jmp endif1575
else1575:
	cmpl $1, %ebx
	jne else1576
	call inject_bool
	jmp endif1576
else1576:
	cmpl $2, %ebx
	jne else1577
	call inject_big
	jmp endif1577
else1577:
	cmpl $3, %ebx
	jne else1578
	call inject_big
	jmp endif1578
else1578:
endif1578:
endif1577:
endif1576:
endif1575:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $1, %eax
	jne else1579
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else1580
	call project_int
	jmp endif1580
else1580:
	cmpl $1, %ebx
	jne else1581
	call project_bool
	jmp endif1581
else1581:
	cmpl $2, %ebx
	jne else1582
	call project_big
	jmp endif1582
else1582:
	cmpl $3, %ebx
	jne else1583
	call project_big
	jmp endif1583
else1583:
endif1583:
endif1582:
endif1581:
endif1580:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ecx
	negl %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1584
	call inject_int
	jmp endif1584
else1584:
	cmpl $1, %ebx
	jne else1585
	call inject_bool
	jmp endif1585
else1585:
	cmpl $2, %ebx
	jne else1586
	call inject_big
	jmp endif1586
else1586:
	cmpl $3, %ebx
	jne else1587
	call inject_big
	jmp endif1587
else1587:
endif1587:
endif1586:
endif1585:
endif1584:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ebx
	movl %ebx, %ebx
	movl %ebx, %ebx
	jmp endif1579
else1579:
	movl -12(%ebp), %ebx
	call type_error
	movl %eax, %ebx
	addl $0, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
endif1579:
	movl %ebx, %ebx
	movl %ebx, %ecx
endif1557:
	movl %ecx, %ebx
	movl %ebx, %edx
	movl %esi, %ebx
	pushl %ebx
	call tag
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1588
	call inject_int
	jmp endif1588
else1588:
	cmpl $1, %ebx
	jne else1589
	call inject_bool
	jmp endif1589
else1589:
	cmpl $2, %ebx
	jne else1590
	call inject_big
	jmp endif1590
else1590:
	cmpl $3, %ebx
	jne else1591
	call inject_big
	jmp endif1591
else1591:
endif1591:
endif1590:
endif1589:
endif1588:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl $0, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1592
	call inject_int
	jmp endif1592
else1592:
	cmpl $1, %ebx
	jne else1593
	call inject_bool
	jmp endif1593
else1593:
	cmpl $2, %ebx
	jne else1594
	call inject_big
	jmp endif1594
else1594:
	cmpl $3, %ebx
	jne else1595
	call inject_big
	jmp endif1595
else1595:
endif1595:
endif1594:
endif1593:
endif1592:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %ecx, %ebx
	movl %edx, %ecx
	cmpl %ebx, %ecx
	jne else1596
	movl $1, %ecx
	jmp endif1596
else1596:
	movl $0, %ecx
endif1596:
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else1597
	call inject_int
	jmp endif1597
else1597:
	cmpl $1, %ebx
	jne else1598
	call inject_bool
	jmp endif1598
else1598:
	cmpl $2, %ebx
	jne else1599
	call inject_big
	jmp endif1599
else1599:
	cmpl $3, %ebx
	jne else1600
	call inject_big
	jmp endif1600
else1600:
endif1600:
endif1599:
endif1598:
endif1597:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %esi
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
	jne else1601
	call inject_int
	jmp endif1601
else1601:
	cmpl $1, %ebx
	jne else1602
	call inject_bool
	jmp endif1602
else1602:
	cmpl $2, %ebx
	jne else1603
	call inject_big
	jmp endif1603
else1603:
	cmpl $3, %ebx
	jne else1604
	call inject_big
	jmp endif1604
else1604:
endif1604:
endif1603:
endif1602:
endif1601:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl $0, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1605
	call inject_int
	jmp endif1605
else1605:
	cmpl $1, %ebx
	jne else1606
	call inject_bool
	jmp endif1606
else1606:
	cmpl $2, %ebx
	jne else1607
	call inject_big
	jmp endif1607
else1607:
	cmpl $3, %ebx
	jne else1608
	call inject_big
	jmp endif1608
else1608:
endif1608:
endif1607:
endif1606:
endif1605:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %edx, %ecx
	movl %edx, %ebx
	cmpl %ecx, %ebx
	jne else1609
	movl $1, %ebx
	jmp endif1609
else1609:
	movl $0, %ebx
endif1609:
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else1610
	call inject_int
	jmp endif1610
else1610:
	cmpl $1, %ebx
	jne else1611
	call inject_bool
	jmp endif1611
else1611:
	cmpl $2, %ebx
	jne else1612
	call inject_big
	jmp endif1612
else1612:
	cmpl $3, %ebx
	jne else1613
	call inject_big
	jmp endif1613
else1613:
endif1613:
endif1612:
endif1611:
endif1610:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %esi, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $0, %eax
	jne else1614
	movl %ebx, %ecx
	jmp endif1614
else1614:
	movl %edx, %ebx
	movl %ebx, %ecx
endif1614:
	movl %ecx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $1, %eax
	jne else1615
	movl %esi, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1616
	call project_int
	jmp endif1616
else1616:
	cmpl $1, %ebx
	jne else1617
	call project_bool
	jmp endif1617
else1617:
	cmpl $2, %ebx
	jne else1618
	call project_big
	jmp endif1618
else1618:
	cmpl $3, %ebx
	jne else1619
	call project_big
	jmp endif1619
else1619:
endif1619:
endif1618:
endif1617:
endif1616:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %edx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1620
	call project_int
	jmp endif1620
else1620:
	cmpl $1, %ebx
	jne else1621
	call project_bool
	jmp endif1621
else1621:
	cmpl $2, %ebx
	jne else1622
	call project_big
	jmp endif1622
else1622:
	cmpl $3, %ebx
	jne else1623
	call project_big
	jmp endif1623
else1623:
endif1623:
endif1622:
endif1621:
endif1620:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %ebx, %ebx
	movl %edx, %ecx
	addl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1624
	call inject_int
	jmp endif1624
else1624:
	cmpl $1, %ebx
	jne else1625
	call inject_bool
	jmp endif1625
else1625:
	cmpl $2, %ebx
	jne else1626
	call inject_big
	jmp endif1626
else1626:
	cmpl $3, %ebx
	jne else1627
	call inject_big
	jmp endif1627
else1627:
endif1627:
endif1626:
endif1625:
endif1624:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ecx
	jmp endif1615
else1615:
	movl %esi, %ebx
	pushl %ebx
	call tag
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1628
	call inject_int
	jmp endif1628
else1628:
	cmpl $1, %ebx
	jne else1629
	call inject_bool
	jmp endif1629
else1629:
	cmpl $2, %ebx
	jne else1630
	call inject_big
	jmp endif1630
else1630:
	cmpl $3, %ebx
	jne else1631
	call inject_big
	jmp endif1631
else1631:
endif1631:
endif1630:
endif1629:
endif1628:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl $0, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1632
	call inject_int
	jmp endif1632
else1632:
	cmpl $1, %ebx
	jne else1633
	call inject_bool
	jmp endif1633
else1633:
	cmpl $2, %ebx
	jne else1634
	call inject_big
	jmp endif1634
else1634:
	cmpl $3, %ebx
	jne else1635
	call inject_big
	jmp endif1635
else1635:
endif1635:
endif1634:
endif1633:
endif1632:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	movl %ebx, %ecx
	cmpl %ebx, %ecx
	jne else1636
	movl $1, %ebx
	jmp endif1636
else1636:
	movl $0, %ebx
endif1636:
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else1637
	call inject_int
	jmp endif1637
else1637:
	cmpl $1, %ebx
	jne else1638
	call inject_bool
	jmp endif1638
else1638:
	cmpl $2, %ebx
	jne else1639
	call inject_big
	jmp endif1639
else1639:
	cmpl $3, %ebx
	jne else1640
	call inject_big
	jmp endif1640
else1640:
endif1640:
endif1639:
endif1638:
endif1637:
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
	jne else1641
	call inject_int
	jmp endif1641
else1641:
	cmpl $1, %ebx
	jne else1642
	call inject_bool
	jmp endif1642
else1642:
	cmpl $2, %ebx
	jne else1643
	call inject_big
	jmp endif1643
else1643:
	cmpl $3, %ebx
	jne else1644
	call inject_big
	jmp endif1644
else1644:
endif1644:
endif1643:
endif1642:
endif1641:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl $1, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1645
	call inject_int
	jmp endif1645
else1645:
	cmpl $1, %ebx
	jne else1646
	call inject_bool
	jmp endif1646
else1646:
	cmpl $2, %ebx
	jne else1647
	call inject_big
	jmp endif1647
else1647:
	cmpl $3, %ebx
	jne else1648
	call inject_big
	jmp endif1648
else1648:
endif1648:
endif1647:
endif1646:
endif1645:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %ecx, %ebx
	movl %edx, %ecx
	cmpl %ebx, %ecx
	jne else1649
	movl $1, %ebx
	jmp endif1649
else1649:
	movl $0, %ebx
endif1649:
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else1650
	call inject_int
	jmp endif1650
else1650:
	cmpl $1, %ebx
	jne else1651
	call inject_bool
	jmp endif1651
else1651:
	cmpl $2, %ebx
	jne else1652
	call inject_big
	jmp endif1652
else1652:
	cmpl $3, %ebx
	jne else1653
	call inject_big
	jmp endif1653
else1653:
endif1653:
endif1652:
endif1651:
endif1650:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %ecx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $0, %eax
	jne else1654
	movl %ebx, %ebx
	jmp endif1654
else1654:
	movl %edx, %ecx
	movl %ecx, %ebx
endif1654:
	movl %ebx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $1, %eax
	jne else1655
	movl %esi, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1656
	call project_int
	jmp endif1656
else1656:
	cmpl $1, %ebx
	jne else1657
	call project_bool
	jmp endif1657
else1657:
	cmpl $2, %ebx
	jne else1658
	call project_big
	jmp endif1658
else1658:
	cmpl $3, %ebx
	jne else1659
	call project_big
	jmp endif1659
else1659:
endif1659:
endif1658:
endif1657:
endif1656:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %edx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else1660
	call project_int
	jmp endif1660
else1660:
	cmpl $1, %ebx
	jne else1661
	call project_bool
	jmp endif1661
else1661:
	cmpl $2, %ebx
	jne else1662
	call project_big
	jmp endif1662
else1662:
	cmpl $3, %ebx
	jne else1663
	call project_big
	jmp endif1663
else1663:
endif1663:
endif1662:
endif1661:
endif1660:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ebx
	movl %ecx, %ebx
	movl %ebx, %ecx
	addl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1664
	call inject_int
	jmp endif1664
else1664:
	cmpl $1, %ebx
	jne else1665
	call inject_bool
	jmp endif1665
else1665:
	cmpl $2, %ebx
	jne else1666
	call inject_big
	jmp endif1666
else1666:
	cmpl $3, %ebx
	jne else1667
	call inject_big
	jmp endif1667
else1667:
endif1667:
endif1666:
endif1665:
endif1664:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ebx
	movl %ebx, %ebx
	movl %ebx, %ebx
	jmp endif1655
else1655:
	movl %esi, %ebx
	pushl %ebx
	call tag
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1668
	call inject_int
	jmp endif1668
else1668:
	cmpl $1, %ebx
	jne else1669
	call inject_bool
	jmp endif1669
else1669:
	cmpl $2, %ebx
	jne else1670
	call inject_big
	jmp endif1670
else1670:
	cmpl $3, %ebx
	jne else1671
	call inject_big
	jmp endif1671
else1671:
endif1671:
endif1670:
endif1669:
endif1668:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl $1, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1672
	call inject_int
	jmp endif1672
else1672:
	cmpl $1, %ebx
	jne else1673
	call inject_bool
	jmp endif1673
else1673:
	cmpl $2, %ebx
	jne else1674
	call inject_big
	jmp endif1674
else1674:
	cmpl $3, %ebx
	jne else1675
	call inject_big
	jmp endif1675
else1675:
endif1675:
endif1674:
endif1673:
endif1672:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ebx
	movl %ecx, %ecx
	movl %ebx, %ebx
	cmpl %ecx, %ebx
	jne else1676
	movl $1, %ecx
	jmp endif1676
else1676:
	movl $0, %ecx
endif1676:
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else1677
	call inject_int
	jmp endif1677
else1677:
	cmpl $1, %ebx
	jne else1678
	call inject_bool
	jmp endif1678
else1678:
	cmpl $2, %ebx
	jne else1679
	call inject_big
	jmp endif1679
else1679:
	cmpl $3, %ebx
	jne else1680
	call inject_big
	jmp endif1680
else1680:
endif1680:
endif1679:
endif1678:
endif1677:
	movl %eax, %ebx
	addl $4, %esp
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
	jne else1681
	call inject_int
	jmp endif1681
else1681:
	cmpl $1, %ebx
	jne else1682
	call inject_bool
	jmp endif1682
else1682:
	cmpl $2, %ebx
	jne else1683
	call inject_big
	jmp endif1683
else1683:
	cmpl $3, %ebx
	jne else1684
	call inject_big
	jmp endif1684
else1684:
endif1684:
endif1683:
endif1682:
endif1681:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl $0, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1685
	call inject_int
	jmp endif1685
else1685:
	cmpl $1, %ebx
	jne else1686
	call inject_bool
	jmp endif1686
else1686:
	cmpl $2, %ebx
	jne else1687
	call inject_big
	jmp endif1687
else1687:
	cmpl $3, %ebx
	jne else1688
	call inject_big
	jmp endif1688
else1688:
endif1688:
endif1687:
endif1686:
endif1685:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ebx
	movl %ecx, %ebx
	movl %ebx, %ecx
	cmpl %ebx, %ecx
	jne else1689
	movl $1, %ecx
	jmp endif1689
else1689:
	movl $0, %ecx
endif1689:
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else1690
	call inject_int
	jmp endif1690
else1690:
	cmpl $1, %ebx
	jne else1691
	call inject_bool
	jmp endif1691
else1691:
	cmpl $2, %ebx
	jne else1692
	call inject_big
	jmp endif1692
else1692:
	cmpl $3, %ebx
	jne else1693
	call inject_big
	jmp endif1693
else1693:
endif1693:
endif1692:
endif1691:
endif1690:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %edx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $0, %eax
	jne else1694
	movl %ebx, %ecx
	jmp endif1694
else1694:
	movl %edx, %ebx
	movl %ebx, %ecx
endif1694:
	movl %ecx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $1, %eax
	jne else1695
	movl %esi, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else1696
	call project_int
	jmp endif1696
else1696:
	cmpl $1, %ebx
	jne else1697
	call project_bool
	jmp endif1697
else1697:
	cmpl $2, %ebx
	jne else1698
	call project_big
	jmp endif1698
else1698:
	cmpl $3, %ebx
	jne else1699
	call project_big
	jmp endif1699
else1699:
endif1699:
endif1698:
endif1697:
endif1696:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %edx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1700
	call project_int
	jmp endif1700
else1700:
	cmpl $1, %ebx
	jne else1701
	call project_bool
	jmp endif1701
else1701:
	cmpl $2, %ebx
	jne else1702
	call project_big
	jmp endif1702
else1702:
	cmpl $3, %ebx
	jne else1703
	call project_big
	jmp endif1703
else1703:
endif1703:
endif1702:
endif1701:
endif1700:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	movl %ebx, %ebx
	addl %ebx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1704
	call inject_int
	jmp endif1704
else1704:
	cmpl $1, %ebx
	jne else1705
	call inject_bool
	jmp endif1705
else1705:
	cmpl $2, %ebx
	jne else1706
	call inject_big
	jmp endif1706
else1706:
	cmpl $3, %ebx
	jne else1707
	call inject_big
	jmp endif1707
else1707:
endif1707:
endif1706:
endif1705:
endif1704:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	jmp endif1695
else1695:
	movl %esi, %ebx
	pushl %ebx
	call tag
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1708
	call inject_int
	jmp endif1708
else1708:
	cmpl $1, %ebx
	jne else1709
	call inject_bool
	jmp endif1709
else1709:
	cmpl $2, %ebx
	jne else1710
	call inject_big
	jmp endif1710
else1710:
	cmpl $3, %ebx
	jne else1711
	call inject_big
	jmp endif1711
else1711:
endif1711:
endif1710:
endif1709:
endif1708:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl $1, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1712
	call inject_int
	jmp endif1712
else1712:
	cmpl $1, %ebx
	jne else1713
	call inject_bool
	jmp endif1713
else1713:
	cmpl $2, %ebx
	jne else1714
	call inject_big
	jmp endif1714
else1714:
	cmpl $3, %ebx
	jne else1715
	call inject_big
	jmp endif1715
else1715:
endif1715:
endif1714:
endif1713:
endif1712:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ecx, %ecx
	movl %ebx, %ebx
	cmpl %ecx, %ebx
	jne else1716
	movl $1, %ecx
	jmp endif1716
else1716:
	movl $0, %ecx
endif1716:
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else1717
	call inject_int
	jmp endif1717
else1717:
	cmpl $1, %ebx
	jne else1718
	call inject_bool
	jmp endif1718
else1718:
	cmpl $2, %ebx
	jne else1719
	call inject_big
	jmp endif1719
else1719:
	cmpl $3, %ebx
	jne else1720
	call inject_big
	jmp endif1720
else1720:
endif1720:
endif1719:
endif1718:
endif1717:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
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
	jne else1721
	call inject_int
	jmp endif1721
else1721:
	cmpl $1, %ebx
	jne else1722
	call inject_bool
	jmp endif1722
else1722:
	cmpl $2, %ebx
	jne else1723
	call inject_big
	jmp endif1723
else1723:
	cmpl $3, %ebx
	jne else1724
	call inject_big
	jmp endif1724
else1724:
endif1724:
endif1723:
endif1722:
endif1721:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %esi
	movl $1, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1725
	call inject_int
	jmp endif1725
else1725:
	cmpl $1, %ebx
	jne else1726
	call inject_bool
	jmp endif1726
else1726:
	cmpl $2, %ebx
	jne else1727
	call inject_big
	jmp endif1727
else1727:
	cmpl $3, %ebx
	jne else1728
	call inject_big
	jmp endif1728
else1728:
endif1728:
endif1727:
endif1726:
endif1725:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %esi, %ecx
	movl %edx, %ebx
	cmpl %ecx, %ebx
	jne else1729
	movl $1, %ebx
	jmp endif1729
else1729:
	movl $0, %ebx
endif1729:
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else1730
	call inject_int
	jmp endif1730
else1730:
	cmpl $1, %ebx
	jne else1731
	call inject_bool
	jmp endif1731
else1731:
	cmpl $2, %ebx
	jne else1732
	call inject_big
	jmp endif1732
else1732:
	cmpl $3, %ebx
	jne else1733
	call inject_big
	jmp endif1733
else1733:
endif1733:
endif1732:
endif1731:
endif1730:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %ebx, %ecx
	pushl %ecx
	call is_true
	addl $4, %esp
	cmpl $0, %eax
	jne else1734
	movl %ecx, %ebx
	jmp endif1734
else1734:
	movl %edx, %ecx
	movl %ecx, %ebx
endif1734:
	movl %ebx, %ebx
	movl %ebx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $1, %eax
	jne else1735
	movl %esi, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else1736
	call project_int
	jmp endif1736
else1736:
	cmpl $1, %ebx
	jne else1737
	call project_bool
	jmp endif1737
else1737:
	cmpl $2, %ebx
	jne else1738
	call project_big
	jmp endif1738
else1738:
	cmpl $3, %ebx
	jne else1739
	call project_big
	jmp endif1739
else1739:
endif1739:
endif1738:
endif1737:
endif1736:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %edx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else1740
	call project_int
	jmp endif1740
else1740:
	cmpl $1, %ebx
	jne else1741
	call project_bool
	jmp endif1741
else1741:
	cmpl $2, %ebx
	jne else1742
	call project_big
	jmp endif1742
else1742:
	cmpl $3, %ebx
	jne else1743
	call project_big
	jmp endif1743
else1743:
endif1743:
endif1742:
endif1741:
endif1740:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	movl %ebx, %ebx
	addl %ebx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1744
	call inject_int
	jmp endif1744
else1744:
	cmpl $1, %ebx
	jne else1745
	call inject_bool
	jmp endif1745
else1745:
	cmpl $2, %ebx
	jne else1746
	call inject_big
	jmp endif1746
else1746:
	cmpl $3, %ebx
	jne else1747
	call inject_big
	jmp endif1747
else1747:
endif1747:
endif1746:
endif1745:
endif1744:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
	jmp endif1735
else1735:
	movl %esi, %ebx
	pushl %ebx
	call tag
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1748
	call inject_int
	jmp endif1748
else1748:
	cmpl $1, %ebx
	jne else1749
	call inject_bool
	jmp endif1749
else1749:
	cmpl $2, %ebx
	jne else1750
	call inject_big
	jmp endif1750
else1750:
	cmpl $3, %ebx
	jne else1751
	call inject_big
	jmp endif1751
else1751:
endif1751:
endif1750:
endif1749:
endif1748:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %esi
	movl $3, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1752
	call inject_int
	jmp endif1752
else1752:
	cmpl $1, %ebx
	jne else1753
	call inject_bool
	jmp endif1753
else1753:
	cmpl $2, %ebx
	jne else1754
	call inject_big
	jmp endif1754
else1754:
	cmpl $3, %ebx
	jne else1755
	call inject_big
	jmp endif1755
else1755:
endif1755:
endif1754:
endif1753:
endif1752:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %esi, %ecx
	movl %edx, %ebx
	cmpl %ecx, %ebx
	jne else1756
	movl $1, %ebx
	jmp endif1756
else1756:
	movl $0, %ebx
endif1756:
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else1757
	call inject_int
	jmp endif1757
else1757:
	cmpl $1, %ebx
	jne else1758
	call inject_bool
	jmp endif1758
else1758:
	cmpl $2, %ebx
	jne else1759
	call inject_big
	jmp endif1759
else1759:
	cmpl $3, %ebx
	jne else1760
	call inject_big
	jmp endif1760
else1760:
endif1760:
endif1759:
endif1758:
endif1757:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %edx, %ebx
	pushl %ebx
	call tag
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1761
	call inject_int
	jmp endif1761
else1761:
	cmpl $1, %ebx
	jne else1762
	call inject_bool
	jmp endif1762
else1762:
	cmpl $2, %ebx
	jne else1763
	call inject_big
	jmp endif1763
else1763:
	cmpl $3, %ebx
	jne else1764
	call inject_big
	jmp endif1764
else1764:
endif1764:
endif1763:
endif1762:
endif1761:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl $3, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1765
	call inject_int
	jmp endif1765
else1765:
	cmpl $1, %ebx
	jne else1766
	call inject_bool
	jmp endif1766
else1766:
	cmpl $2, %ebx
	jne else1767
	call inject_big
	jmp endif1767
else1767:
	cmpl $3, %ebx
	jne else1768
	call inject_big
	jmp endif1768
else1768:
endif1768:
endif1767:
endif1766:
endif1765:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ecx, %ecx
	movl %ebx, %ebx
	cmpl %ecx, %ebx
	jne else1769
	movl $1, %ecx
	jmp endif1769
else1769:
	movl $0, %ecx
endif1769:
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else1770
	call inject_int
	jmp endif1770
else1770:
	cmpl $1, %ebx
	jne else1771
	call inject_bool
	jmp endif1771
else1771:
	cmpl $2, %ebx
	jne else1772
	call inject_big
	jmp endif1772
else1772:
	cmpl $3, %ebx
	jne else1773
	call inject_big
	jmp endif1773
else1773:
endif1773:
endif1772:
endif1771:
endif1770:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %edx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $0, %eax
	jne else1774
	movl %ebx, %ebx
	jmp endif1774
else1774:
	movl %edx, %ecx
	movl %ecx, %ebx
endif1774:
	movl %ebx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $1, %eax
	jne else1775
	movl %esi, %ebx
	pushl %ebx
	movl $3, %ebx
	cmpl $0, %ebx
	jne else1776
	call project_int
	jmp endif1776
else1776:
	cmpl $1, %ebx
	jne else1777
	call project_bool
	jmp endif1777
else1777:
	cmpl $2, %ebx
	jne else1778
	call project_big
	jmp endif1778
else1778:
	cmpl $3, %ebx
	jne else1779
	call project_big
	jmp endif1779
else1779:
endif1779:
endif1778:
endif1777:
endif1776:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ebx
	movl %edx, %ebx
	pushl %ebx
	movl $3, %ebx
	cmpl $0, %ebx
	jne else1780
	call project_int
	jmp endif1780
else1780:
	cmpl $1, %ebx
	jne else1781
	call project_bool
	jmp endif1781
else1781:
	cmpl $2, %ebx
	jne else1782
	call project_big
	jmp endif1782
else1782:
	cmpl $3, %ebx
	jne else1783
	call project_big
	jmp endif1783
else1783:
endif1783:
endif1782:
endif1781:
endif1780:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	movl %ebx, %ecx
	pushl %ecx
	pushl %ebx
	call add
	addl $8, %esp
	movl %eax, %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $3, %ebx
	cmpl $0, %ebx
	jne else1784
	call inject_int
	jmp endif1784
else1784:
	cmpl $1, %ebx
	jne else1785
	call inject_bool
	jmp endif1785
else1785:
	cmpl $2, %ebx
	jne else1786
	call inject_big
	jmp endif1786
else1786:
	cmpl $3, %ebx
	jne else1787
	call inject_big
	jmp endif1787
else1787:
endif1787:
endif1786:
endif1785:
endif1784:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
	jmp endif1775
else1775:
	movl -12(%ebp), %ebx
	call type_error
	movl %eax, %ecx
	addl $0, %esp
	movl %ecx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
endif1775:
	movl %ebx, %ecx
	movl %ecx, %ebx
endif1735:
	movl %ebx, %ecx
	movl %ecx, %ebx
endif1695:
	movl %ebx, %ecx
	movl %ecx, %ebx
endif1655:
	movl %ebx, %ebx
	movl %ebx, %ecx
endif1615:
	movl %ecx, %ebx
	movl %ebx, %ecx
	movl %esi, %ebx
	pushl %ebx
	call print_any
	addl $4, %esp
	movl %ecx, %ebx
	pushl %ebx
	call print_any
	addl $4, %esp
	movl $2, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1788
	call inject_int
	jmp endif1788
else1788:
	cmpl $1, %ebx
	jne else1789
	call inject_bool
	jmp endif1789
else1789:
	cmpl $2, %ebx
	jne else1790
	call inject_big
	jmp endif1790
else1790:
	cmpl $3, %ebx
	jne else1791
	call inject_big
	jmp endif1791
else1791:
endif1791:
endif1790:
endif1789:
endif1788:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ebx
	movl %ebx, %ebx
	movl %ebx, %edx
	movl $2, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1792
	call inject_int
	jmp endif1792
else1792:
	cmpl $1, %ebx
	jne else1793
	call inject_bool
	jmp endif1793
else1793:
	cmpl $2, %ebx
	jne else1794
	call inject_big
	jmp endif1794
else1794:
	cmpl $3, %ebx
	jne else1795
	call inject_big
	jmp endif1795
else1795:
endif1795:
endif1794:
endif1793:
endif1792:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
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
	jne else1796
	call inject_int
	jmp endif1796
else1796:
	cmpl $1, %ebx
	jne else1797
	call inject_bool
	jmp endif1797
else1797:
	cmpl $2, %ebx
	jne else1798
	call inject_big
	jmp endif1798
else1798:
	cmpl $3, %ebx
	jne else1799
	call inject_big
	jmp endif1799
else1799:
endif1799:
endif1798:
endif1797:
endif1796:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl $0, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1800
	call inject_int
	jmp endif1800
else1800:
	cmpl $1, %ebx
	jne else1801
	call inject_bool
	jmp endif1801
else1801:
	cmpl $2, %ebx
	jne else1802
	call inject_big
	jmp endif1802
else1802:
	cmpl $3, %ebx
	jne else1803
	call inject_big
	jmp endif1803
else1803:
endif1803:
endif1802:
endif1801:
endif1800:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ecx, %ecx
	cmpl %ebx, %ecx
	jne else1804
	movl $1, %ecx
	jmp endif1804
else1804:
	movl $0, %ecx
endif1804:
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else1805
	call inject_int
	jmp endif1805
else1805:
	cmpl $1, %ebx
	jne else1806
	call inject_bool
	jmp endif1806
else1806:
	cmpl $2, %ebx
	jne else1807
	call inject_big
	jmp endif1807
else1807:
	cmpl $3, %ebx
	jne else1808
	call inject_big
	jmp endif1808
else1808:
endif1808:
endif1807:
endif1806:
endif1805:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %esi, %ebx
	pushl %ebx
	call tag
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1809
	call inject_int
	jmp endif1809
else1809:
	cmpl $1, %ebx
	jne else1810
	call inject_bool
	jmp endif1810
else1810:
	cmpl $2, %ebx
	jne else1811
	call inject_big
	jmp endif1811
else1811:
	cmpl $3, %ebx
	jne else1812
	call inject_big
	jmp endif1812
else1812:
endif1812:
endif1811:
endif1810:
endif1809:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl $0, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1813
	call inject_int
	jmp endif1813
else1813:
	cmpl $1, %ebx
	jne else1814
	call inject_bool
	jmp endif1814
else1814:
	cmpl $2, %ebx
	jne else1815
	call inject_big
	jmp endif1815
else1815:
	cmpl $3, %ebx
	jne else1816
	call inject_big
	jmp endif1816
else1816:
endif1816:
endif1815:
endif1814:
endif1813:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ecx
	movl %ecx, %ebx
	cmpl %ecx, %ebx
	jne else1817
	movl $1, %ecx
	jmp endif1817
else1817:
	movl $0, %ecx
endif1817:
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else1818
	call inject_int
	jmp endif1818
else1818:
	cmpl $1, %ebx
	jne else1819
	call inject_bool
	jmp endif1819
else1819:
	cmpl $2, %ebx
	jne else1820
	call inject_big
	jmp endif1820
else1820:
	cmpl $3, %ebx
	jne else1821
	call inject_big
	jmp endif1821
else1821:
endif1821:
endif1820:
endif1819:
endif1818:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ebx
	movl %edx, %ecx
	pushl %ecx
	call is_true
	addl $4, %esp
	cmpl $0, %eax
	jne else1822
	movl %ecx, %ebx
	jmp endif1822
else1822:
	movl %ebx, %ecx
	movl %ecx, %ebx
endif1822:
	movl %ebx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $1, %eax
	jne else1823
	movl %edx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1824
	call project_int
	jmp endif1824
else1824:
	cmpl $1, %ebx
	jne else1825
	call project_bool
	jmp endif1825
else1825:
	cmpl $2, %ebx
	jne else1826
	call project_big
	jmp endif1826
else1826:
	cmpl $3, %ebx
	jne else1827
	call project_big
	jmp endif1827
else1827:
endif1827:
endif1826:
endif1825:
endif1824:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %esi, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1828
	call project_int
	jmp endif1828
else1828:
	cmpl $1, %ebx
	jne else1829
	call project_bool
	jmp endif1829
else1829:
	cmpl $2, %ebx
	jne else1830
	call project_big
	jmp endif1830
else1830:
	cmpl $3, %ebx
	jne else1831
	call project_big
	jmp endif1831
else1831:
endif1831:
endif1830:
endif1829:
endif1828:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ecx, %ebx
	addl %ebx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1832
	call inject_int
	jmp endif1832
else1832:
	cmpl $1, %ebx
	jne else1833
	call inject_bool
	jmp endif1833
else1833:
	cmpl $2, %ebx
	jne else1834
	call inject_big
	jmp endif1834
else1834:
	cmpl $3, %ebx
	jne else1835
	call inject_big
	jmp endif1835
else1835:
endif1835:
endif1834:
endif1833:
endif1832:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	movl %ebx, %ecx
	jmp endif1823
else1823:
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
	jne else1836
	call inject_int
	jmp endif1836
else1836:
	cmpl $1, %ebx
	jne else1837
	call inject_bool
	jmp endif1837
else1837:
	cmpl $2, %ebx
	jne else1838
	call inject_big
	jmp endif1838
else1838:
	cmpl $3, %ebx
	jne else1839
	call inject_big
	jmp endif1839
else1839:
endif1839:
endif1838:
endif1837:
endif1836:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl $0, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1840
	call inject_int
	jmp endif1840
else1840:
	cmpl $1, %ebx
	jne else1841
	call inject_bool
	jmp endif1841
else1841:
	cmpl $2, %ebx
	jne else1842
	call inject_big
	jmp endif1842
else1842:
	cmpl $3, %ebx
	jne else1843
	call inject_big
	jmp endif1843
else1843:
endif1843:
endif1842:
endif1841:
endif1840:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ecx
	movl %ebx, %ebx
	cmpl %ecx, %ebx
	jne else1844
	movl $1, %ecx
	jmp endif1844
else1844:
	movl $0, %ecx
endif1844:
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else1845
	call inject_int
	jmp endif1845
else1845:
	cmpl $1, %ebx
	jne else1846
	call inject_bool
	jmp endif1846
else1846:
	cmpl $2, %ebx
	jne else1847
	call inject_big
	jmp endif1847
else1847:
	cmpl $3, %ebx
	jne else1848
	call inject_big
	jmp endif1848
else1848:
endif1848:
endif1847:
endif1846:
endif1845:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %esi, %ebx
	pushl %ebx
	call tag
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1849
	call inject_int
	jmp endif1849
else1849:
	cmpl $1, %ebx
	jne else1850
	call inject_bool
	jmp endif1850
else1850:
	cmpl $2, %ebx
	jne else1851
	call inject_big
	jmp endif1851
else1851:
	cmpl $3, %ebx
	jne else1852
	call inject_big
	jmp endif1852
else1852:
endif1852:
endif1851:
endif1850:
endif1849:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl $1, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1853
	call inject_int
	jmp endif1853
else1853:
	cmpl $1, %ebx
	jne else1854
	call inject_bool
	jmp endif1854
else1854:
	cmpl $2, %ebx
	jne else1855
	call inject_big
	jmp endif1855
else1855:
	cmpl $3, %ebx
	jne else1856
	call inject_big
	jmp endif1856
else1856:
endif1856:
endif1855:
endif1854:
endif1853:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ecx, %ecx
	cmpl %ebx, %ecx
	jne else1857
	movl $1, %ecx
	jmp endif1857
else1857:
	movl $0, %ecx
endif1857:
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else1858
	call inject_int
	jmp endif1858
else1858:
	cmpl $1, %ebx
	jne else1859
	call inject_bool
	jmp endif1859
else1859:
	cmpl $2, %ebx
	jne else1860
	call inject_big
	jmp endif1860
else1860:
	cmpl $3, %ebx
	jne else1861
	call inject_big
	jmp endif1861
else1861:
endif1861:
endif1860:
endif1859:
endif1858:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %edx, %ecx
	pushl %ecx
	call is_true
	addl $4, %esp
	cmpl $0, %eax
	jne else1862
	movl %ecx, %ebx
	jmp endif1862
else1862:
	movl %ebx, %ebx
	movl %ebx, %ebx
endif1862:
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $1, %eax
	jne else1863
	movl %edx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1864
	call project_int
	jmp endif1864
else1864:
	cmpl $1, %ebx
	jne else1865
	call project_bool
	jmp endif1865
else1865:
	cmpl $2, %ebx
	jne else1866
	call project_big
	jmp endif1866
else1866:
	cmpl $3, %ebx
	jne else1867
	call project_big
	jmp endif1867
else1867:
endif1867:
endif1866:
endif1865:
endif1864:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %esi, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else1868
	call project_int
	jmp endif1868
else1868:
	cmpl $1, %ebx
	jne else1869
	call project_bool
	jmp endif1869
else1869:
	cmpl $2, %ebx
	jne else1870
	call project_big
	jmp endif1870
else1870:
	cmpl $3, %ebx
	jne else1871
	call project_big
	jmp endif1871
else1871:
endif1871:
endif1870:
endif1869:
endif1868:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ecx, %ecx
	movl %ebx, %ebx
	addl %ecx, %ebx
	movl %ebx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1872
	call inject_int
	jmp endif1872
else1872:
	cmpl $1, %ebx
	jne else1873
	call inject_bool
	jmp endif1873
else1873:
	cmpl $2, %ebx
	jne else1874
	call inject_big
	jmp endif1874
else1874:
	cmpl $3, %ebx
	jne else1875
	call inject_big
	jmp endif1875
else1875:
endif1875:
endif1874:
endif1873:
endif1872:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ecx
	jmp endif1863
else1863:
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
	jne else1876
	call inject_int
	jmp endif1876
else1876:
	cmpl $1, %ebx
	jne else1877
	call inject_bool
	jmp endif1877
else1877:
	cmpl $2, %ebx
	jne else1878
	call inject_big
	jmp endif1878
else1878:
	cmpl $3, %ebx
	jne else1879
	call inject_big
	jmp endif1879
else1879:
endif1879:
endif1878:
endif1877:
endif1876:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl $1, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1880
	call inject_int
	jmp endif1880
else1880:
	cmpl $1, %ebx
	jne else1881
	call inject_bool
	jmp endif1881
else1881:
	cmpl $2, %ebx
	jne else1882
	call inject_big
	jmp endif1882
else1882:
	cmpl $3, %ebx
	jne else1883
	call inject_big
	jmp endif1883
else1883:
endif1883:
endif1882:
endif1881:
endif1880:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %edx, %ecx
	movl %edx, %ebx
	cmpl %ecx, %ebx
	jne else1884
	movl $1, %ecx
	jmp endif1884
else1884:
	movl $0, %ecx
endif1884:
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else1885
	call inject_int
	jmp endif1885
else1885:
	cmpl $1, %ebx
	jne else1886
	call inject_bool
	jmp endif1886
else1886:
	cmpl $2, %ebx
	jne else1887
	call inject_big
	jmp endif1887
else1887:
	cmpl $3, %ebx
	jne else1888
	call inject_big
	jmp endif1888
else1888:
endif1888:
endif1887:
endif1886:
endif1885:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %esi, %ebx
	pushl %ebx
	call tag
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1889
	call inject_int
	jmp endif1889
else1889:
	cmpl $1, %ebx
	jne else1890
	call inject_bool
	jmp endif1890
else1890:
	cmpl $2, %ebx
	jne else1891
	call inject_big
	jmp endif1891
else1891:
	cmpl $3, %ebx
	jne else1892
	call inject_big
	jmp endif1892
else1892:
endif1892:
endif1891:
endif1890:
endif1889:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl $0, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1893
	call inject_int
	jmp endif1893
else1893:
	cmpl $1, %ebx
	jne else1894
	call inject_bool
	jmp endif1894
else1894:
	cmpl $2, %ebx
	jne else1895
	call inject_big
	jmp endif1895
else1895:
	cmpl $3, %ebx
	jne else1896
	call inject_big
	jmp endif1896
else1896:
endif1896:
endif1895:
endif1894:
endif1893:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ecx
	movl %ebx, %ebx
	cmpl %ecx, %ebx
	jne else1897
	movl $1, %ecx
	jmp endif1897
else1897:
	movl $0, %ecx
endif1897:
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else1898
	call inject_int
	jmp endif1898
else1898:
	cmpl $1, %ebx
	jne else1899
	call inject_bool
	jmp endif1899
else1899:
	cmpl $2, %ebx
	jne else1900
	call inject_big
	jmp endif1900
else1900:
	cmpl $3, %ebx
	jne else1901
	call inject_big
	jmp endif1901
else1901:
endif1901:
endif1900:
endif1899:
endif1898:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ecx, %ecx
	pushl %ecx
	call is_true
	addl $4, %esp
	cmpl $0, %eax
	jne else1902
	movl %ecx, %ebx
	jmp endif1902
else1902:
	movl %ebx, %ecx
	movl %ecx, %ebx
endif1902:
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $1, %eax
	jne else1903
	movl %edx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else1904
	call project_int
	jmp endif1904
else1904:
	cmpl $1, %ebx
	jne else1905
	call project_bool
	jmp endif1905
else1905:
	cmpl $2, %ebx
	jne else1906
	call project_big
	jmp endif1906
else1906:
	cmpl $3, %ebx
	jne else1907
	call project_big
	jmp endif1907
else1907:
endif1907:
endif1906:
endif1905:
endif1904:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %esi, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1908
	call project_int
	jmp endif1908
else1908:
	cmpl $1, %ebx
	jne else1909
	call project_bool
	jmp endif1909
else1909:
	cmpl $2, %ebx
	jne else1910
	call project_big
	jmp endif1910
else1910:
	cmpl $3, %ebx
	jne else1911
	call project_big
	jmp endif1911
else1911:
endif1911:
endif1910:
endif1909:
endif1908:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %ecx, %ebx
	movl %edx, %ecx
	addl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1912
	call inject_int
	jmp endif1912
else1912:
	cmpl $1, %ebx
	jne else1913
	call inject_bool
	jmp endif1913
else1913:
	cmpl $2, %ebx
	jne else1914
	call inject_big
	jmp endif1914
else1914:
	cmpl $3, %ebx
	jne else1915
	call inject_big
	jmp endif1915
else1915:
endif1915:
endif1914:
endif1913:
endif1912:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ecx
	jmp endif1903
else1903:
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
	jne else1916
	call inject_int
	jmp endif1916
else1916:
	cmpl $1, %ebx
	jne else1917
	call inject_bool
	jmp endif1917
else1917:
	cmpl $2, %ebx
	jne else1918
	call inject_big
	jmp endif1918
else1918:
	cmpl $3, %ebx
	jne else1919
	call inject_big
	jmp endif1919
else1919:
endif1919:
endif1918:
endif1917:
endif1916:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %esi
	movl $1, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1920
	call inject_int
	jmp endif1920
else1920:
	cmpl $1, %ebx
	jne else1921
	call inject_bool
	jmp endif1921
else1921:
	cmpl $2, %ebx
	jne else1922
	call inject_big
	jmp endif1922
else1922:
	cmpl $3, %ebx
	jne else1923
	call inject_big
	jmp endif1923
else1923:
endif1923:
endif1922:
endif1921:
endif1920:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %esi, %ecx
	movl %edx, %ebx
	cmpl %ecx, %ebx
	jne else1924
	movl $1, %ecx
	jmp endif1924
else1924:
	movl $0, %ecx
endif1924:
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else1925
	call inject_int
	jmp endif1925
else1925:
	cmpl $1, %ebx
	jne else1926
	call inject_bool
	jmp endif1926
else1926:
	cmpl $2, %ebx
	jne else1927
	call inject_big
	jmp endif1927
else1927:
	cmpl $3, %ebx
	jne else1928
	call inject_big
	jmp endif1928
else1928:
endif1928:
endif1927:
endif1926:
endif1925:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %esi, %ebx
	pushl %ebx
	call tag
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1929
	call inject_int
	jmp endif1929
else1929:
	cmpl $1, %ebx
	jne else1930
	call inject_bool
	jmp endif1930
else1930:
	cmpl $2, %ebx
	jne else1931
	call inject_big
	jmp endif1931
else1931:
	cmpl $3, %ebx
	jne else1932
	call inject_big
	jmp endif1932
else1932:
endif1932:
endif1931:
endif1930:
endif1929:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl $1, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1933
	call inject_int
	jmp endif1933
else1933:
	cmpl $1, %ebx
	jne else1934
	call inject_bool
	jmp endif1934
else1934:
	cmpl $2, %ebx
	jne else1935
	call inject_big
	jmp endif1935
else1935:
	cmpl $3, %ebx
	jne else1936
	call inject_big
	jmp endif1936
else1936:
endif1936:
endif1935:
endif1934:
endif1933:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ecx, %ecx
	movl %ebx, %ebx
	cmpl %ecx, %ebx
	jne else1937
	movl $1, %ecx
	jmp endif1937
else1937:
	movl $0, %ecx
endif1937:
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else1938
	call inject_int
	jmp endif1938
else1938:
	cmpl $1, %ebx
	jne else1939
	call inject_bool
	jmp endif1939
else1939:
	cmpl $2, %ebx
	jne else1940
	call inject_big
	jmp endif1940
else1940:
	cmpl $3, %ebx
	jne else1941
	call inject_big
	jmp endif1941
else1941:
endif1941:
endif1940:
endif1939:
endif1938:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ecx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $0, %eax
	jne else1942
	movl %ebx, %ebx
	jmp endif1942
else1942:
	movl %ebx, %ebx
	movl %ebx, %ebx
endif1942:
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $1, %eax
	jne else1943
	movl %edx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else1944
	call project_int
	jmp endif1944
else1944:
	cmpl $1, %ebx
	jne else1945
	call project_bool
	jmp endif1945
else1945:
	cmpl $2, %ebx
	jne else1946
	call project_big
	jmp endif1946
else1946:
	cmpl $3, %ebx
	jne else1947
	call project_big
	jmp endif1947
else1947:
endif1947:
endif1946:
endif1945:
endif1944:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %esi, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else1948
	call project_int
	jmp endif1948
else1948:
	cmpl $1, %ebx
	jne else1949
	call project_bool
	jmp endif1949
else1949:
	cmpl $2, %ebx
	jne else1950
	call project_big
	jmp endif1950
else1950:
	cmpl $3, %ebx
	jne else1951
	call project_big
	jmp endif1951
else1951:
endif1951:
endif1950:
endif1949:
endif1948:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ecx, %ebx
	addl %ebx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1952
	call inject_int
	jmp endif1952
else1952:
	cmpl $1, %ebx
	jne else1953
	call inject_bool
	jmp endif1953
else1953:
	cmpl $2, %ebx
	jne else1954
	call inject_big
	jmp endif1954
else1954:
	cmpl $3, %ebx
	jne else1955
	call inject_big
	jmp endif1955
else1955:
endif1955:
endif1954:
endif1953:
endif1952:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	movl %ebx, %ecx
	jmp endif1943
else1943:
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
	jne else1956
	call inject_int
	jmp endif1956
else1956:
	cmpl $1, %ebx
	jne else1957
	call inject_bool
	jmp endif1957
else1957:
	cmpl $2, %ebx
	jne else1958
	call inject_big
	jmp endif1958
else1958:
	cmpl $3, %ebx
	jne else1959
	call inject_big
	jmp endif1959
else1959:
endif1959:
endif1958:
endif1957:
endif1956:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl $3, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1960
	call inject_int
	jmp endif1960
else1960:
	cmpl $1, %ebx
	jne else1961
	call inject_bool
	jmp endif1961
else1961:
	cmpl $2, %ebx
	jne else1962
	call inject_big
	jmp endif1962
else1962:
	cmpl $3, %ebx
	jne else1963
	call inject_big
	jmp endif1963
else1963:
endif1963:
endif1962:
endif1961:
endif1960:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	movl %ebx, %ecx
	cmpl %ebx, %ecx
	jne else1964
	movl $1, %ebx
	jmp endif1964
else1964:
	movl $0, %ebx
endif1964:
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else1965
	call inject_int
	jmp endif1965
else1965:
	cmpl $1, %ebx
	jne else1966
	call inject_bool
	jmp endif1966
else1966:
	cmpl $2, %ebx
	jne else1967
	call inject_big
	jmp endif1967
else1967:
	cmpl $3, %ebx
	jne else1968
	call inject_big
	jmp endif1968
else1968:
endif1968:
endif1967:
endif1966:
endif1965:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %esi, %ebx
	pushl %ebx
	call tag
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1969
	call inject_int
	jmp endif1969
else1969:
	cmpl $1, %ebx
	jne else1970
	call inject_bool
	jmp endif1970
else1970:
	cmpl $2, %ebx
	jne else1971
	call inject_big
	jmp endif1971
else1971:
	cmpl $3, %ebx
	jne else1972
	call inject_big
	jmp endif1972
else1972:
endif1972:
endif1971:
endif1970:
endif1969:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl $3, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1973
	call inject_int
	jmp endif1973
else1973:
	cmpl $1, %ebx
	jne else1974
	call inject_bool
	jmp endif1974
else1974:
	cmpl $2, %ebx
	jne else1975
	call inject_big
	jmp endif1975
else1975:
	cmpl $3, %ebx
	jne else1976
	call inject_big
	jmp endif1976
else1976:
endif1976:
endif1975:
endif1974:
endif1973:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ecx, %ecx
	movl %ebx, %ebx
	cmpl %ecx, %ebx
	jne else1977
	movl $1, %ebx
	jmp endif1977
else1977:
	movl $0, %ebx
endif1977:
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else1978
	call inject_int
	jmp endif1978
else1978:
	cmpl $1, %ebx
	jne else1979
	call inject_bool
	jmp endif1979
else1979:
	cmpl $2, %ebx
	jne else1980
	call inject_big
	jmp endif1980
else1980:
	cmpl $3, %ebx
	jne else1981
	call inject_big
	jmp endif1981
else1981:
endif1981:
endif1980:
endif1979:
endif1978:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %ecx, %ecx
	pushl %ecx
	call is_true
	addl $4, %esp
	cmpl $0, %eax
	jne else1982
	movl %ecx, %ebx
	jmp endif1982
else1982:
	movl %edx, %ecx
	movl %ecx, %ebx
endif1982:
	movl %ebx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $1, %eax
	jne else1983
	movl %edx, %ebx
	pushl %ebx
	movl $3, %ebx
	cmpl $0, %ebx
	jne else1984
	call project_int
	jmp endif1984
else1984:
	cmpl $1, %ebx
	jne else1985
	call project_bool
	jmp endif1985
else1985:
	cmpl $2, %ebx
	jne else1986
	call project_big
	jmp endif1986
else1986:
	cmpl $3, %ebx
	jne else1987
	call project_big
	jmp endif1987
else1987:
endif1987:
endif1986:
endif1985:
endif1984:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %esi
	movl %esi, %ebx
	pushl %ebx
	movl $3, %ebx
	cmpl $0, %ebx
	jne else1988
	call project_int
	jmp endif1988
else1988:
	cmpl $1, %ebx
	jne else1989
	call project_bool
	jmp endif1989
else1989:
	cmpl $2, %ebx
	jne else1990
	call project_big
	jmp endif1990
else1990:
	cmpl $3, %ebx
	jne else1991
	call project_big
	jmp endif1991
else1991:
endif1991:
endif1990:
endif1989:
endif1988:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %esi, %ecx
	movl %edx, %ebx
	pushl %ebx
	pushl %ecx
	call add
	addl $8, %esp
	movl %eax, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $3, %ebx
	cmpl $0, %ebx
	jne else1992
	call inject_int
	jmp endif1992
else1992:
	cmpl $1, %ebx
	jne else1993
	call inject_bool
	jmp endif1993
else1993:
	cmpl $2, %ebx
	jne else1994
	call inject_big
	jmp endif1994
else1994:
	cmpl $3, %ebx
	jne else1995
	call inject_big
	jmp endif1995
else1995:
endif1995:
endif1994:
endif1993:
endif1992:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ecx
	jmp endif1983
else1983:
	movl -12(%ebp), %ebx
	call type_error
	movl %eax, %ebx
	addl $0, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ecx
endif1983:
	movl %ecx, %ebx
	movl %ebx, %ecx
endif1943:
	movl %ecx, %ebx
	movl %ebx, %ecx
endif1903:
	movl %ecx, %ebx
	movl %ebx, %ecx
endif1863:
	movl %ecx, %ebx
	movl %ebx, %ecx
endif1823:
	movl %ecx, %ebx
	movl %ebx, -4(%ebp)
	movl $1, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else1996
	call inject_int
	jmp endif1996
else1996:
	cmpl $1, %ebx
	jne else1997
	call inject_bool
	jmp endif1997
else1997:
	cmpl $2, %ebx
	jne else1998
	call inject_big
	jmp endif1998
else1998:
	cmpl $3, %ebx
	jne else1999
	call inject_big
	jmp endif1999
else1999:
endif1999:
endif1998:
endif1997:
endif1996:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	call tag
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2000
	call inject_int
	jmp endif2000
else2000:
	cmpl $1, %ebx
	jne else2001
	call inject_bool
	jmp endif2001
else2001:
	cmpl $2, %ebx
	jne else2002
	call inject_big
	jmp endif2002
else2002:
	cmpl $3, %ebx
	jne else2003
	call inject_big
	jmp endif2003
else2003:
endif2003:
endif2002:
endif2001:
endif2000:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl $0, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2004
	call inject_int
	jmp endif2004
else2004:
	cmpl $1, %ebx
	jne else2005
	call inject_bool
	jmp endif2005
else2005:
	cmpl $2, %ebx
	jne else2006
	call inject_big
	jmp endif2006
else2006:
	cmpl $3, %ebx
	jne else2007
	call inject_big
	jmp endif2007
else2007:
endif2007:
endif2006:
endif2005:
endif2004:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ecx, %ecx
	movl %ebx, %ebx
	cmpl %ecx, %ebx
	jne else2008
	movl $1, %ecx
	jmp endif2008
else2008:
	movl $0, %ecx
endif2008:
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else2009
	call inject_int
	jmp endif2009
else2009:
	cmpl $1, %ebx
	jne else2010
	call inject_bool
	jmp endif2010
else2010:
	cmpl $2, %ebx
	jne else2011
	call inject_big
	jmp endif2011
else2011:
	cmpl $3, %ebx
	jne else2012
	call inject_big
	jmp endif2012
else2012:
endif2012:
endif2011:
endif2010:
endif2009:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $1, %eax
	jne else2013
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2014
	call project_int
	jmp endif2014
else2014:
	cmpl $1, %ebx
	jne else2015
	call project_bool
	jmp endif2015
else2015:
	cmpl $2, %ebx
	jne else2016
	call project_big
	jmp endif2016
else2016:
	cmpl $3, %ebx
	jne else2017
	call project_big
	jmp endif2017
else2017:
endif2017:
endif2016:
endif2015:
endif2014:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ecx
	negl %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2018
	call inject_int
	jmp endif2018
else2018:
	cmpl $1, %ebx
	jne else2019
	call inject_bool
	jmp endif2019
else2019:
	cmpl $2, %ebx
	jne else2020
	call inject_big
	jmp endif2020
else2020:
	cmpl $3, %ebx
	jne else2021
	call inject_big
	jmp endif2021
else2021:
endif2021:
endif2020:
endif2019:
endif2018:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ecx
	jmp endif2013
else2013:
	movl %ecx, %ebx
	pushl %ebx
	call tag
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2022
	call inject_int
	jmp endif2022
else2022:
	cmpl $1, %ebx
	jne else2023
	call inject_bool
	jmp endif2023
else2023:
	cmpl $2, %ebx
	jne else2024
	call inject_big
	jmp endif2024
else2024:
	cmpl $3, %ebx
	jne else2025
	call inject_big
	jmp endif2025
else2025:
endif2025:
endif2024:
endif2023:
endif2022:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl $1, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2026
	call inject_int
	jmp endif2026
else2026:
	cmpl $1, %ebx
	jne else2027
	call inject_bool
	jmp endif2027
else2027:
	cmpl $2, %ebx
	jne else2028
	call inject_big
	jmp endif2028
else2028:
	cmpl $3, %ebx
	jne else2029
	call inject_big
	jmp endif2029
else2029:
endif2029:
endif2028:
endif2027:
endif2026:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ecx, %ecx
	cmpl %ebx, %ecx
	jne else2030
	movl $1, %ecx
	jmp endif2030
else2030:
	movl $0, %ecx
endif2030:
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else2031
	call inject_int
	jmp endif2031
else2031:
	cmpl $1, %ebx
	jne else2032
	call inject_bool
	jmp endif2032
else2032:
	cmpl $2, %ebx
	jne else2033
	call inject_big
	jmp endif2033
else2033:
	cmpl $3, %ebx
	jne else2034
	call inject_big
	jmp endif2034
else2034:
endif2034:
endif2033:
endif2032:
endif2031:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $1, %eax
	jne else2035
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else2036
	call project_int
	jmp endif2036
else2036:
	cmpl $1, %ebx
	jne else2037
	call project_bool
	jmp endif2037
else2037:
	cmpl $2, %ebx
	jne else2038
	call project_big
	jmp endif2038
else2038:
	cmpl $3, %ebx
	jne else2039
	call project_big
	jmp endif2039
else2039:
endif2039:
endif2038:
endif2037:
endif2036:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	negl %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2040
	call inject_int
	jmp endif2040
else2040:
	cmpl $1, %ebx
	jne else2041
	call inject_bool
	jmp endif2041
else2041:
	cmpl $2, %ebx
	jne else2042
	call inject_big
	jmp endif2042
else2042:
	cmpl $3, %ebx
	jne else2043
	call inject_big
	jmp endif2043
else2043:
endif2043:
endif2042:
endif2041:
endif2040:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ecx
	jmp endif2035
else2035:
	movl -12(%ebp), %ebx
	call type_error
	movl %eax, %ebx
	addl $0, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ecx
endif2035:
	movl %ecx, %ebx
	movl %ebx, %ecx
endif2013:
	movl %ecx, %ebx
	movl %ebx, %esi
	movl $4, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2044
	call inject_int
	jmp endif2044
else2044:
	cmpl $1, %ebx
	jne else2045
	call inject_bool
	jmp endif2045
else2045:
	cmpl $2, %ebx
	jne else2046
	call inject_big
	jmp endif2046
else2046:
	cmpl $3, %ebx
	jne else2047
	call inject_big
	jmp endif2047
else2047:
endif2047:
endif2046:
endif2045:
endif2044:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %esi
	movl $98, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2048
	call inject_int
	jmp endif2048
else2048:
	cmpl $1, %ebx
	jne else2049
	call inject_bool
	jmp endif2049
else2049:
	cmpl $2, %ebx
	jne else2050
	call inject_big
	jmp endif2050
else2050:
	cmpl $3, %ebx
	jne else2051
	call inject_big
	jmp endif2051
else2051:
endif2051:
endif2050:
endif2049:
endif2048:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	call tag
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2052
	call inject_int
	jmp endif2052
else2052:
	cmpl $1, %ebx
	jne else2053
	call inject_bool
	jmp endif2053
else2053:
	cmpl $2, %ebx
	jne else2054
	call inject_big
	jmp endif2054
else2054:
	cmpl $3, %ebx
	jne else2055
	call inject_big
	jmp endif2055
else2055:
endif2055:
endif2054:
endif2053:
endif2052:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl $0, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2056
	call inject_int
	jmp endif2056
else2056:
	cmpl $1, %ebx
	jne else2057
	call inject_bool
	jmp endif2057
else2057:
	cmpl $2, %ebx
	jne else2058
	call inject_big
	jmp endif2058
else2058:
	cmpl $3, %ebx
	jne else2059
	call inject_big
	jmp endif2059
else2059:
endif2059:
endif2058:
endif2057:
endif2056:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %ecx, %ebx
	movl %edx, %ecx
	cmpl %ebx, %ecx
	jne else2060
	movl $1, %ebx
	jmp endif2060
else2060:
	movl $0, %ebx
endif2060:
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else2061
	call inject_int
	jmp endif2061
else2061:
	cmpl $1, %ebx
	jne else2062
	call inject_bool
	jmp endif2062
else2062:
	cmpl $2, %ebx
	jne else2063
	call inject_big
	jmp endif2063
else2063:
	cmpl $3, %ebx
	jne else2064
	call inject_big
	jmp endif2064
else2064:
endif2064:
endif2063:
endif2062:
endif2061:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $1, %eax
	jne else2065
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2066
	call project_int
	jmp endif2066
else2066:
	cmpl $1, %ebx
	jne else2067
	call project_bool
	jmp endif2067
else2067:
	cmpl $2, %ebx
	jne else2068
	call project_big
	jmp endif2068
else2068:
	cmpl $3, %ebx
	jne else2069
	call project_big
	jmp endif2069
else2069:
endif2069:
endif2068:
endif2067:
endif2066:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	negl %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2070
	call inject_int
	jmp endif2070
else2070:
	cmpl $1, %ebx
	jne else2071
	call inject_bool
	jmp endif2071
else2071:
	cmpl $2, %ebx
	jne else2072
	call inject_big
	jmp endif2072
else2072:
	cmpl $3, %ebx
	jne else2073
	call inject_big
	jmp endif2073
else2073:
endif2073:
endif2072:
endif2071:
endif2070:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ecx
	jmp endif2065
else2065:
	movl %ebx, %ebx
	pushl %ebx
	call tag
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2074
	call inject_int
	jmp endif2074
else2074:
	cmpl $1, %ebx
	jne else2075
	call inject_bool
	jmp endif2075
else2075:
	cmpl $2, %ebx
	jne else2076
	call inject_big
	jmp endif2076
else2076:
	cmpl $3, %ebx
	jne else2077
	call inject_big
	jmp endif2077
else2077:
endif2077:
endif2076:
endif2075:
endif2074:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %esi
	movl $1, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2078
	call inject_int
	jmp endif2078
else2078:
	cmpl $1, %ebx
	jne else2079
	call inject_bool
	jmp endif2079
else2079:
	cmpl $2, %ebx
	jne else2080
	call inject_big
	jmp endif2080
else2080:
	cmpl $3, %ebx
	jne else2081
	call inject_big
	jmp endif2081
else2081:
endif2081:
endif2080:
endif2079:
endif2078:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %esi, %ecx
	movl %edx, %ebx
	cmpl %ecx, %ebx
	jne else2082
	movl $1, %ebx
	jmp endif2082
else2082:
	movl $0, %ebx
endif2082:
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else2083
	call inject_int
	jmp endif2083
else2083:
	cmpl $1, %ebx
	jne else2084
	call inject_bool
	jmp endif2084
else2084:
	cmpl $2, %ebx
	jne else2085
	call inject_big
	jmp endif2085
else2085:
	cmpl $3, %ebx
	jne else2086
	call inject_big
	jmp endif2086
else2086:
endif2086:
endif2085:
endif2084:
endif2083:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $1, %eax
	jne else2087
	movl %ebx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else2088
	call project_int
	jmp endif2088
else2088:
	cmpl $1, %ebx
	jne else2089
	call project_bool
	jmp endif2089
else2089:
	cmpl $2, %ebx
	jne else2090
	call project_big
	jmp endif2090
else2090:
	cmpl $3, %ebx
	jne else2091
	call project_big
	jmp endif2091
else2091:
endif2091:
endif2090:
endif2089:
endif2088:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ebx
	movl %ebx, %ecx
	negl %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2092
	call inject_int
	jmp endif2092
else2092:
	cmpl $1, %ebx
	jne else2093
	call inject_bool
	jmp endif2093
else2093:
	cmpl $2, %ebx
	jne else2094
	call inject_big
	jmp endif2094
else2094:
	cmpl $3, %ebx
	jne else2095
	call inject_big
	jmp endif2095
else2095:
endif2095:
endif2094:
endif2093:
endif2092:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ecx
	jmp endif2087
else2087:
	movl -12(%ebp), %ebx
	call type_error
	movl %eax, %ebx
	addl $0, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ecx
endif2087:
	movl %ecx, %ebx
	movl %ebx, %ecx
endif2065:
	movl %ecx, %ebx
	movl %ebx, %edx
	movl $13, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2096
	call inject_int
	jmp endif2096
else2096:
	cmpl $1, %ebx
	jne else2097
	call inject_bool
	jmp endif2097
else2097:
	cmpl $2, %ebx
	jne else2098
	call inject_big
	jmp endif2098
else2098:
	cmpl $3, %ebx
	jne else2099
	call inject_big
	jmp endif2099
else2099:
endif2099:
endif2098:
endif2097:
endif2096:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	call tag
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2100
	call inject_int
	jmp endif2100
else2100:
	cmpl $1, %ebx
	jne else2101
	call inject_bool
	jmp endif2101
else2101:
	cmpl $2, %ebx
	jne else2102
	call inject_big
	jmp endif2102
else2102:
	cmpl $3, %ebx
	jne else2103
	call inject_big
	jmp endif2103
else2103:
endif2103:
endif2102:
endif2101:
endif2100:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl $0, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2104
	call inject_int
	jmp endif2104
else2104:
	cmpl $1, %ebx
	jne else2105
	call inject_bool
	jmp endif2105
else2105:
	cmpl $2, %ebx
	jne else2106
	call inject_big
	jmp endif2106
else2106:
	cmpl $3, %ebx
	jne else2107
	call inject_big
	jmp endif2107
else2107:
endif2107:
endif2106:
endif2105:
endif2104:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %ecx, %ebx
	movl %edx, %ecx
	cmpl %ebx, %ecx
	jne else2108
	movl $1, %ebx
	jmp endif2108
else2108:
	movl $0, %ebx
endif2108:
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else2109
	call inject_int
	jmp endif2109
else2109:
	cmpl $1, %ebx
	jne else2110
	call inject_bool
	jmp endif2110
else2110:
	cmpl $2, %ebx
	jne else2111
	call inject_big
	jmp endif2111
else2111:
	cmpl $3, %ebx
	jne else2112
	call inject_big
	jmp endif2112
else2112:
endif2112:
endif2111:
endif2110:
endif2109:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $1, %eax
	jne else2113
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2114
	call project_int
	jmp endif2114
else2114:
	cmpl $1, %ebx
	jne else2115
	call project_bool
	jmp endif2115
else2115:
	cmpl $2, %ebx
	jne else2116
	call project_big
	jmp endif2116
else2116:
	cmpl $3, %ebx
	jne else2117
	call project_big
	jmp endif2117
else2117:
endif2117:
endif2116:
endif2115:
endif2114:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ecx
	negl %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2118
	call inject_int
	jmp endif2118
else2118:
	cmpl $1, %ebx
	jne else2119
	call inject_bool
	jmp endif2119
else2119:
	cmpl $2, %ebx
	jne else2120
	call inject_big
	jmp endif2120
else2120:
	cmpl $3, %ebx
	jne else2121
	call inject_big
	jmp endif2121
else2121:
endif2121:
endif2120:
endif2119:
endif2118:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	movl %ebx, %ecx
	jmp endif2113
else2113:
	movl %ebx, %ebx
	pushl %ebx
	call tag
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2122
	call inject_int
	jmp endif2122
else2122:
	cmpl $1, %ebx
	jne else2123
	call inject_bool
	jmp endif2123
else2123:
	cmpl $2, %ebx
	jne else2124
	call inject_big
	jmp endif2124
else2124:
	cmpl $3, %ebx
	jne else2125
	call inject_big
	jmp endif2125
else2125:
endif2125:
endif2124:
endif2123:
endif2122:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl $1, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2126
	call inject_int
	jmp endif2126
else2126:
	cmpl $1, %ebx
	jne else2127
	call inject_bool
	jmp endif2127
else2127:
	cmpl $2, %ebx
	jne else2128
	call inject_big
	jmp endif2128
else2128:
	cmpl $3, %ebx
	jne else2129
	call inject_big
	jmp endif2129
else2129:
endif2129:
endif2128:
endif2127:
endif2126:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ecx, %ecx
	movl %ebx, %ebx
	cmpl %ecx, %ebx
	jne else2130
	movl $1, %ecx
	jmp endif2130
else2130:
	movl $0, %ecx
endif2130:
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else2131
	call inject_int
	jmp endif2131
else2131:
	cmpl $1, %ebx
	jne else2132
	call inject_bool
	jmp endif2132
else2132:
	cmpl $2, %ebx
	jne else2133
	call inject_big
	jmp endif2133
else2133:
	cmpl $3, %ebx
	jne else2134
	call inject_big
	jmp endif2134
else2134:
endif2134:
endif2133:
endif2132:
endif2131:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $1, %eax
	jne else2135
	movl %ebx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else2136
	call project_int
	jmp endif2136
else2136:
	cmpl $1, %ebx
	jne else2137
	call project_bool
	jmp endif2137
else2137:
	cmpl $2, %ebx
	jne else2138
	call project_big
	jmp endif2138
else2138:
	cmpl $3, %ebx
	jne else2139
	call project_big
	jmp endif2139
else2139:
endif2139:
endif2138:
endif2137:
endif2136:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	negl %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2140
	call inject_int
	jmp endif2140
else2140:
	cmpl $1, %ebx
	jne else2141
	call inject_bool
	jmp endif2141
else2141:
	cmpl $2, %ebx
	jne else2142
	call inject_big
	jmp endif2142
else2142:
	cmpl $3, %ebx
	jne else2143
	call inject_big
	jmp endif2143
else2143:
endif2143:
endif2142:
endif2141:
endif2140:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ecx
	jmp endif2135
else2135:
	movl -12(%ebp), %ebx
	call type_error
	movl %eax, %ebx
	addl $0, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ecx
endif2135:
	movl %ecx, %ebx
	movl %ebx, %ecx
endif2113:
	movl %ecx, %ebx
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
	jne else2144
	call inject_int
	jmp endif2144
else2144:
	cmpl $1, %ebx
	jne else2145
	call inject_bool
	jmp endif2145
else2145:
	cmpl $2, %ebx
	jne else2146
	call inject_big
	jmp endif2146
else2146:
	cmpl $3, %ebx
	jne else2147
	call inject_big
	jmp endif2147
else2147:
endif2147:
endif2146:
endif2145:
endif2144:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl $0, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2148
	call inject_int
	jmp endif2148
else2148:
	cmpl $1, %ebx
	jne else2149
	call inject_bool
	jmp endif2149
else2149:
	cmpl $2, %ebx
	jne else2150
	call inject_big
	jmp endif2150
else2150:
	cmpl $3, %ebx
	jne else2151
	call inject_big
	jmp endif2151
else2151:
endif2151:
endif2150:
endif2149:
endif2148:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %ecx, %ebx
	movl %edx, %ecx
	cmpl %ebx, %ecx
	jne else2152
	movl $1, %ebx
	jmp endif2152
else2152:
	movl $0, %ebx
endif2152:
	movl %ebx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else2153
	call inject_int
	jmp endif2153
else2153:
	cmpl $1, %ebx
	jne else2154
	call inject_bool
	jmp endif2154
else2154:
	cmpl $2, %ebx
	jne else2155
	call inject_big
	jmp endif2155
else2155:
	cmpl $3, %ebx
	jne else2156
	call inject_big
	jmp endif2156
else2156:
endif2156:
endif2155:
endif2154:
endif2153:
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
	jne else2157
	call inject_int
	jmp endif2157
else2157:
	cmpl $1, %ebx
	jne else2158
	call inject_bool
	jmp endif2158
else2158:
	cmpl $2, %ebx
	jne else2159
	call inject_big
	jmp endif2159
else2159:
	cmpl $3, %ebx
	jne else2160
	call inject_big
	jmp endif2160
else2160:
endif2160:
endif2159:
endif2158:
endif2157:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %esi
	movl $0, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2161
	call inject_int
	jmp endif2161
else2161:
	cmpl $1, %ebx
	jne else2162
	call inject_bool
	jmp endif2162
else2162:
	cmpl $2, %ebx
	jne else2163
	call inject_big
	jmp endif2163
else2163:
	cmpl $3, %ebx
	jne else2164
	call inject_big
	jmp endif2164
else2164:
endif2164:
endif2163:
endif2162:
endif2161:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %esi, %ecx
	movl %edx, %ebx
	cmpl %ecx, %ebx
	jne else2165
	movl $1, %ebx
	jmp endif2165
else2165:
	movl $0, %ebx
endif2165:
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else2166
	call inject_int
	jmp endif2166
else2166:
	cmpl $1, %ebx
	jne else2167
	call inject_bool
	jmp endif2167
else2167:
	cmpl $2, %ebx
	jne else2168
	call inject_big
	jmp endif2168
else2168:
	cmpl $3, %ebx
	jne else2169
	call inject_big
	jmp endif2169
else2169:
endif2169:
endif2168:
endif2167:
endif2166:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %edx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $0, %eax
	jne else2170
	movl %ebx, %ebx
	jmp endif2170
else2170:
	movl %edx, %ecx
	movl %ecx, %ebx
endif2170:
	movl %ebx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $1, %eax
	jne else2171
	movl %edx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2172
	call project_int
	jmp endif2172
else2172:
	cmpl $1, %ebx
	jne else2173
	call project_bool
	jmp endif2173
else2173:
	cmpl $2, %ebx
	jne else2174
	call project_big
	jmp endif2174
else2174:
	cmpl $3, %ebx
	jne else2175
	call project_big
	jmp endif2175
else2175:
endif2175:
endif2174:
endif2173:
endif2172:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %edx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2176
	call project_int
	jmp endif2176
else2176:
	cmpl $1, %ebx
	jne else2177
	call project_bool
	jmp endif2177
else2177:
	cmpl $2, %ebx
	jne else2178
	call project_big
	jmp endif2178
else2178:
	cmpl $3, %ebx
	jne else2179
	call project_big
	jmp endif2179
else2179:
endif2179:
endif2178:
endif2177:
endif2176:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ecx
	movl %ebx, %ebx
	addl %ecx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2180
	call inject_int
	jmp endif2180
else2180:
	cmpl $1, %ebx
	jne else2181
	call inject_bool
	jmp endif2181
else2181:
	cmpl $2, %ebx
	jne else2182
	call inject_big
	jmp endif2182
else2182:
	cmpl $3, %ebx
	jne else2183
	call inject_big
	jmp endif2183
else2183:
endif2183:
endif2182:
endif2181:
endif2180:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
	jmp endif2171
else2171:
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
	jne else2184
	call inject_int
	jmp endif2184
else2184:
	cmpl $1, %ebx
	jne else2185
	call inject_bool
	jmp endif2185
else2185:
	cmpl $2, %ebx
	jne else2186
	call inject_big
	jmp endif2186
else2186:
	cmpl $3, %ebx
	jne else2187
	call inject_big
	jmp endif2187
else2187:
endif2187:
endif2186:
endif2185:
endif2184:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl $0, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2188
	call inject_int
	jmp endif2188
else2188:
	cmpl $1, %ebx
	jne else2189
	call inject_bool
	jmp endif2189
else2189:
	cmpl $2, %ebx
	jne else2190
	call inject_big
	jmp endif2190
else2190:
	cmpl $3, %ebx
	jne else2191
	call inject_big
	jmp endif2191
else2191:
endif2191:
endif2190:
endif2189:
endif2188:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %edx, %ecx
	movl %edx, %ebx
	cmpl %ecx, %ebx
	jne else2192
	movl $1, %ebx
	jmp endif2192
else2192:
	movl $0, %ebx
endif2192:
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else2193
	call inject_int
	jmp endif2193
else2193:
	cmpl $1, %ebx
	jne else2194
	call inject_bool
	jmp endif2194
else2194:
	cmpl $2, %ebx
	jne else2195
	call inject_big
	jmp endif2195
else2195:
	cmpl $3, %ebx
	jne else2196
	call inject_big
	jmp endif2196
else2196:
endif2196:
endif2195:
endif2194:
endif2193:
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
	jne else2197
	call inject_int
	jmp endif2197
else2197:
	cmpl $1, %ebx
	jne else2198
	call inject_bool
	jmp endif2198
else2198:
	cmpl $2, %ebx
	jne else2199
	call inject_big
	jmp endif2199
else2199:
	cmpl $3, %ebx
	jne else2200
	call inject_big
	jmp endif2200
else2200:
endif2200:
endif2199:
endif2198:
endif2197:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl $1, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2201
	call inject_int
	jmp endif2201
else2201:
	cmpl $1, %ebx
	jne else2202
	call inject_bool
	jmp endif2202
else2202:
	cmpl $2, %ebx
	jne else2203
	call inject_big
	jmp endif2203
else2203:
	cmpl $3, %ebx
	jne else2204
	call inject_big
	jmp endif2204
else2204:
endif2204:
endif2203:
endif2202:
endif2201:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %edx, %ebx
	movl %ecx, %ecx
	cmpl %ebx, %ecx
	jne else2205
	movl $1, %ebx
	jmp endif2205
else2205:
	movl $0, %ebx
endif2205:
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else2206
	call inject_int
	jmp endif2206
else2206:
	cmpl $1, %ebx
	jne else2207
	call inject_bool
	jmp endif2207
else2207:
	cmpl $2, %ebx
	jne else2208
	call inject_big
	jmp endif2208
else2208:
	cmpl $3, %ebx
	jne else2209
	call inject_big
	jmp endif2209
else2209:
endif2209:
endif2208:
endif2207:
endif2206:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %ecx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $0, %eax
	jne else2210
	movl %ebx, %ecx
	jmp endif2210
else2210:
	movl %edx, %ebx
	movl %ebx, %ecx
endif2210:
	movl %ecx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $1, %eax
	jne else2211
	movl %edx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2212
	call project_int
	jmp endif2212
else2212:
	cmpl $1, %ebx
	jne else2213
	call project_bool
	jmp endif2213
else2213:
	cmpl $2, %ebx
	jne else2214
	call project_big
	jmp endif2214
else2214:
	cmpl $3, %ebx
	jne else2215
	call project_big
	jmp endif2215
else2215:
endif2215:
endif2214:
endif2213:
endif2212:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %edx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else2216
	call project_int
	jmp endif2216
else2216:
	cmpl $1, %ebx
	jne else2217
	call project_bool
	jmp endif2217
else2217:
	cmpl $2, %ebx
	jne else2218
	call project_big
	jmp endif2218
else2218:
	cmpl $3, %ebx
	jne else2219
	call project_big
	jmp endif2219
else2219:
endif2219:
endif2218:
endif2217:
endif2216:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %ecx, %ebx
	movl %edx, %ecx
	addl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2220
	call inject_int
	jmp endif2220
else2220:
	cmpl $1, %ebx
	jne else2221
	call inject_bool
	jmp endif2221
else2221:
	cmpl $2, %ebx
	jne else2222
	call inject_big
	jmp endif2222
else2222:
	cmpl $3, %ebx
	jne else2223
	call inject_big
	jmp endif2223
else2223:
endif2223:
endif2222:
endif2221:
endif2220:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	jmp endif2211
else2211:
	movl %edx, %ebx
	pushl %ebx
	call tag
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2224
	call inject_int
	jmp endif2224
else2224:
	cmpl $1, %ebx
	jne else2225
	call inject_bool
	jmp endif2225
else2225:
	cmpl $2, %ebx
	jne else2226
	call inject_big
	jmp endif2226
else2226:
	cmpl $3, %ebx
	jne else2227
	call inject_big
	jmp endif2227
else2227:
endif2227:
endif2226:
endif2225:
endif2224:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl $1, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2228
	call inject_int
	jmp endif2228
else2228:
	cmpl $1, %ebx
	jne else2229
	call inject_bool
	jmp endif2229
else2229:
	cmpl $2, %ebx
	jne else2230
	call inject_big
	jmp endif2230
else2230:
	cmpl $3, %ebx
	jne else2231
	call inject_big
	jmp endif2231
else2231:
endif2231:
endif2230:
endif2229:
endif2228:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %ecx, %ebx
	movl %edx, %ecx
	cmpl %ebx, %ecx
	jne else2232
	movl $1, %ebx
	jmp endif2232
else2232:
	movl $0, %ebx
endif2232:
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else2233
	call inject_int
	jmp endif2233
else2233:
	cmpl $1, %ebx
	jne else2234
	call inject_bool
	jmp endif2234
else2234:
	cmpl $2, %ebx
	jne else2235
	call inject_big
	jmp endif2235
else2235:
	cmpl $3, %ebx
	jne else2236
	call inject_big
	jmp endif2236
else2236:
endif2236:
endif2235:
endif2234:
endif2233:
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
	jne else2237
	call inject_int
	jmp endif2237
else2237:
	cmpl $1, %ebx
	jne else2238
	call inject_bool
	jmp endif2238
else2238:
	cmpl $2, %ebx
	jne else2239
	call inject_big
	jmp endif2239
else2239:
	cmpl $3, %ebx
	jne else2240
	call inject_big
	jmp endif2240
else2240:
endif2240:
endif2239:
endif2238:
endif2237:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl $0, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2241
	call inject_int
	jmp endif2241
else2241:
	cmpl $1, %ebx
	jne else2242
	call inject_bool
	jmp endif2242
else2242:
	cmpl $2, %ebx
	jne else2243
	call inject_big
	jmp endif2243
else2243:
	cmpl $3, %ebx
	jne else2244
	call inject_big
	jmp endif2244
else2244:
endif2244:
endif2243:
endif2242:
endif2241:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ecx, %ebx
	movl %ebx, %ecx
	cmpl %ebx, %ecx
	jne else2245
	movl $1, %ebx
	jmp endif2245
else2245:
	movl $0, %ebx
endif2245:
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else2246
	call inject_int
	jmp endif2246
else2246:
	cmpl $1, %ebx
	jne else2247
	call inject_bool
	jmp endif2247
else2247:
	cmpl $2, %ebx
	jne else2248
	call inject_big
	jmp endif2248
else2248:
	cmpl $3, %ebx
	jne else2249
	call inject_big
	jmp endif2249
else2249:
endif2249:
endif2248:
endif2247:
endif2246:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %edx, %ecx
	pushl %ecx
	call is_true
	addl $4, %esp
	cmpl $0, %eax
	jne else2250
	movl %ecx, %ebx
	jmp endif2250
else2250:
	movl %ebx, %ecx
	movl %ecx, %ebx
endif2250:
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $1, %eax
	jne else2251
	movl %edx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else2252
	call project_int
	jmp endif2252
else2252:
	cmpl $1, %ebx
	jne else2253
	call project_bool
	jmp endif2253
else2253:
	cmpl $2, %ebx
	jne else2254
	call project_big
	jmp endif2254
else2254:
	cmpl $3, %ebx
	jne else2255
	call project_big
	jmp endif2255
else2255:
endif2255:
endif2254:
endif2253:
endif2252:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %edx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2256
	call project_int
	jmp endif2256
else2256:
	cmpl $1, %ebx
	jne else2257
	call project_bool
	jmp endif2257
else2257:
	cmpl $2, %ebx
	jne else2258
	call project_big
	jmp endif2258
else2258:
	cmpl $3, %ebx
	jne else2259
	call project_big
	jmp endif2259
else2259:
endif2259:
endif2258:
endif2257:
endif2256:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ecx
	movl %ecx, %ebx
	addl %ecx, %ebx
	movl %ebx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2260
	call inject_int
	jmp endif2260
else2260:
	cmpl $1, %ebx
	jne else2261
	call inject_bool
	jmp endif2261
else2261:
	cmpl $2, %ebx
	jne else2262
	call inject_big
	jmp endif2262
else2262:
	cmpl $3, %ebx
	jne else2263
	call inject_big
	jmp endif2263
else2263:
endif2263:
endif2262:
endif2261:
endif2260:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	movl %ebx, %ebx
	jmp endif2251
else2251:
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
	jne else2264
	call inject_int
	jmp endif2264
else2264:
	cmpl $1, %ebx
	jne else2265
	call inject_bool
	jmp endif2265
else2265:
	cmpl $2, %ebx
	jne else2266
	call inject_big
	jmp endif2266
else2266:
	cmpl $3, %ebx
	jne else2267
	call inject_big
	jmp endif2267
else2267:
endif2267:
endif2266:
endif2265:
endif2264:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl $1, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2268
	call inject_int
	jmp endif2268
else2268:
	cmpl $1, %ebx
	jne else2269
	call inject_bool
	jmp endif2269
else2269:
	cmpl $2, %ebx
	jne else2270
	call inject_big
	jmp endif2270
else2270:
	cmpl $3, %ebx
	jne else2271
	call inject_big
	jmp endif2271
else2271:
endif2271:
endif2270:
endif2269:
endif2268:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	movl %ebx, %ecx
	cmpl %ebx, %ecx
	jne else2272
	movl $1, %ecx
	jmp endif2272
else2272:
	movl $0, %ecx
endif2272:
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else2273
	call inject_int
	jmp endif2273
else2273:
	cmpl $1, %ebx
	jne else2274
	call inject_bool
	jmp endif2274
else2274:
	cmpl $2, %ebx
	jne else2275
	call inject_big
	jmp endif2275
else2275:
	cmpl $3, %ebx
	jne else2276
	call inject_big
	jmp endif2276
else2276:
endif2276:
endif2275:
endif2274:
endif2273:
	movl %eax, %ebx
	addl $4, %esp
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
	jne else2277
	call inject_int
	jmp endif2277
else2277:
	cmpl $1, %ebx
	jne else2278
	call inject_bool
	jmp endif2278
else2278:
	cmpl $2, %ebx
	jne else2279
	call inject_big
	jmp endif2279
else2279:
	cmpl $3, %ebx
	jne else2280
	call inject_big
	jmp endif2280
else2280:
endif2280:
endif2279:
endif2278:
endif2277:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl $1, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2281
	call inject_int
	jmp endif2281
else2281:
	cmpl $1, %ebx
	jne else2282
	call inject_bool
	jmp endif2282
else2282:
	cmpl $2, %ebx
	jne else2283
	call inject_big
	jmp endif2283
else2283:
	cmpl $3, %ebx
	jne else2284
	call inject_big
	jmp endif2284
else2284:
endif2284:
endif2283:
endif2282:
endif2281:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ecx, %ecx
	movl %ebx, %ebx
	cmpl %ecx, %ebx
	jne else2285
	movl $1, %ebx
	jmp endif2285
else2285:
	movl $0, %ebx
endif2285:
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else2286
	call inject_int
	jmp endif2286
else2286:
	cmpl $1, %ebx
	jne else2287
	call inject_bool
	jmp endif2287
else2287:
	cmpl $2, %ebx
	jne else2288
	call inject_big
	jmp endif2288
else2288:
	cmpl $3, %ebx
	jne else2289
	call inject_big
	jmp endif2289
else2289:
endif2289:
endif2288:
endif2287:
endif2286:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %edx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $0, %eax
	jne else2290
	movl %ebx, %ebx
	jmp endif2290
else2290:
	movl %ebx, %ecx
	movl %ecx, %ebx
endif2290:
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $1, %eax
	jne else2291
	movl %edx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else2292
	call project_int
	jmp endif2292
else2292:
	cmpl $1, %ebx
	jne else2293
	call project_bool
	jmp endif2293
else2293:
	cmpl $2, %ebx
	jne else2294
	call project_big
	jmp endif2294
else2294:
	cmpl $3, %ebx
	jne else2295
	call project_big
	jmp endif2295
else2295:
endif2295:
endif2294:
endif2293:
endif2292:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %edx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else2296
	call project_int
	jmp endif2296
else2296:
	cmpl $1, %ebx
	jne else2297
	call project_bool
	jmp endif2297
else2297:
	cmpl $2, %ebx
	jne else2298
	call project_big
	jmp endif2298
else2298:
	cmpl $3, %ebx
	jne else2299
	call project_big
	jmp endif2299
else2299:
endif2299:
endif2298:
endif2297:
endif2296:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ecx, %ecx
	movl %ebx, %ebx
	addl %ecx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2300
	call inject_int
	jmp endif2300
else2300:
	cmpl $1, %ebx
	jne else2301
	call inject_bool
	jmp endif2301
else2301:
	cmpl $2, %ebx
	jne else2302
	call inject_big
	jmp endif2302
else2302:
	cmpl $3, %ebx
	jne else2303
	call inject_big
	jmp endif2303
else2303:
endif2303:
endif2302:
endif2301:
endif2300:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	movl %ebx, %ebx
	jmp endif2291
else2291:
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
	jne else2304
	call inject_int
	jmp endif2304
else2304:
	cmpl $1, %ebx
	jne else2305
	call inject_bool
	jmp endif2305
else2305:
	cmpl $2, %ebx
	jne else2306
	call inject_big
	jmp endif2306
else2306:
	cmpl $3, %ebx
	jne else2307
	call inject_big
	jmp endif2307
else2307:
endif2307:
endif2306:
endif2305:
endif2304:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl $3, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2308
	call inject_int
	jmp endif2308
else2308:
	cmpl $1, %ebx
	jne else2309
	call inject_bool
	jmp endif2309
else2309:
	cmpl $2, %ebx
	jne else2310
	call inject_big
	jmp endif2310
else2310:
	cmpl $3, %ebx
	jne else2311
	call inject_big
	jmp endif2311
else2311:
endif2311:
endif2310:
endif2309:
endif2308:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ecx, %ecx
	movl %ebx, %ebx
	cmpl %ecx, %ebx
	jne else2312
	movl $1, %ecx
	jmp endif2312
else2312:
	movl $0, %ecx
endif2312:
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else2313
	call inject_int
	jmp endif2313
else2313:
	cmpl $1, %ebx
	jne else2314
	call inject_bool
	jmp endif2314
else2314:
	cmpl $2, %ebx
	jne else2315
	call inject_big
	jmp endif2315
else2315:
	cmpl $3, %ebx
	jne else2316
	call inject_big
	jmp endif2316
else2316:
endif2316:
endif2315:
endif2314:
endif2313:
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
	jne else2317
	call inject_int
	jmp endif2317
else2317:
	cmpl $1, %ebx
	jne else2318
	call inject_bool
	jmp endif2318
else2318:
	cmpl $2, %ebx
	jne else2319
	call inject_big
	jmp endif2319
else2319:
	cmpl $3, %ebx
	jne else2320
	call inject_big
	jmp endif2320
else2320:
endif2320:
endif2319:
endif2318:
endif2317:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl $3, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2321
	call inject_int
	jmp endif2321
else2321:
	cmpl $1, %ebx
	jne else2322
	call inject_bool
	jmp endif2322
else2322:
	cmpl $2, %ebx
	jne else2323
	call inject_big
	jmp endif2323
else2323:
	cmpl $3, %ebx
	jne else2324
	call inject_big
	jmp endif2324
else2324:
endif2324:
endif2323:
endif2322:
endif2321:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	movl %ebx, %ecx
	cmpl %ebx, %ecx
	jne else2325
	movl $1, %ecx
	jmp endif2325
else2325:
	movl $0, %ecx
endif2325:
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else2326
	call inject_int
	jmp endif2326
else2326:
	cmpl $1, %ebx
	jne else2327
	call inject_bool
	jmp endif2327
else2327:
	cmpl $2, %ebx
	jne else2328
	call inject_big
	jmp endif2328
else2328:
	cmpl $3, %ebx
	jne else2329
	call inject_big
	jmp endif2329
else2329:
endif2329:
endif2328:
endif2327:
endif2326:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ecx, %ecx
	pushl %ecx
	call is_true
	addl $4, %esp
	cmpl $0, %eax
	jne else2330
	movl %ecx, %ebx
	jmp endif2330
else2330:
	movl %ebx, %ecx
	movl %ecx, %ebx
endif2330:
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $1, %eax
	jne else2331
	movl %edx, %ebx
	pushl %ebx
	movl $3, %ebx
	cmpl $0, %ebx
	jne else2332
	call project_int
	jmp endif2332
else2332:
	cmpl $1, %ebx
	jne else2333
	call project_bool
	jmp endif2333
else2333:
	cmpl $2, %ebx
	jne else2334
	call project_big
	jmp endif2334
else2334:
	cmpl $3, %ebx
	jne else2335
	call project_big
	jmp endif2335
else2335:
endif2335:
endif2334:
endif2333:
endif2332:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %edx, %ebx
	pushl %ebx
	movl $3, %ebx
	cmpl $0, %ebx
	jne else2336
	call project_int
	jmp endif2336
else2336:
	cmpl $1, %ebx
	jne else2337
	call project_bool
	jmp endif2337
else2337:
	cmpl $2, %ebx
	jne else2338
	call project_big
	jmp endif2338
else2338:
	cmpl $3, %ebx
	jne else2339
	call project_big
	jmp endif2339
else2339:
endif2339:
endif2338:
endif2337:
endif2336:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ecx
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
	jne else2340
	call inject_int
	jmp endif2340
else2340:
	cmpl $1, %ebx
	jne else2341
	call inject_bool
	jmp endif2341
else2341:
	cmpl $2, %ebx
	jne else2342
	call inject_big
	jmp endif2342
else2342:
	cmpl $3, %ebx
	jne else2343
	call inject_big
	jmp endif2343
else2343:
endif2343:
endif2342:
endif2341:
endif2340:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	movl %ebx, %ecx
	jmp endif2331
else2331:
	movl -12(%ebp), %ebx
	call type_error
	movl %eax, %ecx
	addl $0, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	movl %ebx, %ecx
endif2331:
	movl %ecx, %ebx
	movl %ebx, %ebx
endif2291:
	movl %ebx, %ecx
	movl %ecx, %ebx
endif2251:
	movl %ebx, %ecx
	movl %ecx, %ebx
endif2211:
	movl %ebx, %ecx
	movl %ecx, %ebx
endif2171:
	movl %ebx, %ebx
	movl %ebx, %edx
	movl %esi, %ebx
	pushl %ebx
	call tag
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2344
	call inject_int
	jmp endif2344
else2344:
	cmpl $1, %ebx
	jne else2345
	call inject_bool
	jmp endif2345
else2345:
	cmpl $2, %ebx
	jne else2346
	call inject_big
	jmp endif2346
else2346:
	cmpl $3, %ebx
	jne else2347
	call inject_big
	jmp endif2347
else2347:
endif2347:
endif2346:
endif2345:
endif2344:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl $0, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2348
	call inject_int
	jmp endif2348
else2348:
	cmpl $1, %ebx
	jne else2349
	call inject_bool
	jmp endif2349
else2349:
	cmpl $2, %ebx
	jne else2350
	call inject_big
	jmp endif2350
else2350:
	cmpl $3, %ebx
	jne else2351
	call inject_big
	jmp endif2351
else2351:
endif2351:
endif2350:
endif2349:
endif2348:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %ecx, %ebx
	movl %edx, %ecx
	cmpl %ebx, %ecx
	jne else2352
	movl $1, %ebx
	jmp endif2352
else2352:
	movl $0, %ebx
endif2352:
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else2353
	call inject_int
	jmp endif2353
else2353:
	cmpl $1, %ebx
	jne else2354
	call inject_bool
	jmp endif2354
else2354:
	cmpl $2, %ebx
	jne else2355
	call inject_big
	jmp endif2355
else2355:
	cmpl $3, %ebx
	jne else2356
	call inject_big
	jmp endif2356
else2356:
endif2356:
endif2355:
endif2354:
endif2353:
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
	jne else2357
	call inject_int
	jmp endif2357
else2357:
	cmpl $1, %ebx
	jne else2358
	call inject_bool
	jmp endif2358
else2358:
	cmpl $2, %ebx
	jne else2359
	call inject_big
	jmp endif2359
else2359:
	cmpl $3, %ebx
	jne else2360
	call inject_big
	jmp endif2360
else2360:
endif2360:
endif2359:
endif2358:
endif2357:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl $0, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2361
	call inject_int
	jmp endif2361
else2361:
	cmpl $1, %ebx
	jne else2362
	call inject_bool
	jmp endif2362
else2362:
	cmpl $2, %ebx
	jne else2363
	call inject_big
	jmp endif2363
else2363:
	cmpl $3, %ebx
	jne else2364
	call inject_big
	jmp endif2364
else2364:
endif2364:
endif2363:
endif2362:
endif2361:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ecx, %ecx
	movl %ebx, %ebx
	cmpl %ecx, %ebx
	jne else2365
	movl $1, %ecx
	jmp endif2365
else2365:
	movl $0, %ecx
endif2365:
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else2366
	call inject_int
	jmp endif2366
else2366:
	cmpl $1, %ebx
	jne else2367
	call inject_bool
	jmp endif2367
else2367:
	cmpl $2, %ebx
	jne else2368
	call inject_big
	jmp endif2368
else2368:
	cmpl $3, %ebx
	jne else2369
	call inject_big
	jmp endif2369
else2369:
endif2369:
endif2368:
endif2367:
endif2366:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %ecx, %ecx
	pushl %ecx
	call is_true
	addl $4, %esp
	cmpl $0, %eax
	jne else2370
	movl %ecx, %ebx
	jmp endif2370
else2370:
	movl %edx, %ebx
	movl %ebx, %ebx
endif2370:
	movl %ebx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $1, %eax
	jne else2371
	movl %esi, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2372
	call project_int
	jmp endif2372
else2372:
	cmpl $1, %ebx
	jne else2373
	call project_bool
	jmp endif2373
else2373:
	cmpl $2, %ebx
	jne else2374
	call project_big
	jmp endif2374
else2374:
	cmpl $3, %ebx
	jne else2375
	call project_big
	jmp endif2375
else2375:
endif2375:
endif2374:
endif2373:
endif2372:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %edx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2376
	call project_int
	jmp endif2376
else2376:
	cmpl $1, %ebx
	jne else2377
	call project_bool
	jmp endif2377
else2377:
	cmpl $2, %ebx
	jne else2378
	call project_big
	jmp endif2378
else2378:
	cmpl $3, %ebx
	jne else2379
	call project_big
	jmp endif2379
else2379:
endif2379:
endif2378:
endif2377:
endif2376:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ecx, %ebx
	addl %ebx, %ebx
	movl %ebx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2380
	call inject_int
	jmp endif2380
else2380:
	cmpl $1, %ebx
	jne else2381
	call inject_bool
	jmp endif2381
else2381:
	cmpl $2, %ebx
	jne else2382
	call inject_big
	jmp endif2382
else2382:
	cmpl $3, %ebx
	jne else2383
	call inject_big
	jmp endif2383
else2383:
endif2383:
endif2382:
endif2381:
endif2380:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	jmp endif2371
else2371:
	movl %esi, %ebx
	pushl %ebx
	call tag
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2384
	call inject_int
	jmp endif2384
else2384:
	cmpl $1, %ebx
	jne else2385
	call inject_bool
	jmp endif2385
else2385:
	cmpl $2, %ebx
	jne else2386
	call inject_big
	jmp endif2386
else2386:
	cmpl $3, %ebx
	jne else2387
	call inject_big
	jmp endif2387
else2387:
endif2387:
endif2386:
endif2385:
endif2384:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl $0, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2388
	call inject_int
	jmp endif2388
else2388:
	cmpl $1, %ebx
	jne else2389
	call inject_bool
	jmp endif2389
else2389:
	cmpl $2, %ebx
	jne else2390
	call inject_big
	jmp endif2390
else2390:
	cmpl $3, %ebx
	jne else2391
	call inject_big
	jmp endif2391
else2391:
endif2391:
endif2390:
endif2389:
endif2388:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ecx, %ecx
	movl %ebx, %ebx
	cmpl %ecx, %ebx
	jne else2392
	movl $1, %ecx
	jmp endif2392
else2392:
	movl $0, %ecx
endif2392:
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else2393
	call inject_int
	jmp endif2393
else2393:
	cmpl $1, %ebx
	jne else2394
	call inject_bool
	jmp endif2394
else2394:
	cmpl $2, %ebx
	jne else2395
	call inject_big
	jmp endif2395
else2395:
	cmpl $3, %ebx
	jne else2396
	call inject_big
	jmp endif2396
else2396:
endif2396:
endif2395:
endif2394:
endif2393:
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
	jne else2397
	call inject_int
	jmp endif2397
else2397:
	cmpl $1, %ebx
	jne else2398
	call inject_bool
	jmp endif2398
else2398:
	cmpl $2, %ebx
	jne else2399
	call inject_big
	jmp endif2399
else2399:
	cmpl $3, %ebx
	jne else2400
	call inject_big
	jmp endif2400
else2400:
endif2400:
endif2399:
endif2398:
endif2397:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl $1, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2401
	call inject_int
	jmp endif2401
else2401:
	cmpl $1, %ebx
	jne else2402
	call inject_bool
	jmp endif2402
else2402:
	cmpl $2, %ebx
	jne else2403
	call inject_big
	jmp endif2403
else2403:
	cmpl $3, %ebx
	jne else2404
	call inject_big
	jmp endif2404
else2404:
endif2404:
endif2403:
endif2402:
endif2401:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %edx, %ebx
	movl %ecx, %ecx
	cmpl %ebx, %ecx
	jne else2405
	movl $1, %ebx
	jmp endif2405
else2405:
	movl $0, %ebx
endif2405:
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else2406
	call inject_int
	jmp endif2406
else2406:
	cmpl $1, %ebx
	jne else2407
	call inject_bool
	jmp endif2407
else2407:
	cmpl $2, %ebx
	jne else2408
	call inject_big
	jmp endif2408
else2408:
	cmpl $3, %ebx
	jne else2409
	call inject_big
	jmp endif2409
else2409:
endif2409:
endif2408:
endif2407:
endif2406:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %esi, %ecx
	pushl %ecx
	call is_true
	addl $4, %esp
	cmpl $0, %eax
	jne else2410
	movl %ecx, %ebx
	jmp endif2410
else2410:
	movl %edx, %ebx
	movl %ebx, %ebx
endif2410:
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $1, %eax
	jne else2411
	movl %esi, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2412
	call project_int
	jmp endif2412
else2412:
	cmpl $1, %ebx
	jne else2413
	call project_bool
	jmp endif2413
else2413:
	cmpl $2, %ebx
	jne else2414
	call project_big
	jmp endif2414
else2414:
	cmpl $3, %ebx
	jne else2415
	call project_big
	jmp endif2415
else2415:
endif2415:
endif2414:
endif2413:
endif2412:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %edx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else2416
	call project_int
	jmp endif2416
else2416:
	cmpl $1, %ebx
	jne else2417
	call project_bool
	jmp endif2417
else2417:
	cmpl $2, %ebx
	jne else2418
	call project_big
	jmp endif2418
else2418:
	cmpl $3, %ebx
	jne else2419
	call project_big
	jmp endif2419
else2419:
endif2419:
endif2418:
endif2417:
endif2416:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ebx, %ebx
	movl %ecx, %ebx
	addl %ebx, %ebx
	movl %ebx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2420
	call inject_int
	jmp endif2420
else2420:
	cmpl $1, %ebx
	jne else2421
	call inject_bool
	jmp endif2421
else2421:
	cmpl $2, %ebx
	jne else2422
	call inject_big
	jmp endif2422
else2422:
	cmpl $3, %ebx
	jne else2423
	call inject_big
	jmp endif2423
else2423:
endif2423:
endif2422:
endif2421:
endif2420:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
	jmp endif2411
else2411:
	movl %esi, %ebx
	pushl %ebx
	call tag
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2424
	call inject_int
	jmp endif2424
else2424:
	cmpl $1, %ebx
	jne else2425
	call inject_bool
	jmp endif2425
else2425:
	cmpl $2, %ebx
	jne else2426
	call inject_big
	jmp endif2426
else2426:
	cmpl $3, %ebx
	jne else2427
	call inject_big
	jmp endif2427
else2427:
endif2427:
endif2426:
endif2425:
endif2424:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ebx
	movl $1, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2428
	call inject_int
	jmp endif2428
else2428:
	cmpl $1, %ebx
	jne else2429
	call inject_bool
	jmp endif2429
else2429:
	cmpl $2, %ebx
	jne else2430
	call inject_big
	jmp endif2430
else2430:
	cmpl $3, %ebx
	jne else2431
	call inject_big
	jmp endif2431
else2431:
endif2431:
endif2430:
endif2429:
endif2428:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ecx
	movl %ebx, %ebx
	cmpl %ecx, %ebx
	jne else2432
	movl $1, %ecx
	jmp endif2432
else2432:
	movl $0, %ecx
endif2432:
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else2433
	call inject_int
	jmp endif2433
else2433:
	cmpl $1, %ebx
	jne else2434
	call inject_bool
	jmp endif2434
else2434:
	cmpl $2, %ebx
	jne else2435
	call inject_big
	jmp endif2435
else2435:
	cmpl $3, %ebx
	jne else2436
	call inject_big
	jmp endif2436
else2436:
endif2436:
endif2435:
endif2434:
endif2433:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %edx, %ebx
	pushl %ebx
	call tag
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2437
	call inject_int
	jmp endif2437
else2437:
	cmpl $1, %ebx
	jne else2438
	call inject_bool
	jmp endif2438
else2438:
	cmpl $2, %ebx
	jne else2439
	call inject_big
	jmp endif2439
else2439:
	cmpl $3, %ebx
	jne else2440
	call inject_big
	jmp endif2440
else2440:
endif2440:
endif2439:
endif2438:
endif2437:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl $0, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2441
	call inject_int
	jmp endif2441
else2441:
	cmpl $1, %ebx
	jne else2442
	call inject_bool
	jmp endif2442
else2442:
	cmpl $2, %ebx
	jne else2443
	call inject_big
	jmp endif2443
else2443:
	cmpl $3, %ebx
	jne else2444
	call inject_big
	jmp endif2444
else2444:
endif2444:
endif2443:
endif2442:
endif2441:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ecx
	movl %ebx, %ebx
	cmpl %ecx, %ebx
	jne else2445
	movl $1, %ebx
	jmp endif2445
else2445:
	movl $0, %ebx
endif2445:
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else2446
	call inject_int
	jmp endif2446
else2446:
	cmpl $1, %ebx
	jne else2447
	call inject_bool
	jmp endif2447
else2447:
	cmpl $2, %ebx
	jne else2448
	call inject_big
	jmp endif2448
else2448:
	cmpl $3, %ebx
	jne else2449
	call inject_big
	jmp endif2449
else2449:
endif2449:
endif2448:
endif2447:
endif2446:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %edx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $0, %eax
	jne else2450
	movl %ebx, %ecx
	jmp endif2450
else2450:
	movl %ebx, %ebx
	movl %ebx, %ecx
endif2450:
	movl %ecx, %ebx
	movl %ebx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $1, %eax
	jne else2451
	movl %esi, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else2452
	call project_int
	jmp endif2452
else2452:
	cmpl $1, %ebx
	jne else2453
	call project_bool
	jmp endif2453
else2453:
	cmpl $2, %ebx
	jne else2454
	call project_big
	jmp endif2454
else2454:
	cmpl $3, %ebx
	jne else2455
	call project_big
	jmp endif2455
else2455:
endif2455:
endif2454:
endif2453:
endif2452:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %edx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2456
	call project_int
	jmp endif2456
else2456:
	cmpl $1, %ebx
	jne else2457
	call project_bool
	jmp endif2457
else2457:
	cmpl $2, %ebx
	jne else2458
	call project_big
	jmp endif2458
else2458:
	cmpl $3, %ebx
	jne else2459
	call project_big
	jmp endif2459
else2459:
endif2459:
endif2458:
endif2457:
endif2456:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %edx, %ebx
	movl %ebx, %ecx
	addl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2460
	call inject_int
	jmp endif2460
else2460:
	cmpl $1, %ebx
	jne else2461
	call inject_bool
	jmp endif2461
else2461:
	cmpl $2, %ebx
	jne else2462
	call inject_big
	jmp endif2462
else2462:
	cmpl $3, %ebx
	jne else2463
	call inject_big
	jmp endif2463
else2463:
endif2463:
endif2462:
endif2461:
endif2460:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	jmp endif2451
else2451:
	movl %esi, %ebx
	pushl %ebx
	call tag
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2464
	call inject_int
	jmp endif2464
else2464:
	cmpl $1, %ebx
	jne else2465
	call inject_bool
	jmp endif2465
else2465:
	cmpl $2, %ebx
	jne else2466
	call inject_big
	jmp endif2466
else2466:
	cmpl $3, %ebx
	jne else2467
	call inject_big
	jmp endif2467
else2467:
endif2467:
endif2466:
endif2465:
endif2464:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %esi
	movl $1, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2468
	call inject_int
	jmp endif2468
else2468:
	cmpl $1, %ebx
	jne else2469
	call inject_bool
	jmp endif2469
else2469:
	cmpl $2, %ebx
	jne else2470
	call inject_big
	jmp endif2470
else2470:
	cmpl $3, %ebx
	jne else2471
	call inject_big
	jmp endif2471
else2471:
endif2471:
endif2470:
endif2469:
endif2468:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %esi, %ecx
	movl %edx, %ebx
	cmpl %ecx, %ebx
	jne else2472
	movl $1, %ebx
	jmp endif2472
else2472:
	movl $0, %ebx
endif2472:
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else2473
	call inject_int
	jmp endif2473
else2473:
	cmpl $1, %ebx
	jne else2474
	call inject_bool
	jmp endif2474
else2474:
	cmpl $2, %ebx
	jne else2475
	call inject_big
	jmp endif2475
else2475:
	cmpl $3, %ebx
	jne else2476
	call inject_big
	jmp endif2476
else2476:
endif2476:
endif2475:
endif2474:
endif2473:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %esi
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
	jne else2477
	call inject_int
	jmp endif2477
else2477:
	cmpl $1, %ebx
	jne else2478
	call inject_bool
	jmp endif2478
else2478:
	cmpl $2, %ebx
	jne else2479
	call inject_big
	jmp endif2479
else2479:
	cmpl $3, %ebx
	jne else2480
	call inject_big
	jmp endif2480
else2480:
endif2480:
endif2479:
endif2478:
endif2477:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl $1, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2481
	call inject_int
	jmp endif2481
else2481:
	cmpl $1, %ebx
	jne else2482
	call inject_bool
	jmp endif2482
else2482:
	cmpl $2, %ebx
	jne else2483
	call inject_big
	jmp endif2483
else2483:
	cmpl $3, %ebx
	jne else2484
	call inject_big
	jmp endif2484
else2484:
endif2484:
endif2483:
endif2482:
endif2481:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %ecx, %ebx
	movl %edx, %ecx
	cmpl %ebx, %ecx
	jne else2485
	movl $1, %ebx
	jmp endif2485
else2485:
	movl $0, %ebx
endif2485:
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else2486
	call inject_int
	jmp endif2486
else2486:
	cmpl $1, %ebx
	jne else2487
	call inject_bool
	jmp endif2487
else2487:
	cmpl $2, %ebx
	jne else2488
	call inject_big
	jmp endif2488
else2488:
	cmpl $3, %ebx
	jne else2489
	call inject_big
	jmp endif2489
else2489:
endif2489:
endif2488:
endif2487:
endif2486:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %esi, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $0, %eax
	jne else2490
	movl %ebx, %ecx
	jmp endif2490
else2490:
	movl %edx, %ebx
	movl %ebx, %ecx
endif2490:
	movl %ecx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $1, %eax
	jne else2491
	movl %esi, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else2492
	call project_int
	jmp endif2492
else2492:
	cmpl $1, %ebx
	jne else2493
	call project_bool
	jmp endif2493
else2493:
	cmpl $2, %ebx
	jne else2494
	call project_big
	jmp endif2494
else2494:
	cmpl $3, %ebx
	jne else2495
	call project_big
	jmp endif2495
else2495:
endif2495:
endif2494:
endif2493:
endif2492:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %esi
	movl %edx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else2496
	call project_int
	jmp endif2496
else2496:
	cmpl $1, %ebx
	jne else2497
	call project_bool
	jmp endif2497
else2497:
	cmpl $2, %ebx
	jne else2498
	call project_big
	jmp endif2498
else2498:
	cmpl $3, %ebx
	jne else2499
	call project_big
	jmp endif2499
else2499:
endif2499:
endif2498:
endif2497:
endif2496:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %esi, %ecx
	movl %edx, %ebx
	addl %ecx, %ebx
	movl %ebx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2500
	call inject_int
	jmp endif2500
else2500:
	cmpl $1, %ebx
	jne else2501
	call inject_bool
	jmp endif2501
else2501:
	cmpl $2, %ebx
	jne else2502
	call inject_big
	jmp endif2502
else2502:
	cmpl $3, %ebx
	jne else2503
	call inject_big
	jmp endif2503
else2503:
endif2503:
endif2502:
endif2501:
endif2500:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
	jmp endif2491
else2491:
	movl %esi, %ebx
	pushl %ebx
	call tag
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2504
	call inject_int
	jmp endif2504
else2504:
	cmpl $1, %ebx
	jne else2505
	call inject_bool
	jmp endif2505
else2505:
	cmpl $2, %ebx
	jne else2506
	call inject_big
	jmp endif2506
else2506:
	cmpl $3, %ebx
	jne else2507
	call inject_big
	jmp endif2507
else2507:
endif2507:
endif2506:
endif2505:
endif2504:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl $3, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2508
	call inject_int
	jmp endif2508
else2508:
	cmpl $1, %ebx
	jne else2509
	call inject_bool
	jmp endif2509
else2509:
	cmpl $2, %ebx
	jne else2510
	call inject_big
	jmp endif2510
else2510:
	cmpl $3, %ebx
	jne else2511
	call inject_big
	jmp endif2511
else2511:
endif2511:
endif2510:
endif2509:
endif2508:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	movl %ebx, %ecx
	cmpl %ebx, %ecx
	jne else2512
	movl $1, %ecx
	jmp endif2512
else2512:
	movl $0, %ecx
endif2512:
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else2513
	call inject_int
	jmp endif2513
else2513:
	cmpl $1, %ebx
	jne else2514
	call inject_bool
	jmp endif2514
else2514:
	cmpl $2, %ebx
	jne else2515
	call inject_big
	jmp endif2515
else2515:
	cmpl $3, %ebx
	jne else2516
	call inject_big
	jmp endif2516
else2516:
endif2516:
endif2515:
endif2514:
endif2513:
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
	jne else2517
	call inject_int
	jmp endif2517
else2517:
	cmpl $1, %ebx
	jne else2518
	call inject_bool
	jmp endif2518
else2518:
	cmpl $2, %ebx
	jne else2519
	call inject_big
	jmp endif2519
else2519:
	cmpl $3, %ebx
	jne else2520
	call inject_big
	jmp endif2520
else2520:
endif2520:
endif2519:
endif2518:
endif2517:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl $3, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2521
	call inject_int
	jmp endif2521
else2521:
	cmpl $1, %ebx
	jne else2522
	call inject_bool
	jmp endif2522
else2522:
	cmpl $2, %ebx
	jne else2523
	call inject_big
	jmp endif2523
else2523:
	cmpl $3, %ebx
	jne else2524
	call inject_big
	jmp endif2524
else2524:
endif2524:
endif2523:
endif2522:
endif2521:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	movl %ebx, %ecx
	cmpl %ebx, %ecx
	jne else2525
	movl $1, %ecx
	jmp endif2525
else2525:
	movl $0, %ecx
endif2525:
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else2526
	call inject_int
	jmp endif2526
else2526:
	cmpl $1, %ebx
	jne else2527
	call inject_bool
	jmp endif2527
else2527:
	cmpl $2, %ebx
	jne else2528
	call inject_big
	jmp endif2528
else2528:
	cmpl $3, %ebx
	jne else2529
	call inject_big
	jmp endif2529
else2529:
endif2529:
endif2528:
endif2527:
endif2526:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ecx, %ecx
	pushl %ecx
	call is_true
	addl $4, %esp
	cmpl $0, %eax
	jne else2530
	movl %ecx, %ebx
	jmp endif2530
else2530:
	movl %ebx, %ecx
	movl %ecx, %ebx
endif2530:
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $1, %eax
	jne else2531
	movl %esi, %ebx
	pushl %ebx
	movl $3, %ebx
	cmpl $0, %ebx
	jne else2532
	call project_int
	jmp endif2532
else2532:
	cmpl $1, %ebx
	jne else2533
	call project_bool
	jmp endif2533
else2533:
	cmpl $2, %ebx
	jne else2534
	call project_big
	jmp endif2534
else2534:
	cmpl $3, %ebx
	jne else2535
	call project_big
	jmp endif2535
else2535:
endif2535:
endif2534:
endif2533:
endif2532:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %edx, %ebx
	pushl %ebx
	movl $3, %ebx
	cmpl $0, %ebx
	jne else2536
	call project_int
	jmp endif2536
else2536:
	cmpl $1, %ebx
	jne else2537
	call project_bool
	jmp endif2537
else2537:
	cmpl $2, %ebx
	jne else2538
	call project_big
	jmp endif2538
else2538:
	cmpl $3, %ebx
	jne else2539
	call project_big
	jmp endif2539
else2539:
endif2539:
endif2538:
endif2537:
endif2536:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ecx, %ebx
	movl %ebx, %ecx
	pushl %ecx
	pushl %ebx
	call add
	addl $8, %esp
	movl %eax, %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $3, %ebx
	cmpl $0, %ebx
	jne else2540
	call inject_int
	jmp endif2540
else2540:
	cmpl $1, %ebx
	jne else2541
	call inject_bool
	jmp endif2541
else2541:
	cmpl $2, %ebx
	jne else2542
	call inject_big
	jmp endif2542
else2542:
	cmpl $3, %ebx
	jne else2543
	call inject_big
	jmp endif2543
else2543:
endif2543:
endif2542:
endif2541:
endif2540:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	jmp endif2531
else2531:
	movl -12(%ebp), %ebx
	call type_error
	movl %eax, %ecx
	addl $0, %esp
	movl %ecx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
endif2531:
	movl %ebx, %ecx
	movl %ecx, %ebx
endif2491:
	movl %ebx, %ecx
	movl %ecx, %ebx
endif2451:
	movl %ebx, %ecx
	movl %ecx, %ebx
endif2411:
	movl %ebx, %ecx
	movl %ecx, %ebx
endif2371:
	movl %ebx, %ebx
	movl %ebx, %edx
	movl %esi, %ebx
	pushl %ebx
	call tag
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2544
	call inject_int
	jmp endif2544
else2544:
	cmpl $1, %ebx
	jne else2545
	call inject_bool
	jmp endif2545
else2545:
	cmpl $2, %ebx
	jne else2546
	call inject_big
	jmp endif2546
else2546:
	cmpl $3, %ebx
	jne else2547
	call inject_big
	jmp endif2547
else2547:
endif2547:
endif2546:
endif2545:
endif2544:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl $0, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2548
	call inject_int
	jmp endif2548
else2548:
	cmpl $1, %ebx
	jne else2549
	call inject_bool
	jmp endif2549
else2549:
	cmpl $2, %ebx
	jne else2550
	call inject_big
	jmp endif2550
else2550:
	cmpl $3, %ebx
	jne else2551
	call inject_big
	jmp endif2551
else2551:
endif2551:
endif2550:
endif2549:
endif2548:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ebx, %ebx
	movl %ecx, %ecx
	cmpl %ebx, %ecx
	jne else2552
	movl $1, %ecx
	jmp endif2552
else2552:
	movl $0, %ecx
endif2552:
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else2553
	call inject_int
	jmp endif2553
else2553:
	cmpl $1, %ebx
	jne else2554
	call inject_bool
	jmp endif2554
else2554:
	cmpl $2, %ebx
	jne else2555
	call inject_big
	jmp endif2555
else2555:
	cmpl $3, %ebx
	jne else2556
	call inject_big
	jmp endif2556
else2556:
endif2556:
endif2555:
endif2554:
endif2553:
	movl %eax, %ebx
	addl $4, %esp
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
	jne else2557
	call inject_int
	jmp endif2557
else2557:
	cmpl $1, %ebx
	jne else2558
	call inject_bool
	jmp endif2558
else2558:
	cmpl $2, %ebx
	jne else2559
	call inject_big
	jmp endif2559
else2559:
	cmpl $3, %ebx
	jne else2560
	call inject_big
	jmp endif2560
else2560:
endif2560:
endif2559:
endif2558:
endif2557:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl $0, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2561
	call inject_int
	jmp endif2561
else2561:
	cmpl $1, %ebx
	jne else2562
	call inject_bool
	jmp endif2562
else2562:
	cmpl $2, %ebx
	jne else2563
	call inject_big
	jmp endif2563
else2563:
	cmpl $3, %ebx
	jne else2564
	call inject_big
	jmp endif2564
else2564:
endif2564:
endif2563:
endif2562:
endif2561:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ecx, %ecx
	movl %ebx, %ebx
	cmpl %ecx, %ebx
	jne else2565
	movl $1, %ebx
	jmp endif2565
else2565:
	movl $0, %ebx
endif2565:
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else2566
	call inject_int
	jmp endif2566
else2566:
	cmpl $1, %ebx
	jne else2567
	call inject_bool
	jmp endif2567
else2567:
	cmpl $2, %ebx
	jne else2568
	call inject_big
	jmp endif2568
else2568:
	cmpl $3, %ebx
	jne else2569
	call inject_big
	jmp endif2569
else2569:
endif2569:
endif2568:
endif2567:
endif2566:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %edx, %ecx
	pushl %ecx
	call is_true
	addl $4, %esp
	cmpl $0, %eax
	jne else2570
	movl %ecx, %ebx
	jmp endif2570
else2570:
	movl %ebx, %ecx
	movl %ecx, %ebx
endif2570:
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $1, %eax
	jne else2571
	movl %esi, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2572
	call project_int
	jmp endif2572
else2572:
	cmpl $1, %ebx
	jne else2573
	call project_bool
	jmp endif2573
else2573:
	cmpl $2, %ebx
	jne else2574
	call project_big
	jmp endif2574
else2574:
	cmpl $3, %ebx
	jne else2575
	call project_big
	jmp endif2575
else2575:
endif2575:
endif2574:
endif2573:
endif2572:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %edx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2576
	call project_int
	jmp endif2576
else2576:
	cmpl $1, %ebx
	jne else2577
	call project_bool
	jmp endif2577
else2577:
	cmpl $2, %ebx
	jne else2578
	call project_big
	jmp endif2578
else2578:
	cmpl $3, %ebx
	jne else2579
	call project_big
	jmp endif2579
else2579:
endif2579:
endif2578:
endif2577:
endif2576:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %ecx, %ebx
	movl %edx, %ecx
	addl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2580
	call inject_int
	jmp endif2580
else2580:
	cmpl $1, %ebx
	jne else2581
	call inject_bool
	jmp endif2581
else2581:
	cmpl $2, %ebx
	jne else2582
	call inject_big
	jmp endif2582
else2582:
	cmpl $3, %ebx
	jne else2583
	call inject_big
	jmp endif2583
else2583:
endif2583:
endif2582:
endif2581:
endif2580:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
	jmp endif2571
else2571:
	movl %esi, %ebx
	pushl %ebx
	call tag
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2584
	call inject_int
	jmp endif2584
else2584:
	cmpl $1, %ebx
	jne else2585
	call inject_bool
	jmp endif2585
else2585:
	cmpl $2, %ebx
	jne else2586
	call inject_big
	jmp endif2586
else2586:
	cmpl $3, %ebx
	jne else2587
	call inject_big
	jmp endif2587
else2587:
endif2587:
endif2586:
endif2585:
endif2584:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl $0, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2588
	call inject_int
	jmp endif2588
else2588:
	cmpl $1, %ebx
	jne else2589
	call inject_bool
	jmp endif2589
else2589:
	cmpl $2, %ebx
	jne else2590
	call inject_big
	jmp endif2590
else2590:
	cmpl $3, %ebx
	jne else2591
	call inject_big
	jmp endif2591
else2591:
endif2591:
endif2590:
endif2589:
endif2588:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %edx, %ecx
	movl %edx, %ebx
	cmpl %ecx, %ebx
	jne else2592
	movl $1, %ebx
	jmp endif2592
else2592:
	movl $0, %ebx
endif2592:
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else2593
	call inject_int
	jmp endif2593
else2593:
	cmpl $1, %ebx
	jne else2594
	call inject_bool
	jmp endif2594
else2594:
	cmpl $2, %ebx
	jne else2595
	call inject_big
	jmp endif2595
else2595:
	cmpl $3, %ebx
	jne else2596
	call inject_big
	jmp endif2596
else2596:
endif2596:
endif2595:
endif2594:
endif2593:
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
	jne else2597
	call inject_int
	jmp endif2597
else2597:
	cmpl $1, %ebx
	jne else2598
	call inject_bool
	jmp endif2598
else2598:
	cmpl $2, %ebx
	jne else2599
	call inject_big
	jmp endif2599
else2599:
	cmpl $3, %ebx
	jne else2600
	call inject_big
	jmp endif2600
else2600:
endif2600:
endif2599:
endif2598:
endif2597:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl $1, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2601
	call inject_int
	jmp endif2601
else2601:
	cmpl $1, %ebx
	jne else2602
	call inject_bool
	jmp endif2602
else2602:
	cmpl $2, %ebx
	jne else2603
	call inject_big
	jmp endif2603
else2603:
	cmpl $3, %ebx
	jne else2604
	call inject_big
	jmp endif2604
else2604:
endif2604:
endif2603:
endif2602:
endif2601:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %ecx, %ecx
	movl %edx, %ebx
	cmpl %ecx, %ebx
	jne else2605
	movl $1, %ebx
	jmp endif2605
else2605:
	movl $0, %ebx
endif2605:
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else2606
	call inject_int
	jmp endif2606
else2606:
	cmpl $1, %ebx
	jne else2607
	call inject_bool
	jmp endif2607
else2607:
	cmpl $2, %ebx
	jne else2608
	call inject_big
	jmp endif2608
else2608:
	cmpl $3, %ebx
	jne else2609
	call inject_big
	jmp endif2609
else2609:
endif2609:
endif2608:
endif2607:
endif2606:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %esi, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $0, %eax
	jne else2610
	movl %ebx, %ecx
	jmp endif2610
else2610:
	movl %edx, %ebx
	movl %ebx, %ecx
endif2610:
	movl %ecx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $1, %eax
	jne else2611
	movl %esi, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2612
	call project_int
	jmp endif2612
else2612:
	cmpl $1, %ebx
	jne else2613
	call project_bool
	jmp endif2613
else2613:
	cmpl $2, %ebx
	jne else2614
	call project_big
	jmp endif2614
else2614:
	cmpl $3, %ebx
	jne else2615
	call project_big
	jmp endif2615
else2615:
endif2615:
endif2614:
endif2613:
endif2612:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %edx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else2616
	call project_int
	jmp endif2616
else2616:
	cmpl $1, %ebx
	jne else2617
	call project_bool
	jmp endif2617
else2617:
	cmpl $2, %ebx
	jne else2618
	call project_big
	jmp endif2618
else2618:
	cmpl $3, %ebx
	jne else2619
	call project_big
	jmp endif2619
else2619:
endif2619:
endif2618:
endif2617:
endif2616:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %ecx, %ebx
	movl %edx, %ecx
	addl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2620
	call inject_int
	jmp endif2620
else2620:
	cmpl $1, %ebx
	jne else2621
	call inject_bool
	jmp endif2621
else2621:
	cmpl $2, %ebx
	jne else2622
	call inject_big
	jmp endif2622
else2622:
	cmpl $3, %ebx
	jne else2623
	call inject_big
	jmp endif2623
else2623:
endif2623:
endif2622:
endif2621:
endif2620:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
	jmp endif2611
else2611:
	movl %esi, %ebx
	pushl %ebx
	call tag
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2624
	call inject_int
	jmp endif2624
else2624:
	cmpl $1, %ebx
	jne else2625
	call inject_bool
	jmp endif2625
else2625:
	cmpl $2, %ebx
	jne else2626
	call inject_big
	jmp endif2626
else2626:
	cmpl $3, %ebx
	jne else2627
	call inject_big
	jmp endif2627
else2627:
endif2627:
endif2626:
endif2625:
endif2624:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl $1, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2628
	call inject_int
	jmp endif2628
else2628:
	cmpl $1, %ebx
	jne else2629
	call inject_bool
	jmp endif2629
else2629:
	cmpl $2, %ebx
	jne else2630
	call inject_big
	jmp endif2630
else2630:
	cmpl $3, %ebx
	jne else2631
	call inject_big
	jmp endif2631
else2631:
endif2631:
endif2630:
endif2629:
endif2628:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ecx, %ecx
	movl %ebx, %ebx
	cmpl %ecx, %ebx
	jne else2632
	movl $1, %ecx
	jmp endif2632
else2632:
	movl $0, %ecx
endif2632:
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else2633
	call inject_int
	jmp endif2633
else2633:
	cmpl $1, %ebx
	jne else2634
	call inject_bool
	jmp endif2634
else2634:
	cmpl $2, %ebx
	jne else2635
	call inject_big
	jmp endif2635
else2635:
	cmpl $3, %ebx
	jne else2636
	call inject_big
	jmp endif2636
else2636:
endif2636:
endif2635:
endif2634:
endif2633:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %esi
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
	jne else2637
	call inject_int
	jmp endif2637
else2637:
	cmpl $1, %ebx
	jne else2638
	call inject_bool
	jmp endif2638
else2638:
	cmpl $2, %ebx
	jne else2639
	call inject_big
	jmp endif2639
else2639:
	cmpl $3, %ebx
	jne else2640
	call inject_big
	jmp endif2640
else2640:
endif2640:
endif2639:
endif2638:
endif2637:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl $0, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2641
	call inject_int
	jmp endif2641
else2641:
	cmpl $1, %ebx
	jne else2642
	call inject_bool
	jmp endif2642
else2642:
	cmpl $2, %ebx
	jne else2643
	call inject_big
	jmp endif2643
else2643:
	cmpl $3, %ebx
	jne else2644
	call inject_big
	jmp endif2644
else2644:
endif2644:
endif2643:
endif2642:
endif2641:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %edx, %ecx
	movl %edx, %ebx
	cmpl %ecx, %ebx
	jne else2645
	movl $1, %ebx
	jmp endif2645
else2645:
	movl $0, %ebx
endif2645:
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else2646
	call inject_int
	jmp endif2646
else2646:
	cmpl $1, %ebx
	jne else2647
	call inject_bool
	jmp endif2647
else2647:
	cmpl $2, %ebx
	jne else2648
	call inject_big
	jmp endif2648
else2648:
	cmpl $3, %ebx
	jne else2649
	call inject_big
	jmp endif2649
else2649:
endif2649:
endif2648:
endif2647:
endif2646:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %esi, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $0, %eax
	jne else2650
	movl %ebx, %ecx
	jmp endif2650
else2650:
	movl %edx, %ebx
	movl %ebx, %ecx
endif2650:
	movl %ecx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $1, %eax
	jne else2651
	movl %esi, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else2652
	call project_int
	jmp endif2652
else2652:
	cmpl $1, %ebx
	jne else2653
	call project_bool
	jmp endif2653
else2653:
	cmpl $2, %ebx
	jne else2654
	call project_big
	jmp endif2654
else2654:
	cmpl $3, %ebx
	jne else2655
	call project_big
	jmp endif2655
else2655:
endif2655:
endif2654:
endif2653:
endif2652:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %edx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2656
	call project_int
	jmp endif2656
else2656:
	cmpl $1, %ebx
	jne else2657
	call project_bool
	jmp endif2657
else2657:
	cmpl $2, %ebx
	jne else2658
	call project_big
	jmp endif2658
else2658:
	cmpl $3, %ebx
	jne else2659
	call project_big
	jmp endif2659
else2659:
endif2659:
endif2658:
endif2657:
endif2656:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %ecx, %ebx
	movl %edx, %ecx
	addl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2660
	call inject_int
	jmp endif2660
else2660:
	cmpl $1, %ebx
	jne else2661
	call inject_bool
	jmp endif2661
else2661:
	cmpl $2, %ebx
	jne else2662
	call inject_big
	jmp endif2662
else2662:
	cmpl $3, %ebx
	jne else2663
	call inject_big
	jmp endif2663
else2663:
endif2663:
endif2662:
endif2661:
endif2660:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
	jmp endif2651
else2651:
	movl %esi, %ebx
	pushl %ebx
	call tag
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2664
	call inject_int
	jmp endif2664
else2664:
	cmpl $1, %ebx
	jne else2665
	call inject_bool
	jmp endif2665
else2665:
	cmpl $2, %ebx
	jne else2666
	call inject_big
	jmp endif2666
else2666:
	cmpl $3, %ebx
	jne else2667
	call inject_big
	jmp endif2667
else2667:
endif2667:
endif2666:
endif2665:
endif2664:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %esi
	movl $1, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2668
	call inject_int
	jmp endif2668
else2668:
	cmpl $1, %ebx
	jne else2669
	call inject_bool
	jmp endif2669
else2669:
	cmpl $2, %ebx
	jne else2670
	call inject_big
	jmp endif2670
else2670:
	cmpl $3, %ebx
	jne else2671
	call inject_big
	jmp endif2671
else2671:
endif2671:
endif2670:
endif2669:
endif2668:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %esi, %ecx
	movl %edx, %ebx
	cmpl %ecx, %ebx
	jne else2672
	movl $1, %ebx
	jmp endif2672
else2672:
	movl $0, %ebx
endif2672:
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else2673
	call inject_int
	jmp endif2673
else2673:
	cmpl $1, %ebx
	jne else2674
	call inject_bool
	jmp endif2674
else2674:
	cmpl $2, %ebx
	jne else2675
	call inject_big
	jmp endif2675
else2675:
	cmpl $3, %ebx
	jne else2676
	call inject_big
	jmp endif2676
else2676:
endif2676:
endif2675:
endif2674:
endif2673:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %esi
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
	jne else2677
	call inject_int
	jmp endif2677
else2677:
	cmpl $1, %ebx
	jne else2678
	call inject_bool
	jmp endif2678
else2678:
	cmpl $2, %ebx
	jne else2679
	call inject_big
	jmp endif2679
else2679:
	cmpl $3, %ebx
	jne else2680
	call inject_big
	jmp endif2680
else2680:
endif2680:
endif2679:
endif2678:
endif2677:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl $1, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2681
	call inject_int
	jmp endif2681
else2681:
	cmpl $1, %ebx
	jne else2682
	call inject_bool
	jmp endif2682
else2682:
	cmpl $2, %ebx
	jne else2683
	call inject_big
	jmp endif2683
else2683:
	cmpl $3, %ebx
	jne else2684
	call inject_big
	jmp endif2684
else2684:
endif2684:
endif2683:
endif2682:
endif2681:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %ecx, %ebx
	movl %edx, %ecx
	cmpl %ebx, %ecx
	jne else2685
	movl $1, %ebx
	jmp endif2685
else2685:
	movl $0, %ebx
endif2685:
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else2686
	call inject_int
	jmp endif2686
else2686:
	cmpl $1, %ebx
	jne else2687
	call inject_bool
	jmp endif2687
else2687:
	cmpl $2, %ebx
	jne else2688
	call inject_big
	jmp endif2688
else2688:
	cmpl $3, %ebx
	jne else2689
	call inject_big
	jmp endif2689
else2689:
endif2689:
endif2688:
endif2687:
endif2686:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %esi, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $0, %eax
	jne else2690
	movl %ebx, %ebx
	jmp endif2690
else2690:
	movl %edx, %ecx
	movl %ecx, %ebx
endif2690:
	movl %ebx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $1, %eax
	jne else2691
	movl %esi, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else2692
	call project_int
	jmp endif2692
else2692:
	cmpl $1, %ebx
	jne else2693
	call project_bool
	jmp endif2693
else2693:
	cmpl $2, %ebx
	jne else2694
	call project_big
	jmp endif2694
else2694:
	cmpl $3, %ebx
	jne else2695
	call project_big
	jmp endif2695
else2695:
endif2695:
endif2694:
endif2693:
endif2692:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %edx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else2696
	call project_int
	jmp endif2696
else2696:
	cmpl $1, %ebx
	jne else2697
	call project_bool
	jmp endif2697
else2697:
	cmpl $2, %ebx
	jne else2698
	call project_big
	jmp endif2698
else2698:
	cmpl $3, %ebx
	jne else2699
	call project_big
	jmp endif2699
else2699:
endif2699:
endif2698:
endif2697:
endif2696:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %edx, %ecx
	movl %ebx, %ebx
	addl %ecx, %ebx
	movl %ebx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2700
	call inject_int
	jmp endif2700
else2700:
	cmpl $1, %ebx
	jne else2701
	call inject_bool
	jmp endif2701
else2701:
	cmpl $2, %ebx
	jne else2702
	call inject_big
	jmp endif2702
else2702:
	cmpl $3, %ebx
	jne else2703
	call inject_big
	jmp endif2703
else2703:
endif2703:
endif2702:
endif2701:
endif2700:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
	jmp endif2691
else2691:
	movl %esi, %ebx
	pushl %ebx
	call tag
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2704
	call inject_int
	jmp endif2704
else2704:
	cmpl $1, %ebx
	jne else2705
	call inject_bool
	jmp endif2705
else2705:
	cmpl $2, %ebx
	jne else2706
	call inject_big
	jmp endif2706
else2706:
	cmpl $3, %ebx
	jne else2707
	call inject_big
	jmp endif2707
else2707:
endif2707:
endif2706:
endif2705:
endif2704:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl $3, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2708
	call inject_int
	jmp endif2708
else2708:
	cmpl $1, %ebx
	jne else2709
	call inject_bool
	jmp endif2709
else2709:
	cmpl $2, %ebx
	jne else2710
	call inject_big
	jmp endif2710
else2710:
	cmpl $3, %ebx
	jne else2711
	call inject_big
	jmp endif2711
else2711:
endif2711:
endif2710:
endif2709:
endif2708:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ecx, %ecx
	cmpl %ebx, %ecx
	jne else2712
	movl $1, %ecx
	jmp endif2712
else2712:
	movl $0, %ecx
endif2712:
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else2713
	call inject_int
	jmp endif2713
else2713:
	cmpl $1, %ebx
	jne else2714
	call inject_bool
	jmp endif2714
else2714:
	cmpl $2, %ebx
	jne else2715
	call inject_big
	jmp endif2715
else2715:
	cmpl $3, %ebx
	jne else2716
	call inject_big
	jmp endif2716
else2716:
endif2716:
endif2715:
endif2714:
endif2713:
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
	jne else2717
	call inject_int
	jmp endif2717
else2717:
	cmpl $1, %ebx
	jne else2718
	call inject_bool
	jmp endif2718
else2718:
	cmpl $2, %ebx
	jne else2719
	call inject_big
	jmp endif2719
else2719:
	cmpl $3, %ebx
	jne else2720
	call inject_big
	jmp endif2720
else2720:
endif2720:
endif2719:
endif2718:
endif2717:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl $3, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2721
	call inject_int
	jmp endif2721
else2721:
	cmpl $1, %ebx
	jne else2722
	call inject_bool
	jmp endif2722
else2722:
	cmpl $2, %ebx
	jne else2723
	call inject_big
	jmp endif2723
else2723:
	cmpl $3, %ebx
	jne else2724
	call inject_big
	jmp endif2724
else2724:
endif2724:
endif2723:
endif2722:
endif2721:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %edx, %ecx
	movl %ecx, %ebx
	cmpl %ecx, %ebx
	jne else2725
	movl $1, %ebx
	jmp endif2725
else2725:
	movl $0, %ebx
endif2725:
	movl %ebx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else2726
	call inject_int
	jmp endif2726
else2726:
	cmpl $1, %ebx
	jne else2727
	call inject_bool
	jmp endif2727
else2727:
	cmpl $2, %ebx
	jne else2728
	call inject_big
	jmp endif2728
else2728:
	cmpl $3, %ebx
	jne else2729
	call inject_big
	jmp endif2729
else2729:
endif2729:
endif2728:
endif2727:
endif2726:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ecx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $0, %eax
	jne else2730
	movl %ebx, %ebx
	jmp endif2730
else2730:
	movl %ebx, %ebx
	movl %ebx, %ebx
endif2730:
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $1, %eax
	jne else2731
	movl %esi, %ebx
	pushl %ebx
	movl $3, %ebx
	cmpl $0, %ebx
	jne else2732
	call project_int
	jmp endif2732
else2732:
	cmpl $1, %ebx
	jne else2733
	call project_bool
	jmp endif2733
else2733:
	cmpl $2, %ebx
	jne else2734
	call project_big
	jmp endif2734
else2734:
	cmpl $3, %ebx
	jne else2735
	call project_big
	jmp endif2735
else2735:
endif2735:
endif2734:
endif2733:
endif2732:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %edx, %ebx
	pushl %ebx
	movl $3, %ebx
	cmpl $0, %ebx
	jne else2736
	call project_int
	jmp endif2736
else2736:
	cmpl $1, %ebx
	jne else2737
	call project_bool
	jmp endif2737
else2737:
	cmpl $2, %ebx
	jne else2738
	call project_big
	jmp endif2738
else2738:
	cmpl $3, %ebx
	jne else2739
	call project_big
	jmp endif2739
else2739:
endif2739:
endif2738:
endif2737:
endif2736:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %ebx, %ecx
	movl %edx, %ebx
	pushl %ebx
	pushl %ecx
	call add
	addl $8, %esp
	movl %eax, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $3, %ebx
	cmpl $0, %ebx
	jne else2740
	call inject_int
	jmp endif2740
else2740:
	cmpl $1, %ebx
	jne else2741
	call inject_bool
	jmp endif2741
else2741:
	cmpl $2, %ebx
	jne else2742
	call inject_big
	jmp endif2742
else2742:
	cmpl $3, %ebx
	jne else2743
	call inject_big
	jmp endif2743
else2743:
endif2743:
endif2742:
endif2741:
endif2740:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	jmp endif2731
else2731:
	movl -12(%ebp), %ebx
	call type_error
	movl %eax, %ecx
	addl $0, %esp
	movl %ecx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
endif2731:
	movl %ebx, %ecx
	movl %ecx, %ebx
endif2691:
	movl %ebx, %ecx
	movl %ecx, %ebx
endif2651:
	movl %ebx, %ecx
	movl %ecx, %ebx
endif2611:
	movl %ebx, %ecx
	movl %ecx, %ebx
endif2571:
	movl %ebx, %ebx
	movl %ebx, %esi
	movl -4(%ebp), %ebx
	pushl %ebx
	call tag
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2744
	call inject_int
	jmp endif2744
else2744:
	cmpl $1, %ebx
	jne else2745
	call inject_bool
	jmp endif2745
else2745:
	cmpl $2, %ebx
	jne else2746
	call inject_big
	jmp endif2746
else2746:
	cmpl $3, %ebx
	jne else2747
	call inject_big
	jmp endif2747
else2747:
endif2747:
endif2746:
endif2745:
endif2744:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl $0, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2748
	call inject_int
	jmp endif2748
else2748:
	cmpl $1, %ebx
	jne else2749
	call inject_bool
	jmp endif2749
else2749:
	cmpl $2, %ebx
	jne else2750
	call inject_big
	jmp endif2750
else2750:
	cmpl $3, %ebx
	jne else2751
	call inject_big
	jmp endif2751
else2751:
endif2751:
endif2750:
endif2749:
endif2748:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %ecx, %ebx
	movl %edx, %ecx
	cmpl %ebx, %ecx
	jne else2752
	movl $1, %ebx
	jmp endif2752
else2752:
	movl $0, %ebx
endif2752:
	movl %ebx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else2753
	call inject_int
	jmp endif2753
else2753:
	cmpl $1, %ebx
	jne else2754
	call inject_bool
	jmp endif2754
else2754:
	cmpl $2, %ebx
	jne else2755
	call inject_big
	jmp endif2755
else2755:
	cmpl $3, %ebx
	jne else2756
	call inject_big
	jmp endif2756
else2756:
endif2756:
endif2755:
endif2754:
endif2753:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %esi, %ebx
	pushl %ebx
	call tag
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2757
	call inject_int
	jmp endif2757
else2757:
	cmpl $1, %ebx
	jne else2758
	call inject_bool
	jmp endif2758
else2758:
	cmpl $2, %ebx
	jne else2759
	call inject_big
	jmp endif2759
else2759:
	cmpl $3, %ebx
	jne else2760
	call inject_big
	jmp endif2760
else2760:
endif2760:
endif2759:
endif2758:
endif2757:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl $0, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2761
	call inject_int
	jmp endif2761
else2761:
	cmpl $1, %ebx
	jne else2762
	call inject_bool
	jmp endif2762
else2762:
	cmpl $2, %ebx
	jne else2763
	call inject_big
	jmp endif2763
else2763:
	cmpl $3, %ebx
	jne else2764
	call inject_big
	jmp endif2764
else2764:
endif2764:
endif2763:
endif2762:
endif2761:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ebx
	movl %ecx, %ecx
	movl %ebx, %ebx
	cmpl %ecx, %ebx
	jne else2765
	movl $1, %ebx
	jmp endif2765
else2765:
	movl $0, %ebx
endif2765:
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else2766
	call inject_int
	jmp endif2766
else2766:
	cmpl $1, %ebx
	jne else2767
	call inject_bool
	jmp endif2767
else2767:
	cmpl $2, %ebx
	jne else2768
	call inject_big
	jmp endif2768
else2768:
	cmpl $3, %ebx
	jne else2769
	call inject_big
	jmp endif2769
else2769:
endif2769:
endif2768:
endif2767:
endif2766:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %edx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $0, %eax
	jne else2770
	movl %ebx, %ecx
	jmp endif2770
else2770:
	movl %ecx, %ebx
	movl %ebx, %ecx
endif2770:
	movl %ecx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $1, %eax
	jne else2771
	movl -4(%ebp), %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2772
	call project_int
	jmp endif2772
else2772:
	cmpl $1, %ebx
	jne else2773
	call project_bool
	jmp endif2773
else2773:
	cmpl $2, %ebx
	jne else2774
	call project_big
	jmp endif2774
else2774:
	cmpl $3, %ebx
	jne else2775
	call project_big
	jmp endif2775
else2775:
endif2775:
endif2774:
endif2773:
endif2772:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %esi, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2776
	call project_int
	jmp endif2776
else2776:
	cmpl $1, %ebx
	jne else2777
	call project_bool
	jmp endif2777
else2777:
	cmpl $2, %ebx
	jne else2778
	call project_big
	jmp endif2778
else2778:
	cmpl $3, %ebx
	jne else2779
	call project_big
	jmp endif2779
else2779:
endif2779:
endif2778:
endif2777:
endif2776:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ecx, %ebx
	addl %ebx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2780
	call inject_int
	jmp endif2780
else2780:
	cmpl $1, %ebx
	jne else2781
	call inject_bool
	jmp endif2781
else2781:
	cmpl $2, %ebx
	jne else2782
	call inject_big
	jmp endif2782
else2782:
	cmpl $3, %ebx
	jne else2783
	call inject_big
	jmp endif2783
else2783:
endif2783:
endif2782:
endif2781:
endif2780:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	jmp endif2771
else2771:
	movl -4(%ebp), %ebx
	pushl %ebx
	call tag
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2784
	call inject_int
	jmp endif2784
else2784:
	cmpl $1, %ebx
	jne else2785
	call inject_bool
	jmp endif2785
else2785:
	cmpl $2, %ebx
	jne else2786
	call inject_big
	jmp endif2786
else2786:
	cmpl $3, %ebx
	jne else2787
	call inject_big
	jmp endif2787
else2787:
endif2787:
endif2786:
endif2785:
endif2784:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl $0, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2788
	call inject_int
	jmp endif2788
else2788:
	cmpl $1, %ebx
	jne else2789
	call inject_bool
	jmp endif2789
else2789:
	cmpl $2, %ebx
	jne else2790
	call inject_big
	jmp endif2790
else2790:
	cmpl $3, %ebx
	jne else2791
	call inject_big
	jmp endif2791
else2791:
endif2791:
endif2790:
endif2789:
endif2788:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %ecx, %ebx
	movl %edx, %ecx
	cmpl %ebx, %ecx
	jne else2792
	movl $1, %ebx
	jmp endif2792
else2792:
	movl $0, %ebx
endif2792:
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else2793
	call inject_int
	jmp endif2793
else2793:
	cmpl $1, %ebx
	jne else2794
	call inject_bool
	jmp endif2794
else2794:
	cmpl $2, %ebx
	jne else2795
	call inject_big
	jmp endif2795
else2795:
	cmpl $3, %ebx
	jne else2796
	call inject_big
	jmp endif2796
else2796:
endif2796:
endif2795:
endif2794:
endif2793:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %esi, %ebx
	pushl %ebx
	call tag
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2797
	call inject_int
	jmp endif2797
else2797:
	cmpl $1, %ebx
	jne else2798
	call inject_bool
	jmp endif2798
else2798:
	cmpl $2, %ebx
	jne else2799
	call inject_big
	jmp endif2799
else2799:
	cmpl $3, %ebx
	jne else2800
	call inject_big
	jmp endif2800
else2800:
endif2800:
endif2799:
endif2798:
endif2797:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %esi
	movl $1, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2801
	call inject_int
	jmp endif2801
else2801:
	cmpl $1, %ebx
	jne else2802
	call inject_bool
	jmp endif2802
else2802:
	cmpl $2, %ebx
	jne else2803
	call inject_big
	jmp endif2803
else2803:
	cmpl $3, %ebx
	jne else2804
	call inject_big
	jmp endif2804
else2804:
endif2804:
endif2803:
endif2802:
endif2801:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %esi, %ecx
	movl %edx, %ebx
	cmpl %ecx, %ebx
	jne else2805
	movl $1, %ebx
	jmp endif2805
else2805:
	movl $0, %ebx
endif2805:
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else2806
	call inject_int
	jmp endif2806
else2806:
	cmpl $1, %ebx
	jne else2807
	call inject_bool
	jmp endif2807
else2807:
	cmpl $2, %ebx
	jne else2808
	call inject_big
	jmp endif2808
else2808:
	cmpl $3, %ebx
	jne else2809
	call inject_big
	jmp endif2809
else2809:
endif2809:
endif2808:
endif2807:
endif2806:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %edx, %ecx
	pushl %ecx
	call is_true
	addl $4, %esp
	cmpl $0, %eax
	jne else2810
	movl %ecx, %ebx
	jmp endif2810
else2810:
	movl %edx, %ebx
	movl %ebx, %ebx
endif2810:
	movl %ebx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $1, %eax
	jne else2811
	movl -4(%ebp), %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2812
	call project_int
	jmp endif2812
else2812:
	cmpl $1, %ebx
	jne else2813
	call project_bool
	jmp endif2813
else2813:
	cmpl $2, %ebx
	jne else2814
	call project_big
	jmp endif2814
else2814:
	cmpl $3, %ebx
	jne else2815
	call project_big
	jmp endif2815
else2815:
endif2815:
endif2814:
endif2813:
endif2812:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %esi, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else2816
	call project_int
	jmp endif2816
else2816:
	cmpl $1, %ebx
	jne else2817
	call project_bool
	jmp endif2817
else2817:
	cmpl $2, %ebx
	jne else2818
	call project_big
	jmp endif2818
else2818:
	cmpl $3, %ebx
	jne else2819
	call project_big
	jmp endif2819
else2819:
endif2819:
endif2818:
endif2817:
endif2816:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %edx, %ebx
	movl %ebx, %ecx
	addl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2820
	call inject_int
	jmp endif2820
else2820:
	cmpl $1, %ebx
	jne else2821
	call inject_bool
	jmp endif2821
else2821:
	cmpl $2, %ebx
	jne else2822
	call inject_big
	jmp endif2822
else2822:
	cmpl $3, %ebx
	jne else2823
	call inject_big
	jmp endif2823
else2823:
endif2823:
endif2822:
endif2821:
endif2820:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	jmp endif2811
else2811:
	movl -4(%ebp), %ebx
	pushl %ebx
	call tag
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2824
	call inject_int
	jmp endif2824
else2824:
	cmpl $1, %ebx
	jne else2825
	call inject_bool
	jmp endif2825
else2825:
	cmpl $2, %ebx
	jne else2826
	call inject_big
	jmp endif2826
else2826:
	cmpl $3, %ebx
	jne else2827
	call inject_big
	jmp endif2827
else2827:
endif2827:
endif2826:
endif2825:
endif2824:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl $1, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2828
	call inject_int
	jmp endif2828
else2828:
	cmpl $1, %ebx
	jne else2829
	call inject_bool
	jmp endif2829
else2829:
	cmpl $2, %ebx
	jne else2830
	call inject_big
	jmp endif2830
else2830:
	cmpl $3, %ebx
	jne else2831
	call inject_big
	jmp endif2831
else2831:
endif2831:
endif2830:
endif2829:
endif2828:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ebx
	movl %ecx, %ecx
	movl %ebx, %ebx
	cmpl %ecx, %ebx
	jne else2832
	movl $1, %ecx
	jmp endif2832
else2832:
	movl $0, %ecx
endif2832:
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else2833
	call inject_int
	jmp endif2833
else2833:
	cmpl $1, %ebx
	jne else2834
	call inject_bool
	jmp endif2834
else2834:
	cmpl $2, %ebx
	jne else2835
	call inject_big
	jmp endif2835
else2835:
	cmpl $3, %ebx
	jne else2836
	call inject_big
	jmp endif2836
else2836:
endif2836:
endif2835:
endif2834:
endif2833:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %esi, %ebx
	pushl %ebx
	call tag
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2837
	call inject_int
	jmp endif2837
else2837:
	cmpl $1, %ebx
	jne else2838
	call inject_bool
	jmp endif2838
else2838:
	cmpl $2, %ebx
	jne else2839
	call inject_big
	jmp endif2839
else2839:
	cmpl $3, %ebx
	jne else2840
	call inject_big
	jmp endif2840
else2840:
endif2840:
endif2839:
endif2838:
endif2837:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl $0, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2841
	call inject_int
	jmp endif2841
else2841:
	cmpl $1, %ebx
	jne else2842
	call inject_bool
	jmp endif2842
else2842:
	cmpl $2, %ebx
	jne else2843
	call inject_big
	jmp endif2843
else2843:
	cmpl $3, %ebx
	jne else2844
	call inject_big
	jmp endif2844
else2844:
endif2844:
endif2843:
endif2842:
endif2841:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ecx, %ecx
	movl %ebx, %ebx
	cmpl %ecx, %ebx
	jne else2845
	movl $1, %ecx
	jmp endif2845
else2845:
	movl $0, %ecx
endif2845:
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else2846
	call inject_int
	jmp endif2846
else2846:
	cmpl $1, %ebx
	jne else2847
	call inject_bool
	jmp endif2847
else2847:
	cmpl $2, %ebx
	jne else2848
	call inject_big
	jmp endif2848
else2848:
	cmpl $3, %ebx
	jne else2849
	call inject_big
	jmp endif2849
else2849:
endif2849:
endif2848:
endif2847:
endif2846:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %edx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $0, %eax
	jne else2850
	movl %ebx, %ebx
	jmp endif2850
else2850:
	movl %ebx, %ecx
	movl %ecx, %ebx
endif2850:
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $1, %eax
	jne else2851
	movl -4(%ebp), %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else2852
	call project_int
	jmp endif2852
else2852:
	cmpl $1, %ebx
	jne else2853
	call project_bool
	jmp endif2853
else2853:
	cmpl $2, %ebx
	jne else2854
	call project_big
	jmp endif2854
else2854:
	cmpl $3, %ebx
	jne else2855
	call project_big
	jmp endif2855
else2855:
endif2855:
endif2854:
endif2853:
endif2852:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %esi, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2856
	call project_int
	jmp endif2856
else2856:
	cmpl $1, %ebx
	jne else2857
	call project_bool
	jmp endif2857
else2857:
	cmpl $2, %ebx
	jne else2858
	call project_big
	jmp endif2858
else2858:
	cmpl $3, %ebx
	jne else2859
	call project_big
	jmp endif2859
else2859:
endif2859:
endif2858:
endif2857:
endif2856:
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
	jne else2860
	call inject_int
	jmp endif2860
else2860:
	cmpl $1, %ebx
	jne else2861
	call inject_bool
	jmp endif2861
else2861:
	cmpl $2, %ebx
	jne else2862
	call inject_big
	jmp endif2862
else2862:
	cmpl $3, %ebx
	jne else2863
	call inject_big
	jmp endif2863
else2863:
endif2863:
endif2862:
endif2861:
endif2860:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	jmp endif2851
else2851:
	movl -4(%ebp), %ebx
	pushl %ebx
	call tag
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2864
	call inject_int
	jmp endif2864
else2864:
	cmpl $1, %ebx
	jne else2865
	call inject_bool
	jmp endif2865
else2865:
	cmpl $2, %ebx
	jne else2866
	call inject_big
	jmp endif2866
else2866:
	cmpl $3, %ebx
	jne else2867
	call inject_big
	jmp endif2867
else2867:
endif2867:
endif2866:
endif2865:
endif2864:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl $1, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2868
	call inject_int
	jmp endif2868
else2868:
	cmpl $1, %ebx
	jne else2869
	call inject_bool
	jmp endif2869
else2869:
	cmpl $2, %ebx
	jne else2870
	call inject_big
	jmp endif2870
else2870:
	cmpl $3, %ebx
	jne else2871
	call inject_big
	jmp endif2871
else2871:
endif2871:
endif2870:
endif2869:
endif2868:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ebx, %ecx
	movl %ecx, %ebx
	cmpl %ecx, %ebx
	jne else2872
	movl $1, %ecx
	jmp endif2872
else2872:
	movl $0, %ecx
endif2872:
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else2873
	call inject_int
	jmp endif2873
else2873:
	cmpl $1, %ebx
	jne else2874
	call inject_bool
	jmp endif2874
else2874:
	cmpl $2, %ebx
	jne else2875
	call inject_big
	jmp endif2875
else2875:
	cmpl $3, %ebx
	jne else2876
	call inject_big
	jmp endif2876
else2876:
endif2876:
endif2875:
endif2874:
endif2873:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %esi, %ebx
	pushl %ebx
	call tag
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2877
	call inject_int
	jmp endif2877
else2877:
	cmpl $1, %ebx
	jne else2878
	call inject_bool
	jmp endif2878
else2878:
	cmpl $2, %ebx
	jne else2879
	call inject_big
	jmp endif2879
else2879:
	cmpl $3, %ebx
	jne else2880
	call inject_big
	jmp endif2880
else2880:
endif2880:
endif2879:
endif2878:
endif2877:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %esi
	movl $1, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2881
	call inject_int
	jmp endif2881
else2881:
	cmpl $1, %ebx
	jne else2882
	call inject_bool
	jmp endif2882
else2882:
	cmpl $2, %ebx
	jne else2883
	call inject_big
	jmp endif2883
else2883:
	cmpl $3, %ebx
	jne else2884
	call inject_big
	jmp endif2884
else2884:
endif2884:
endif2883:
endif2882:
endif2881:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %esi, %ecx
	movl %edx, %ebx
	cmpl %ecx, %ebx
	jne else2885
	movl $1, %ebx
	jmp endif2885
else2885:
	movl $0, %ebx
endif2885:
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else2886
	call inject_int
	jmp endif2886
else2886:
	cmpl $1, %ebx
	jne else2887
	call inject_bool
	jmp endif2887
else2887:
	cmpl $2, %ebx
	jne else2888
	call inject_big
	jmp endif2888
else2888:
	cmpl $3, %ebx
	jne else2889
	call inject_big
	jmp endif2889
else2889:
endif2889:
endif2888:
endif2887:
endif2886:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %edx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $0, %eax
	jne else2890
	movl %ebx, %ebx
	jmp endif2890
else2890:
	movl %ecx, %ebx
	movl %ebx, %ebx
endif2890:
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $1, %eax
	jne else2891
	movl -4(%ebp), %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else2892
	call project_int
	jmp endif2892
else2892:
	cmpl $1, %ebx
	jne else2893
	call project_bool
	jmp endif2893
else2893:
	cmpl $2, %ebx
	jne else2894
	call project_big
	jmp endif2894
else2894:
	cmpl $3, %ebx
	jne else2895
	call project_big
	jmp endif2895
else2895:
endif2895:
endif2894:
endif2893:
endif2892:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %esi, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else2896
	call project_int
	jmp endif2896
else2896:
	cmpl $1, %ebx
	jne else2897
	call project_bool
	jmp endif2897
else2897:
	cmpl $2, %ebx
	jne else2898
	call project_big
	jmp endif2898
else2898:
	cmpl $3, %ebx
	jne else2899
	call project_big
	jmp endif2899
else2899:
endif2899:
endif2898:
endif2897:
endif2896:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ecx
	movl %ebx, %ebx
	addl %ecx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2900
	call inject_int
	jmp endif2900
else2900:
	cmpl $1, %ebx
	jne else2901
	call inject_bool
	jmp endif2901
else2901:
	cmpl $2, %ebx
	jne else2902
	call inject_big
	jmp endif2902
else2902:
	cmpl $3, %ebx
	jne else2903
	call inject_big
	jmp endif2903
else2903:
endif2903:
endif2902:
endif2901:
endif2900:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	jmp endif2891
else2891:
	movl -4(%ebp), %ebx
	pushl %ebx
	call tag
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2904
	call inject_int
	jmp endif2904
else2904:
	cmpl $1, %ebx
	jne else2905
	call inject_bool
	jmp endif2905
else2905:
	cmpl $2, %ebx
	jne else2906
	call inject_big
	jmp endif2906
else2906:
	cmpl $3, %ebx
	jne else2907
	call inject_big
	jmp endif2907
else2907:
endif2907:
endif2906:
endif2905:
endif2904:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl $3, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2908
	call inject_int
	jmp endif2908
else2908:
	cmpl $1, %ebx
	jne else2909
	call inject_bool
	jmp endif2909
else2909:
	cmpl $2, %ebx
	jne else2910
	call inject_big
	jmp endif2910
else2910:
	cmpl $3, %ebx
	jne else2911
	call inject_big
	jmp endif2911
else2911:
endif2911:
endif2910:
endif2909:
endif2908:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ecx, %ebx
	movl %ebx, %ecx
	cmpl %ebx, %ecx
	jne else2912
	movl $1, %ecx
	jmp endif2912
else2912:
	movl $0, %ecx
endif2912:
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else2913
	call inject_int
	jmp endif2913
else2913:
	cmpl $1, %ebx
	jne else2914
	call inject_bool
	jmp endif2914
else2914:
	cmpl $2, %ebx
	jne else2915
	call inject_big
	jmp endif2915
else2915:
	cmpl $3, %ebx
	jne else2916
	call inject_big
	jmp endif2916
else2916:
endif2916:
endif2915:
endif2914:
endif2913:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %ecx
	movl %esi, %ebx
	pushl %ebx
	call tag
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2917
	call inject_int
	jmp endif2917
else2917:
	cmpl $1, %ebx
	jne else2918
	call inject_bool
	jmp endif2918
else2918:
	cmpl $2, %ebx
	jne else2919
	call inject_big
	jmp endif2919
else2919:
	cmpl $3, %ebx
	jne else2920
	call inject_big
	jmp endif2920
else2920:
endif2920:
endif2919:
endif2918:
endif2917:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl $3, %ebx
	pushl %ebx
	movl $0, %ebx
	cmpl $0, %ebx
	jne else2921
	call inject_int
	jmp endif2921
else2921:
	cmpl $1, %ebx
	jne else2922
	call inject_bool
	jmp endif2922
else2922:
	cmpl $2, %ebx
	jne else2923
	call inject_big
	jmp endif2923
else2923:
	cmpl $3, %ebx
	jne else2924
	call inject_big
	jmp endif2924
else2924:
endif2924:
endif2923:
endif2922:
endif2921:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ebx
	movl %ebx, %ecx
	cmpl %ebx, %ecx
	jne else2925
	movl $1, %ecx
	jmp endif2925
else2925:
	movl $0, %ecx
endif2925:
	movl %ecx, %ebx
	movl %ebx, %ebx
	pushl %ebx
	movl $1, %ebx
	cmpl $0, %ebx
	jne else2926
	call inject_int
	jmp endif2926
else2926:
	cmpl $1, %ebx
	jne else2927
	call inject_bool
	jmp endif2927
else2927:
	cmpl $2, %ebx
	jne else2928
	call inject_big
	jmp endif2928
else2928:
	cmpl $3, %ebx
	jne else2929
	call inject_big
	jmp endif2929
else2929:
endif2929:
endif2928:
endif2927:
endif2926:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %ecx, %ecx
	pushl %ecx
	call is_true
	addl $4, %esp
	cmpl $0, %eax
	jne else2930
	movl %ecx, %ebx
	jmp endif2930
else2930:
	movl %edx, %ecx
	movl %ecx, %ebx
endif2930:
	movl %ebx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	pushl %ebx
	call is_true
	addl $4, %esp
	cmpl $1, %eax
	jne else2931
	movl -4(%ebp), %ebx
	pushl %ebx
	movl $3, %ebx
	cmpl $0, %ebx
	jne else2932
	call project_int
	jmp endif2932
else2932:
	cmpl $1, %ebx
	jne else2933
	call project_bool
	jmp endif2933
else2933:
	cmpl $2, %ebx
	jne else2934
	call project_big
	jmp endif2934
else2934:
	cmpl $3, %ebx
	jne else2935
	call project_big
	jmp endif2935
else2935:
endif2935:
endif2934:
endif2933:
endif2932:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %esi, %ebx
	pushl %ebx
	movl $3, %ebx
	cmpl $0, %ebx
	jne else2936
	call project_int
	jmp endif2936
else2936:
	cmpl $1, %ebx
	jne else2937
	call project_bool
	jmp endif2937
else2937:
	cmpl $2, %ebx
	jne else2938
	call project_big
	jmp endif2938
else2938:
	cmpl $3, %ebx
	jne else2939
	call project_big
	jmp endif2939
else2939:
endif2939:
endif2938:
endif2937:
endif2936:
	movl %eax, %ebx
	addl $4, %esp
	movl %ebx, %edx
	movl %edx, %ecx
	movl %edx, %ebx
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
	jne else2940
	call inject_int
	jmp endif2940
else2940:
	cmpl $1, %ebx
	jne else2941
	call inject_bool
	jmp endif2941
else2941:
	cmpl $2, %ebx
	jne else2942
	call inject_big
	jmp endif2942
else2942:
	cmpl $3, %ebx
	jne else2943
	call inject_big
	jmp endif2943
else2943:
endif2943:
endif2942:
endif2941:
endif2940:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
	jmp endif2931
else2931:
	movl -12(%ebp), %ebx
	call type_error
	movl %eax, %ecx
	addl $0, %esp
	movl %ecx, %ebx
	movl %ebx, %ecx
	movl %ecx, %ebx
endif2931:
	movl %ebx, %ecx
	movl %ecx, %ebx
endif2891:
	movl %ebx, %ecx
	movl %ecx, %ebx
endif2851:
	movl %ebx, %ecx
	movl %ecx, %ebx
endif2811:
	movl %ebx, %ecx
	movl %ecx, %ebx
endif2771:
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
	addl $4908, %esp
	leave
	ret
