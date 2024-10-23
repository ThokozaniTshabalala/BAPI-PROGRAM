*&---------------------------------------------------------------------*
*& Report z_qi_272_exercisetask2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_qi_272_exercisetask2.

DATA: ls_order_header      TYPE vbak,
      ls_order_item        TYPE vbap,
      lt_order_items       TYPE TABLE OF vbap,
      lt_order_headers     TYPE TABLE OF vbak.

*getting the order number from user
PARAMETERS: p_order TYPE vbeln_va OBLIGATORY.

SELECT SINGLE * FROM vbak INTO ls_order_header WHERE vbeln = p_order.

*Loop order items and get relevant details
IF sy-subrc = 0.

  SELECT * FROM vbap INTO TABLE lt_order_items WHERE vbeln = p_order.

  WRITE: / 'Order Number: ', ls_order_header-vbeln,
         / 'Order Date: ', ls_order_header-erdat,
         / 'Customer PO: ', ls_order_header-kunnr,
         / 'Order Currency: ', ls_order_header-waerk.

  LOOP AT lt_order_items INTO ls_order_item.

    WRITE: / 'Product Description (Material): ', ls_order_item-matnr,
           / 'Product Quantity: ', ls_order_item-kwmeng,
           / 'Product Price: ', ls_order_item-netpr.
  ENDLOOP.

ELSE.
  WRITE: / 'Sales order not found for Sales Order number: ', p_order.
ENDIF.
