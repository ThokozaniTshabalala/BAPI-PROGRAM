FIRST PROGRAM: Z_QI_237_ FIRSTPROGRAM
*&---------------------------------------------------------------------*
*& Report z_qi_287_firstprogram
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_qi_287_firstprogram.

TYPES: BEGIN OF str_student,
       firstName TYPE string,
       lastName TYPE string,
       studentNumber TYPE string,
       END OF STR_STUDENT.

PARAMETERS: fname TYPE string, lname TYPE string, snumber TYPE string.

DATA student TYPE str_student.

student-firstname = fname.
student-lastname = lname.
student-studentnumber = snumber.

WRITE: 'Your details are as follows: ', 'Fullname:', student-firstname,
' ',student-lastname, 'Student Number:', student-studentnumber.
