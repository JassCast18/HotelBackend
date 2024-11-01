package com.umg.springboot.Inicio.Repositorio;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.CallableStatementCallback;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@Repository
public class MenuRepositorio {
	 @Autowired
    private JdbcTemplate jdbcTemplate;

   
    public List<Object[]> obtenerReservaciones(Integer idReservacion) {
        return jdbcTemplate.execute("{call ObtenerReservaciones(?, ?)}", (CallableStatement stmt) -> {
            stmt.setObject(1, idReservacion);
            stmt.registerOutParameter(2, oracle.jdbc.OracleTypes.CURSOR);

            stmt.execute();
            ResultSet rs = (ResultSet) stmt.getObject(2);

            List<Object[]> reservacionesList = new ArrayList<>();
            while (rs.next()) {
                Object[] row = new Object[7]; // Asegúrate de que el tamaño sea correcto
                row[0] = rs.getInt("IdReservacion");
                row[1] = rs.getString("EstadoReservacion");
                row[2] = rs.getDate("FechaReservacion");
                row[3] = rs.getString("Estado");
                row[4] = rs.getInt("IdHotel");
                row[5] = rs.getInt("IdCliente");
                row[6] = rs.getInt("IdHabitacion"); // Asegúrate de que esta columna existe
                reservacionesList.add(row);
            }
            return reservacionesList;
        });
    }

    
    public void insertarComentario(int idComentarios, String asunto, String descripcion, 
            String estado, int idReservacion, int idCliente) {
        String sql = "{call InsertarComentario(?, ?, ?, ?, ?, ?)}";

        try {
            jdbcTemplate.execute(sql, (CallableStatementCallback<Void>) cs -> {
                cs.setInt(1, idComentarios);
                cs.setString(2, asunto);
                cs.setString(3, descripcion);
                cs.setString(4, estado);
                cs.setInt(5, idReservacion);
                cs.setInt(6, idCliente);
                cs.execute();
                return null;
            });
        } catch (Exception e) {
            
            throw new RuntimeException("Error al insertar comentario", e);
        }
    }
    

    public List<Object[]> obtenerEventos(Integer idEvento) {
        return jdbcTemplate.execute("{call ObtenerEventos(?, ?)}", (CallableStatement stmt) -> {
            stmt.setObject(1, idEvento);
            stmt.registerOutParameter(2, oracle.jdbc.OracleTypes.CURSOR);

            stmt.execute();
            ResultSet rs = (ResultSet) stmt.getObject(2);

            List<Object[]> eventosList = new ArrayList<>();
            while (rs.next()) {
                Object[] row = new Object[8]; // Ajustamos el tamaño a 7 columnas
                row[0] = rs.getInt("IdEventos");
                row[1] = rs.getString("Nombre");
                row[2] = rs.getDate("FechaInicio");
                row[3] = rs.getDate("FechaFin");
                row[4] = rs.getString("Descripcion");
                row[5] = rs.getString("Estado");
                row[6] = rs.getInt("IdHotel");
                row[7] = rs.getInt("IdCliente");
                eventosList.add(row);
            }
            return eventosList;
        });
    }
    
        // Método para obtener promociones
        public List<Object[]> obtenerPromociones(Integer idPromocion) {
            return jdbcTemplate.execute("{call ObtenerPromociones(?, ?)}", (CallableStatement stmt) -> {
                stmt.setObject(1, idPromocion);
                stmt.registerOutParameter(2, oracle.jdbc.OracleTypes.CURSOR);

                stmt.execute();
                ResultSet rs = (ResultSet) stmt.getObject(2);

                List<Object[]> promocionList = new ArrayList<>();
                while (rs.next()) {
                    Object[] row = new Object[8]; // Ajustamos el tamaño a 7 columnas
                    row[0] = rs.getInt("IdPromocion");
                    row[1] = rs.getString("Descripcion");
                    row[2] = rs.getDate("FechaInicio");
                    row[3] = rs.getDate("FechaFin");
                    row[4] = rs.getBigDecimal("Descuento");
                    row[5] = rs.getString("Estado");
                    row[6] = rs.getInt("IdHotel");
                    row[7] = rs.getInt("IdCliente");
                    promocionList.add(row);
                }
                return promocionList;
            });
        }
    
        // Método para obtener historial de reservaciones
        public List<Object[]> ObtenerHistorialReservaciones(Integer idHistorialReservacion) {
            return jdbcTemplate.execute("{call ObtenerHistorialReservaciones(?, ?)}", (CallableStatement stmt) -> {
                stmt.setObject(1, idHistorialReservacion);
                stmt.registerOutParameter(2, oracle.jdbc.OracleTypes.CURSOR);

                stmt.execute();
                ResultSet rs = (ResultSet) stmt.getObject(2);

                List<Object[]> lista = new ArrayList<>();
                while (rs.next()) {
                    Object[] row = new Object[5]; // Ajustamos el tamaño a 5 columnas
                    row[0] = rs.getInt("IdHistorial");
                    row[1] = rs.getString("Accion");
                    row[2] = rs.getDate("FechaModificacion");
                    row[3] = rs.getString("Estado");
                    row[4] = rs.getInt("IdReservacion");
                    lista.add(row);
                }
                return lista;
            });
        }
    
    public void insertarHotel(int IdHotel, String Nombre, String Direccion, 
            String Ranking, String estado) {
        String sql = "{call InsertarHotel(?, ?, ?, ?, ?)}";

        try {
            jdbcTemplate.execute(sql, (CallableStatementCallback<Void>) cs -> {
                cs.setInt(1, IdHotel);
                cs.setString(2, Nombre);
                cs.setString(3, Direccion);
                cs.setString(4, Ranking);
                cs.setString(5, estado);
                cs.execute();
                return null;
            });
        } catch (Exception e) {
            // Manejo de la excepción, puedes registrar el error o lanzarlo
            throw new RuntimeException("Error al insertar hotel", e);
        }
    }
    
    public void insertarComentarioPersonal(int IdComentario, String Comentario, String FechaComentario, 
            String Estado, int IdPersonal, int IdCliente) {
        String sql = "{call InsertarComentarioDePersonal(?, ?, ?, ?, ?,?)}";

        try {
            jdbcTemplate.execute(sql, (CallableStatementCallback<Void>) cs -> {
                cs.setInt(1, IdComentario);
                cs.setString(2, Comentario);
                cs.setDate(3, java.sql.Date.valueOf(FechaComentario));
                cs.setString(4, Estado);
                cs.setInt(5, IdPersonal);
                cs.setInt(6, IdCliente);

                cs.execute();
                return null;
            });
        } catch (Exception e) {
            // Manejo de la excepción, puedes registrar el error o lanzarlo
            throw new RuntimeException("Error al insertar Comentario de Personal", e);
        }
    }
    
    public void actualizarComentarioPersonal(int IdComentario, String Comentario, String FechaComentario, int IdPersonal, int IdCliente) {
        String sql = "{call ActualizarComentarioDePersonal(?, ?, ?, ?, ?)}";

        try {
            jdbcTemplate.execute(sql, (CallableStatementCallback<Void>) cs -> {
                cs.setInt(1, IdComentario);
                cs.setString(2, Comentario);
                cs.setDate(3, java.sql.Date.valueOf(FechaComentario)); // Asegúrate de que la fecha esté en el formato correcto
                cs.setInt(4, IdPersonal);
                cs.setInt(5, IdCliente);

                cs.execute();
                return null;
            });
        } catch (Exception e) {
            // Manejo de la excepción, puedes registrar el error o lanzarlo
            throw new RuntimeException("Error al actualizar Comentario de Personal", e);
        }
    }
    
    public void actualizarHotel(int IdHotel, String Nombre, String Direccion, String Ranking) {
        String sql = "{call ActualizarHotel(?, ?, ?, ?)}";

        try {
            jdbcTemplate.execute(sql, (CallableStatementCallback<Void>) cs -> {
                cs.setInt(1, IdHotel);
                cs.setString(2, Nombre);
                cs.setString(3, Direccion);
                cs.setString(4, Ranking);
                cs.execute();
                return null;
            });
        } catch (Exception e) {
            // Manejo de la excepción, puedes registrar el error o lanzarlo
            throw new RuntimeException("Error al actualizar hotel", e);
        }
    }
    
    public void eliminarHotel(int IdHotel) {
        String sql = "{call EliminarHotel(?)}";

        try {
            jdbcTemplate.execute(sql, (CallableStatementCallback<Void>) cs -> {
                cs.setInt(1, IdHotel);
                cs.execute();
                return null;
            });
        } catch (Exception e) {
            // Manejo de la excepción, puedes registrar el error o lanzarlo
            throw new RuntimeException("Error al eliminar hotel", e);
        }
    }
    
    public void actualizarReservacion(int IdReservacion, String EstadoReservacion, String FechaReservacion, int IdHotel, int IdCliente, int IdHabitacion) {
        String sql = "{call ActualizarReservacion(?, ?, ?, ?, ?, ?)}";

        try {
            jdbcTemplate.execute(sql, (CallableStatementCallback<Void>) cs -> {
                cs.setInt(1, IdHotel);
                cs.setString(2, EstadoReservacion);
                cs.setDate(3, java.sql.Date.valueOf(FechaReservacion)); 
                cs.setInt(4, IdHotel);
                cs.setInt(5, IdCliente);
                cs.setInt(6, IdHabitacion);
                cs.execute();
                return null;
            });
        } catch (Exception e) {
            // Manejo de la excepción, puedes registrar el error o lanzarlo
            throw new RuntimeException("Error al actualizar REservacion", e);
        }
    }
    
  
    
    public void insertarPersonal(int IdPersonal, String Nombre, String Puesto, String Email, 
            String Telefono, String Estado, int IdHotel, int IdUsuario) {
			String sql = "{call InsertarPersonal(?, ?, ?, ?, ?, ?, ?, ?)}";
			
			try {
				jdbcTemplate.execute(sql, (CallableStatementCallback<Void>) cs -> {
				cs.setInt(1, IdPersonal);
				cs.setString(2, Nombre);
				cs.setString(3, Puesto);
				cs.setString(4, Email);
				cs.setString(5, Telefono);
				cs.setString(6, Estado);
				cs.setInt(7, IdHotel);
				cs.setInt(8, IdUsuario);
				
				cs.execute();
				return null;
			});
			} catch (Exception e) {
			// Manejo de la excepción, puedes registrar el error o lanzarlo
				throw new RuntimeException("Error al insertar Personal", e);
			}
    }

}
