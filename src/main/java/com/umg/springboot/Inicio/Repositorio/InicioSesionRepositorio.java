package com.umg.springboot.Inicio.Repositorio;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import oracle.jdbc.OracleTypes;

@Repository
public class InicioSesionRepositorio {

    @Autowired
    private DataSource dataSource;

    // Método para obtener datos del usuario
    public List<Object[]> obtenerDatosUsuario(String email, String contrasena) {
        List<Object[]> resultados = new ArrayList<>();
        String query = "{call ObtenerDatosUsuario(?, ?, ?)}"; // Llamada al procedimiento almacenado

        try (Connection connection = dataSource.getConnection();
             CallableStatement callableStatement = connection.prepareCall(query)) {

            callableStatement.setString(1, email);
            callableStatement.setString(2, contrasena);
            callableStatement.registerOutParameter(3, OracleTypes.CURSOR); // Tipo de dato específico para SYS_REFCURSOR

            // Ejecutar el procedimiento
            callableStatement.execute();

            // Obtener el cursor de resultados
            try (ResultSet resultSet = (ResultSet) callableStatement.getObject(3)) {
                while (resultSet.next()) {
                    String tipoUsuario = resultSet.getString("TipoUsuario");
                    Object[] row;

                    if ("Cliente".equals(tipoUsuario)) {
                        // Obtener datos específicos de la tabla Clientes
                        row = new Object[] {
                            "Cliente",
                            resultSet.getInt("IDUSUARIO"),
                            resultSet.getString("NOMBRECLIENTE"),
                            resultSet.getString("TELEFONO"),
                            resultSet.getString("EMAIL")
                        };
                    } else if ("Personal".equals(tipoUsuario)) {
                        // Obtener datos específicos de la tabla Personal
                        row = new Object[] {
                            "Personal",
                            resultSet.getInt("IDUSUARIO"),
                            resultSet.getString("EMAIL"),
                            resultSet.getString("TELEFONO"),
                            resultSet.getString("PUESTO")
                        };
                    } else {
                        // Usuario no encontrado o tipo desconocido
                        row = new Object[] { "Usuario no encontrado" };
                    }

                    resultados.add(row);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Manejo de excepciones
            resultados.add(new Object[] { "Error al ejecutar el procedimiento: " + e.getMessage() });
        }

        return resultados;
    }

    // Método para insertar un nuevo usuario
    public void insertarUsuario(int idUsuario, int codigoUsuario, String nombreUsuario, String email, String contrasena, String estado) {
        String query = "{call InsertarUsuario(?, ?, ?, ?, ?, ?)}"; // Llamada al procedimiento almacenado

        try (Connection connection = dataSource.getConnection();
             CallableStatement callableStatement = connection.prepareCall(query)) {
             
            callableStatement.setInt(1, idUsuario);
            callableStatement.setInt(2, codigoUsuario);
            callableStatement.setString(3, nombreUsuario);
            callableStatement.setString(4, email);
            callableStatement.setString(5, contrasena);
            callableStatement.setString(6, estado);

            callableStatement.execute(); // Ejecutar el procedimiento
        } catch (SQLException e) {
            e.printStackTrace(); // Manejo de excepciones
        }
    }

    // Método para obtener clientes (usado en la funcionalidad de insertar cliente)
    public void insertarCliente(int idCliente, String nombreCliente, String email, String telefono, String estado, int idUsuario) {
        String query = "{call ObtenerClientes(?, ?)}"; // Llamada al procedimiento almacenado

        try (Connection connection = dataSource.getConnection();
             CallableStatement callableStatement = connection.prepareCall(query)) {
             
            callableStatement.setInt(1, idCliente);
            // No es necesario un segundo parámetro, pero lo incluimos por la estructura del procedimiento
            callableStatement.setNull(2, java.sql.Types.NULL);
            
            // Ejecutar el procedimiento y manejar el cursor si es necesario
            try (ResultSet resultSet = callableStatement.executeQuery()) {
                while (resultSet.next()) {
                    // Maneja los resultados según sea necesario
                    // Aquí podrías insertar la lógica para trabajar con los datos obtenidos
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Manejo de excepciones
        }
    }
}
