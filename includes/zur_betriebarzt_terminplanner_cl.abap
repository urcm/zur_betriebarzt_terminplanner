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

  endmethod.
