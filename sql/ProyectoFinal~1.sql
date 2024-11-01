/*BEGIN --ELIMINA TODAS LAS TABLAS DEL ESQUEMA NO USAR
   FOR t IN (SELECT table_name FROM user_tables) LOOP
      EXECUTE IMMEDIATE 'DROP TABLE ' || t.table_name || ' CASCADE CONSTRAINTS';
   END LOOP;
END;
/*/

DECLARE
    v_IdHotel INT;            -- Variable para almacenar ID de hotel
    v_Nombre VARCHAR2(100);
    v_Direccion VARCHAR2(200);
    v_Ranking NUMBER;
BEGIN
    -- 1. Insertar un nuevo hotel
    InsertarHotel(
        p_IdHotel => 3,
        p_Nombre => 'Hotel Juan',
        p_Direccion => 'Flores Peten',
        p_Ranking => 5
    );

  /*  -- Insertar otro hotel
    InsertarHotel(
        p_IdHotel => 2,
        p_Nombre => 'Hotel Costa',
        p_Direccion => 'Playa del Sol 456',
        p_Ranking => 5
    );*/

    -- 2. Actualizar un hotel existente
    /*ActualizarHotel(
        p_IdHotel => 1,
        p_Nombre => 'Hotel Plaza Renovado',
        p_Direccion => 'Avenida Principal 123, Edificio B',
        p_Ranking => 4
    );*/

    -- 3. Eliminar un hotel (marcar como inactivo)
 /*   EliminarHotel(
        p_IdHotel => 2
    );
*/

EXCEPTION
    WHEN OTHERS THEN
        -- Manejo de errores
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/
DECLARE
    v_Cursor SYS_REFCURSOR;      -- Cursor para obtener hoteles
    v_IdHotel INT;                -- Variable para almacenar ID de hotel
    v_Nombre VARCHAR2(80);        -- Variable para almacenar el nombre del hotel
    v_Direccion VARCHAR2(200);    -- Variable para almacenar la dirección del hotel
    v_Ranking NUMBER;             -- Variable para almacenar el ranking del hotel
    v_Estado CHAR(1);            -- Variable para almacenar el estado del hotel
BEGIN
    -- Llamar al procedimiento sin parámetros para obtener todos los hoteles
    ObtenerHoteles(
        o_Cursor => v_Cursor
    );

    -- Leer el cursor y mostrar resultados
    LOOP
        FETCH v_Cursor INTO v_IdHotel, v_Nombre, v_Direccion, v_Ranking, v_Estado;
        EXIT WHEN v_Cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID: ' || v_IdHotel || ', Nombre: ' || v_Nombre || ', Dirección: ' || v_Direccion || ', Ranking: ' || v_Ranking || ', Estado: ' || v_Estado);
    END LOOP;

    CLOSE v_Cursor;  -- Cerrar el cursor al final

EXCEPTION
    WHEN OTHERS THEN
        -- Manejo de errores
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/
select * From tablaHotel;

select * from VistaServiciosHotel;
select ContarClientesHotel(1) from dual;

