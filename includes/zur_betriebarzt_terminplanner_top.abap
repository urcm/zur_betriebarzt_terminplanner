
*&---------------------------------------------------------------------*
*&  Include           ZUR_BETRIEBARZT_TERMINPLANNER_TOP
*&---------------------------------------------------------------------*
type-pools: icon.

data: gv_patient_name    type zur_betriebarzt_patient_name,
      gv_patient_surname type zur_betriebarzt_patient_surname,
      gv_patient_email   type zur_betriebarzt_patient_email, 
      gv_patient_phone   type zur_betriebarzt_patient_phone, 
      gv_patient_purpose type zur_betriebarzt_patient_purpose,
      gv_date            type zur_betriebarzt_date,
      gv_insurence       type zur_betriebarzt_insurence,
      gv_insurence_num   type zur_betriebarzt_insurence_num,
      gv_insurence_kase  type zur_betriebarzt_insurence_kase,
      gv_diagnose        type zur_betriebarzt_diagnose,
      gv_dr_num          type zur_betriebarzt_dr_num,
      gv_status          type zur_betriebarzt_status,
      gv_transferto      type zur_betriebarzt_transferto,
      gv_today           type zur_betriebarzt_today.


data: gv_rad1 type xfeld,
      gv_rad2 type xfeld,
      gv_rad3 type xfeld.
      
      
types: begin of gty_zur_betriebarzt_tb,
         status          type icon_d,
         patient_name    type zur_betriebarzt_patient_name,
         patient_surname type zur_betriebarzt_patient_surname,
         patient_email   type zur_betriebarzt_patient_email,
         patient_phone   type zur_betriebarzt_patient_phone,
         patient_purpose type zur_betriebarzt_patient_purpose,
         app_date        type zur_betriebarzt_date,
         doctor_name     type zur_betriebarzt_doctor_name,
         app_time        type zur_betriebarzt_app_time,
         insurence       type zur_betriebarzt_insurence,
         insurence_num   type zur_betriebarzt_insurence_num,
         insurence_kase  type zur_betriebarzt_insurence_kase,
         cell_color      type lvc_t_scol,
       end of gty_zur_betriebarzt_tb.

data: gs_cell_color type lvc_s_scol. 

data: gt_appointment    type table of gty_zur_betriebarzt_tb,
      gs_appointment    type zur_betriebarzt_tb,
      gs_appointment_ty type gty_zur_betriebarzt_tb.

data: gt_transfer_raw type table of zur_betriebarzt_tb,
      gs_transfer_raw type zur_betriebarzt_tb.

data: go_salv type ref to cl_salv_table.

data: alv_alldata_container  type ref to cl_gui_custom_container,
      alv_all_data grid      type ref to cl_gui_alv_grid.

data: gt_fcat type lvc_t_fcat.

data: go_db type ref to zur_betriebarzt_cl.



