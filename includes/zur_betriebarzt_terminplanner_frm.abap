*&---------------------------------------------------------------------*
*&  Include           ZUR_BETRIEBARZT_TERMINPLANNER_FRM
*&---------------------------------------------------------------------*



*&---------------------------------------------------------------------*
*&      Form  CLEAR_FIELD
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
form clear_field .
  clear: gv_patient_name,
         gv_patient_surname,
         gv_patient_email,
         gv_patient_phone,
         gv_patient_purpose,
         gv_rad2,
         gv_rad3,
         gv_date,
         gv_insurence,
         gv_insurence_num,
         gv_insurence_kase.

  gv_rad1 = abap_true.

endform.

*&---------------------------------------------------------------------*
*&      Form  SAVE_DATA
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
form save_data .

  data: lv_time   type char10,
        lv_drname type char30,
        lv_result type xfeld.

  gs_ptlog-patient_name = gv_patient_name.
  gs_ptlog-patient_surname = gv_patient_surname.
  gs_ptlog-patient_email = gv_patient_email.
  gs_ptlog-patient_phone = gv_patient_phone.
  gs_ptlog-patient_purpose = gv_patient_purpose.

  if gv_rad1 eq abap_true.
    gs_ptlog-doctor_name = 'DR.HOWARD SHARP'.
    lv_drname = gs_ptlog-doctor_name.
  elseif gv_rad2 eq abap_true.
    gs_ptlog-doctor_name = 'DR.KATHERINA KNOX'.
    lv_drname = gs_ptlog-doctor_name.
  else.
    gs_ptlog-doctor_name = 'DR.MEGHAN RIVERS'.
    lv_drname = gs_ptlog-doctor_name.
  endif.

  gs_ptlog-app_date = gv_date.
  gs_ptlog-app_time = gv_time.
  gs_ptlog-ver_name = gv_insurence.
  gs_ptlog-ver_num  = gv_insurence_num.
  gs_ptlog-ver_kase = gv_insurence_kase.


  if gv_patient_name eq '' or gv_patient_surname eq '' or gv_patient_phone eq ''.
    message i003.
  else.

    if go_db is not bound.
      create object go_db type zpro_dr_visit_cl.
    endif.

    call method go_db->check_db
      exporting
        iv_drname = lv_drname    " 30 Characters
        iv_datum  = gv_date    " Date
        iv_time   = gv_time   " Character Field Length = 10
      importing
        ev_result = lv_result.   " Character Field Length = 10

  endif.

  if lv_result eq '0'.
    message i000.
  elseif lv_result eq '1'.

    insert zur_betriebarzt_tb from gs_ptlog.
    commit work and wait.

    message i001.

  elseif lv_result eq '2'." '%#AUTOTEXT'.
    message i002.
  endif.

endform.
