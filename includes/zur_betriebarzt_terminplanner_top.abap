
*&---------------------------------------------------------------------*
*&  Include           ZUR_BETRIEBARZT_TERMINPLANNER_TOP
*&---------------------------------------------------------------------*

type-pools: icon.


data: gv_patient_name    type zur_betriebarzt_patient_name,
      gv_patient_surname type zur_betriebarzt_patient_srname,
      gv_patient_email   type zur_betriebarzt_patient_email,
      gv_patient_phone   type zur_betriebarzt_patient_phone,
      gv_patient_purpose type zur_betriebarzt_patient_prpose,
      gv_date            type zur_betriebarzt_date,
      gv_insurence       type zur_betriebarzt_insurence,
      gv_insurence_num   type zur_betriebarzt_insurence_num,
      gv_insurence_kase  type zur_betriebarzt_insurence_kase,
      gv_diagnose        type zur_betriebarzt_diagnose,
      gv_dr_num          type zur_betriebarzt_dr_num,
      gv_status          type zur_betriebarzt_status,
      gv_transferto      type zur_betriebarzt_transferto,
      gv_today           type zur_betriebarzt_today,
      gv_rad1            type xfeld,
      gv_rad2            type xfeld,
      gv_rad3            type xfeld.

types: begin of gty_zur_betriebarzt_tb,
         status          type icon_d,
         patient_name    type zur_betriebarzt_patient_name,
         patient_surname type zur_betriebarzt_patient_surnme,
         patient_email   type zur_betriebarzt_patient_email,
         patient_phone   type zur_betriebarzt_patient_phone,
         patient_purpose type zur_betriebarzt_patient_prpose,
         app_date        type zur_betriebarzt_date,
         doctor_name     type zur_betriebarzt_doctor_name,
         app_time        type zur_betriebarzt_app_time,
         insurence       type zur_betriebarzt_insurence,
         insurence_num   type zur_betriebarzt_insurence_num,
         insurence_kase  type zur_betriebarzt_insurence_kase,
         cell_color      type lvc_t_scol,
       end of gty_zur_betriebarzt_tb.

types: begin of gty_zur_betriebarzt_transfer,
         patient_name    type zur_betriebarzt_patient_name,
         patient_surname type zur_betriebarzt_patient_surnme,
         insurence_num   type zur_betriebarzt_insurence_num,
         transfer_to     type zur_betriebarzt_transferto,
         diagnose        type zur_betriebarzt_diagnose,
         create_date     type zur_betriebarzt_date,
         arzt_nr         type zur_betriebarzt_dr_num,
         status          type zur_betriebarzt_status,
       end of gty_zur_betriebarzt_transfer.

data: gt_today_appointment type table of gty_zur_betriebarzt_tb,
      gt_appointment       type table of gty_zur_betriebarzt_tb,
      gt_transfer_raw      type table of zur_betriebarzt_tb,
      gt_transfer          type table of gty_zur_betriebarzt_transfer.

data: gs_cell_color    type lvc_s_scol,
      gt_fcat          type lvc_t_fcat,
      gt_transfer_fcat type lvc_t_fcat,
      ls_ly            type lvc_s_layo,
      gv_time          type char10.


data: gs_appointment    type zur_betriebarzt_tb,
      gs_appointment_ty type gty_zur_betriebarzt_tb,
      gs_transfer_raw   type zur_betriebarzt_tb,
      gs_transfer       type zur_betriebarzt_transfer.


data: alv_alldata_container  type ref to cl_gui_custom_container,
      alv_all_data_grid      type ref to cl_gui_alv_grid,
      alv_today_container    type ref to cl_gui_custom_container,
      alv_today_grid         type ref to cl_gui_alv_grid,
      alv_transfer_container type ref to cl_gui_custom_container,
      alv_transfer_grid      type ref to cl_gui_alv_grid,
      go_salv                type ref to cl_salv_table,
      go_db                  type ref to zur_betriebarzt_cl.


class lcl_event_receiver definition deferred.
data: event_receiver type ref to lcl_event_receiver.

controls tb_id type tabstrip.

start-of-selection.
  call screen 0100.
