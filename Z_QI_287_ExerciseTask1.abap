*&---------------------------------------------------------------------*
*& Report z_qi_287_exercisetask1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_qi_287_exercisetask1.

DATA: lv_order_header    TYPE bapisdhd,          " Structure for sales order header details
      lt_order_items     TYPE TABLE OF bapisditm, " Table for line items of the sales order
      ls_order_item      TYPE bapisditm,          " Structure for individual line item details
      lt_schedule_lines   TYPE TABLE OF bapischdl, " Table for scheduling lines of the sales order
      ls_schedule_line    TYPE bapischdl,         " Structure for individual schedule line details
      lt_conditions       TYPE TABLE OF bapicond,  " Table for pricing conditions of the sales order
      ls_condition        TYPE bapicond.          " Structure for individual pricing condition details

* Parameter for input of sales order number
PARAMETERS: p_order TYPE vbeln_va OBLIGATORY.  " Required input for sales order number

* Invoke BAPI to retrieve sales order details based on user input
CALL FUNCTION 'BAPI_SALESORDER_GETDETAIL2'
  EXPORTING
    salesdocument       = p_order
  IMPORTING
    order_header        = lv_order_header
  TABLES
    order_items         = lt_order_items
    order_schedlines    = lt_schedule_lines
    order_conditions     = lt_conditions.

IF sy-subrc = 0.

  " Output sales order header information (Order number, Order date, Customer PO, Currency)
  WRITE: / 'Order Number: ', lv_order_header-doc_number,
         / 'Order Date: ', lv_order_header-doc_date,
         / 'Customer PO: ', lv_order_header-purch_no,
         / 'Order Currency: ', lv_order_header-currency.

  " Iterate through order items to display product details
  LOOP AT lt_order_items INTO ls_order_item.

    " Fetch the corresponding quantity from schedule lines
    READ TABLE lt_schedule_lines INTO ls_schedule_line WITH KEY itm_number = ls_order_item-itm_number.

    " Fetch the corresponding price from conditions
    READ TABLE lt_conditions INTO ls_condition WITH KEY itm_number = ls_order_item-itm_number.

    " Display product attributes: description, quantity, and price
    WRITE: / 'Product Description: ', ls_order_item-material,
           / 'Product Quantity: ', ls_schedule_line-req_qty,
           / 'Product Price: ', ls_condition-cond_value.
  ENDLOOP.

ELSE.
  " Output message if the sales order number does not exist
  WRITE: / 'Sales order not found for Sales Order number: ', p_order.

ENDIF.
