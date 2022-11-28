
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
