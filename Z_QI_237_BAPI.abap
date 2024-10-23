*&---------------------------------------------------------------------*
*& Report z_qi_287_bapi
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_qi_287_bapi.

DATA: wa_address TYPE BAPICUSTOMER_04.

PARAMETERS: customer TYPE BAPICUSTOMER_ID-CUSTOMER.

CALL FUNCTION 'BAPI_CUSTOMER_GETDETAIL2' "BAPI CALL
    EXPORTING
      customerno       = customer
    IMPORTING
      customeraddress  = wa_address.

WRITE: / 'Name: ', wa_address-name,
       / 'Street: ', wa_address-street,
       / 'City: ', wa_address-city,
       / 'Country: ', wa_address-country.
