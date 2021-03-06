
# parsetab.py
# This file is automatically generated. Do not edit.
_tabversion = '3.2'

_lr_method = 'LALR'

_lr_signature = '|\xcc\xd1\xb6c6]=\xb6\xca\xfdJ\x00FJ$'
    
_lr_action_items = {'RPAREN':([3,9,13,14,15,21,22,],[-9,-13,21,-8,-10,-12,-11,]),'INT':([0,1,3,5,6,7,8,9,10,11,14,15,16,18,19,20,21,22,],[3,3,-9,3,3,3,3,-13,-5,-8,-8,-10,-7,-6,3,-14,-12,-11,]),'ASSIGN':([11,],[20,]),'UNARY_SUB':([0,1,3,5,6,7,8,9,10,11,14,15,16,18,19,20,21,22,],[5,5,-9,5,5,5,5,-13,-5,-8,-8,-10,-7,-6,5,-14,-12,-11,]),'PLUS':([3,9,10,11,13,14,15,16,18,21,22,],[-9,-13,19,-8,19,-8,-10,19,19,-12,-11,]),'LPAREN':([0,1,3,5,6,7,8,9,10,11,14,15,16,18,19,20,21,22,],[1,1,-9,1,1,1,1,-13,-5,-8,-8,-10,-7,-6,1,-14,-12,-11,]),'PRINT':([0,3,7,9,10,11,14,15,16,18,21,22,],[8,-9,8,-13,-5,-8,-8,-10,-7,-6,-12,-11,]),'INPUT':([0,1,3,5,6,7,8,9,10,11,14,15,16,18,19,20,21,22,],[9,9,-9,9,9,9,9,-13,-5,-8,-8,-10,-7,-6,9,-14,-12,-11,]),'ID':([0,1,3,5,6,7,8,9,10,11,14,15,16,18,19,20,21,22,],[11,14,-9,14,14,11,14,-13,-5,-8,-8,-10,-7,-6,14,-14,-12,-11,]),'$end':([0,2,3,4,7,9,10,11,12,14,15,16,17,18,21,22,],[-15,-1,-9,0,-3,-13,-5,-8,-4,-8,-10,-7,-2,-6,-12,-11,]),}

_lr_action = { }
for _k, _v in _lr_action_items.items():
   for _x,_y in zip(_v[0],_v[1]):
      if not _x in _lr_action:  _lr_action[_x] = { }
      _lr_action[_x][_k] = _y
del _lr_action_items

_lr_goto_items = {'statement-list':([0,7,],[2,17,]),'module':([0,],[4,]),'assName':([0,7,],[6,6,]),'statement':([0,7,],[7,7,]),'expression':([0,1,5,6,7,8,19,],[10,13,15,16,10,18,22,]),'empty':([0,7,],[12,12,]),}

_lr_goto = { }
for _k, _v in _lr_goto_items.items():
   for _x,_y in zip(_v[0],_v[1]):
       if not _x in _lr_goto: _lr_goto[_x] = { }
       _lr_goto[_x][_k] = _y
del _lr_goto_items
_lr_productions = [
  ("S' -> module","S'",1,None,None,None),
  ('module -> statement-list','module',1,'p_module','hw2/parse.py',21),
  ('statement-list -> statement statement-list','statement-list',2,'p_statement_list','hw2/parse.py',36),
  ('statement-list -> statement','statement-list',1,'p_statement_list','hw2/parse.py',37),
  ('statement-list -> empty','statement-list',1,'p_statement_list','hw2/parse.py',38),
  ('statement -> expression','statement',1,'p_statement_discard','hw2/parse.py',64),
  ('statement -> PRINT expression','statement',2,'p_print_statement','hw2/parse.py',77),
  ('statement -> assName expression','statement',2,'p_assign_statement','hw2/parse.py',90),
  ('expression -> ID','expression',1,'p_expression_name','hw2/parse.py',116),
  ('expression -> INT','expression',1,'p_int_expression','hw2/parse.py',132),
  ('expression -> UNARY_SUB expression','expression',2,'p_expression_unary_sub','hw2/parse.py',145),
  ('expression -> expression PLUS expression','expression',3,'p_plus_expression','hw2/parse.py',158),
  ('expression -> LPAREN expression RPAREN','expression',3,'p_expression_group','hw2/parse.py',171),
  ('expression -> INPUT','expression',1,'p_expression_input','hw2/parse.py',184),
  ('assName -> ID ASSIGN','assName',2,'p_assName','hw2/parse.py',197),
  ('empty -> <empty>','empty',0,'p_empty','hw2/parse.py',207),
]
