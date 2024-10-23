Customer code: Z_QI_237_CUSTOMERS
*&---------------------------------------------------------------------*
*& Report z_qi_287_customers
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_qi_287_customers.

*DATA it_customers TYPE TABLE OF kna1.
*DATA wa_customer TYPE kna1.

*SELECT * FROM KNA1 INTO TABLE it_customers.

*IF sy-subrc = 0.
*    PARAMETERS s_term LIKE wa_customer-sortl.
*    LOOP AT it_customers INTO wa_customer.
*        IF wa_customer-sortl = '287'.
*            WRITE:/ wa_customer-kunnr, wa_customer-name1, wa_customer-land1,
*            wa_customer-ort01, wa_customer-stras.
*        ENDIF.
*    ENDLOOP.
*ELSE.
*    WRITE: 'The SQL statement was not executed successfully'.
*ENDIF.


TABLES: kna1.
PARAMETERS s_term LIKE kna1-sortl. "capture the search term of the type SORTL"


SELECT * FROM kna1 WHERE sortl = s_term. "only read records with the specific search term"

    WRITE:/ kna1-kunnr, kna1-name1, kna1-land1, kna1-ort01, kna1-stras.

ENDSELECT.

IF sy-subrc <> 0.
    WRITE:/ 'No records found'.
ENDIF.
