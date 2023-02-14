*&---------------------------------------------------------------------*
*&  Include           ZUR_BETRIEBARZT_TERMINPLANNER_PAI
*&---------------------------------------------------------------------*


*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0100  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
module user_command_0100 input.

case sy-ucomm.
    when '&BACK' or '&EXIT'.
      set screen 0.
    when '&TAB1'.
      tb_id-activetab = '&TAB1'.  
    when '&TAB2'.
      tb_id-activetab = '&TAB2'.
    when '&TAB3'.
      tb_id-activetab = '&TAB3'.
endcase.

endmodule.
