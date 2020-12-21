CLASS ycl_z_quote_req DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun .
  class-METHODS: SAVE_REQ
    importing
      F_IN type yup_banfn
    EXPORTING
    VALUE(F_OUT) type yup_banfn.
  METHODS: GET_REQ.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ycl_z_quote_req IMPLEMENTATION.

 METHOD if_oo_adt_classrun~main.
    DATA LV_NAME TYPE yup_banfn.
    out->write( 'Hello World' ).

"   CALL METHOD me->save_req
"       EXPORTING
 "      F_IN  = LV_NAME
 "     importing
  "    F_OUT = LV_NAME.
  " out->write( lv_name ).

 "  DATA: LT_Z_QTHDR TYPE TABLE of YUP_Z_QTHDR.
   select * from YUP_Z_QTHDR  INTO TABLE @DATA(LT_Z_QTHDR).
   out->write( LT_Z_QTHDR ).

  ENDMETHOD.

  METHOD SAVE_REQ.
  DATA: LS_Z_QTHDR TYPE YUP_Z_QTHDR.
    "Then Insert into Itab
    LS_Z_QTHDR = VALUE #(
      banfn   = '00007'
      lifnr       = '223434'
      ekorg       =  'GB00'
      bukrs       = 'GB01'
      waers       =  'GBP'
      zlifnr      =  '223434'
      statu       =  'NEW'
      lnrza       =  ''
      zlsch       =  ''
      zterm       =  ''
      eta         =  ''
      reqcr       =  ''
      app_email   =  ''
      rsrv        =  ''
      reserv      =  ''
      quote       =  ''
      gswrt       =  '100'
      hidamt      =  ''
      fromccd     =  ''
      toccd       =  ''
      tax_rep_cty =  ''
      dp_flag     = ''
      dp_invno    =  ''
      dp_rebzj    =  ''
      "%admin"    =  include yup_s_itchd;
      "%admin1"   =  include yup_zjytuser;
     ).

    "Finally insert into Actual Table
  INSERT YUP_Z_QTHDR FROM @LS_Z_QTHDR.
  F_OUT = LS_Z_QTHDR-BANFN.

  ENDMETHOD.

  METHOD GET_REQ.

  ENDMETHOD.
ENDCLASS.
