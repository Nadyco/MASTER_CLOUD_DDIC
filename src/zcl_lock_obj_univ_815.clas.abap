CLASS zcl_lock_obj_univ_815 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lock_obj_univ_815 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    TRY.
        " SOLO INSTANCIAMOS EL OBJETO QUE VAMOS A USAR PARA BLOQUEAR Y DESBLOQUEAR
        DATA(lo_lock_object) = cl_abap_lock_object_factory=>get_instance(
          EXPORTING
            iv_name        = 'EZ_UNIV_LOCK_815'

        ).
      CATCH cx_abap_lock_failure.

    ENDTRY.



    "UNA VEZ INSTANCIADO LLAMAMOS AL METODO DE BLOQUEO ENQUEE
    DATA: lt_parameter  TYPE if_abap_lock_object=>tt_parameter.

    lt_parameter = VALUE #( ( name = 'SOC'
                              value =  REF #( '5000'  )  )
                              ).

    TRY.
        lo_lock_object->enqueue(
*       it_table_mode =
       it_parameter  = lt_parameter
*       _scope        =
*       _wait         =
        ).
      CATCH cx_abap_foreign_lock.
        out->write( | Exception : Object foreing lock| ).
      CATCH cx_abap_lock_failure.
        out->write( | Exception : Not is Posible write on the database | ).
    ENDTRY.

    out->write( | ENQUEUE OBJECT IS ACTIVE| ).

    MODIFY zuniversity_na FROM TABLE @( VALUE #( (  soc          = '5000'
                                                    exercise     = '2023'
                                                    student_id   = '000001'
                                                    first_name   = 'Cesar'
                                                    last_name    = 'cabrera'
                                                    course_code  = '10'
                                                    course_price = '15000.00'
                                                    currency     =  'ARS'
                                                    courses      =  '15'
                                                    unit         =  ''
                                                   )
                                                   ) ).

    WAIT UP TO 10 SECONDS.

    " DESBLOQUEAMOS EL OBJETO
    TRY.
        lo_lock_object->dequeue(
*    it_table_mode =
          it_parameter  =  lt_parameter
*    _scope        =
*    _synchronous  =
        ).
      CATCH cx_abap_lock_failure.
        out->write( | Exception dequee : Lock Failure | ).
    ENDTRY.


    out->write( | DEQUEUE OBJECT  IS ACTIVE| ).

  ENDMETHOD.
ENDCLASS.
