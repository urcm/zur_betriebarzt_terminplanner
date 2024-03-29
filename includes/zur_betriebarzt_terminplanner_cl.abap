*&---------------------------------------------------------------------*
*&  Include           ZUR_BETRIEBARZT_TERMINPLANNER
*&---------------------------------------------------------------------*

class lcl_event_receiver definition.
  public section.
    methods:
      handle_toolbar
                    for event toolbar of cl_gui_alv_grid
        importing e_object e_interactive,
        
      handle_user_command
                    for event user_command of cl_gui_alv_grid
        importing e_ucomm.
  private section.
endclass.

class lcl_event_receiver implementation.
  method handle_toolbar.
    data: ls_toolbar  type stb_button.
    
    clear ls_toolbar.
    move 3 to ls_toolbar-butn_type.
    append ls_toolbar to e_object->mt_toolbar.

    clear ls_toolbar.
    move '&DELETE_APPOINTMENT' to ls_toolbar-function.
    move icon_delete to ls_toolbar-icon.
    move 'Termine Löschen' to ls_toolbar-quickinfo.
    move 'Termine Löschen' to ls_toolbar-text.
    move ' ' to ls_toolbar-disabled.
    append ls_toolbar to e_object->mt_toolbar.
    
    clear ls_toolbar.
    move '&TRANSFERTO' to ls_toolbar-function.
    move icon_short_message to ls_toolbar-icon.
    move 'Überwiesen' to ls_toolbar-quickinfo.
    move 'Überwiesen' to ls_toolbar-text.
    move ' ' to ls_toolbar-disabled.
    append ls_toolbar to e_object->mt_toolbar.
  endmethod.
  
  
  method handle_user_command.

    data: lt_rows type lvc_t_row.

    case e_ucomm.
      when '&DELETE_APPOINTMENT'.

        call method alv_grid->get_selected_rows
          importing
            et_index_rows = lt_rows.

        call method cl_gui_cfw=>flush.

        if sy-subrc ne 0.
          call function 'POPUP_TO_INFORM'
            exporting
              titel = sy-repid
              txt2  = sy-subrc
              txt1  = 'Error in Flush'.
        else.
          perform delete_apointment tables lt_rows.
        endif.
        
      when '&TRANSFER'.

        call method alv_grid->get_selected_rows
          importing
            et_index_rows = lt_rows.
            
         call method cl_gui_cfw=>flush.

        perform patient_transfer tables lt_rows.        
       
        call screen 0104 starting at 10 08
                            ending at 100 30.
        
    endcase.
  endmethod.  
