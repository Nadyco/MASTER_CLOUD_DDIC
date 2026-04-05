CLASS zcl_insert_univ_na DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_insert_univ_na IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DELETE FROM zuniversity_na.


    MODIFY zuniversity_na FROM TABLE @( VALUE #( (   soc          = '5000'
                                                     exercise     = '2023'
                                                     student_id   = '000001'
                                                     first_name   = 'Marcos'
                                                     last_name    = 'cabrera'
                                                     course_code  = '10'
                                                     course_price = '15000.00'
                                                     currency     =  'ARS'
                                                     courses      =  '15'
                                                     unit         =  ''
                                                    )

                                                 (   soc          = '2000'
                                                     exercise     = '2020'
                                                     student_id   = '000002'
                                                     first_name   = 'Sergio'
                                                     last_name    = 'Aguero'
                                                     course_code  = '15'
                                                     course_price = '30000.00'
                                                     currency     =  'ARS'
                                                     courses      =  '18'
                                                     unit         =  ''
                                                    )
                                                    (   soc       = '1000'
                                                     exercise     = '2021'
                                                     student_id   = '000003'
                                                     first_name   = 'Dibu'
                                                     last_name    = 'Martinez'
                                                     course_code  = '18'
                                                     course_price = '10000.00'
                                                     currency     =  'ARS'
                                                     courses      =  '10'
                                                     unit         =  ''
                                                    )
                                                    (   soc          = '3000'
                                                     exercise     = '2022'
                                                     student_id   = '000004'
                                                     first_name   = 'Diago Armando'
                                                     last_name    = 'Maradona'
                                                     course_code  = '10'
                                                     course_price = '100000.00'
                                                     currency     =  'ARS'
                                                     courses      =  '10'
                                                     unit         =  ''
                                                    )
                                                 (   soc          = '4000'
                                                     exercise     = '2026'
                                                     student_id   = '000005'
                                                     first_name   = 'Lionel Andres'
                                                     last_name    = 'MESSI'
                                                     course_code  = '10'
                                                     course_price = '1000000.00'
                                                     currency     =  'ARS'
                                                     courses      =  '10'
                                                     unit         =  ''
                                                    )
                                            ) ).


    out->write( 'SALIDA').

  ENDMETHOD.
ENDCLASS.
