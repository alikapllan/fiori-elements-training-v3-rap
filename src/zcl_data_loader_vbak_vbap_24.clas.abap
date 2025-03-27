CLASS zcl_data_loader_vbak_vbap_24 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PRIVATE SECTION.
    METHODS create_sample_so_header.
    METHODS create_sample_so_item.
    METHODS reset_sample_datas.

ENDCLASS.


CLASS zcl_data_loader_vbak_vbap_24 IMPLEMENTATION.
  METHOD create_sample_so_header.
    DATA lt_so_header TYPE STANDARD TABLE OF zvbak_24.
    DATA lv_timestamp TYPE timestampl.

    GET TIME STAMP FIELD lv_timestamp.

    lt_so_header = VALUE #( erdat                  = sy-datum
                            ernam                  = 'Alex'
                            vkorg                  = '1000'
                            vtweg                  = '10'
                            spart                  = '10'
                            netwr                  = '2000.00'
                            waerk                  = 'EUR'
                            faksk                  = ''
                            last_changed_timestamp = lv_timestamp
                            ( vbeln = '1001' )
                            ( vbeln = '1002' ) ).

    INSERT zvbak_24 FROM TABLE @lt_so_header.
  ENDMETHOD.

  METHOD create_sample_so_item.
    DATA lt_so_item   TYPE STANDARD TABLE OF zvbap_24.
    DATA lv_timestamp TYPE timestampl.

    GET TIME STAMP FIELD lv_timestamp.

    lt_so_item = VALUE #( netpr                  = '1000'
                          waerk                  = 'EUR'
                          kmein                  = 'PC'
                          last_changed_timestamp = lv_timestamp
                          ( vbeln = '1001'
                            posnr = '10'
                            matnr = 'M-10'
                            arktx = 'Laptop'
                            netwr = '1000'
                            kpein = '1' )
                          ( vbeln = '1001'
                            posnr = '20'
                            matnr = 'M-20'
                            arktx = 'Office Phone'
                            netwr = '1000'
                            kpein = '1' )
                          ( vbeln = '1002'
                            posnr = '10'
                            matnr = 'A-20'
                            arktx = 'Big Office Desk'
                            netwr = '2000'
                            kpein = '2' ) ).

    INSERT zvbap_24 FROM TABLE @lt_so_item.
  ENDMETHOD.

  METHOD reset_sample_datas.
    DELETE FROM zvbak_24.
    DELETE FROM zvbap_24.
  ENDMETHOD.

  METHOD if_oo_adt_classrun~main.
    reset_sample_datas( ).
    create_sample_so_header( ).
    create_sample_so_item( ).

    IF sy-subrc = 0.
      out->write( data = 'Data Written Done' ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.
