class ZCL_TEST definition
  public
  final
  create public .

public section.

  methods SAVE_REQ .
  methods GET_REQ .
protected section.
private section.
ENDCLASS.



CLASS ZCL_TEST IMPLEMENTATION.


  method GET_REQ.

  endmethod.


  method SAVE_REQ.
  Data ls_lfa1 type lfa1.
  Data lt_lfa1 TYPE TABLE of lfa1.
  select * from lfa1 into TABLE lt_lfa1.
  endmethod.
ENDCLASS.
