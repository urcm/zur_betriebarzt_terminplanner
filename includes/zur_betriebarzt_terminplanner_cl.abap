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
