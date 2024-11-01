package com.umg.springboot.Inicio.Repositorio;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.CallableStatementCallback;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class HabitacionesRepositorio {

	  @Autowired
	    private JdbcTemplate jdbcTemplate;
	  
	  public List<Map<String, Object>> obtenerServiciosHotel() {
		    String sql = "SELECT * FROM VistaServiciosHotel";

		    return jdbcTemplate.query(sql, (rs, rowNum) -> {
		        Map<String, Object> row = new HashMap<>();
		        row.put("IdHotel", rs.getInt("IdHotel"));
		        row.put("NombreHotel", rs.getString("NombreHotel"));
		        row.put("DireccionHotel", rs.getString("DireccionHotel"));
		        row.put("RakingHotel", rs.getString("RakingHotel"));
		        row.put("HotelEstado", rs.getString("HotelEstado"));
		        row.put("IdBiblioteca", rs.getInt("IdBiblioteca"));
		        row.put("UbicacionBiblioteca", rs.getString("UbicacionBiblioteca"));
		        row.put("BibliotecaHorarioApertura", rs.getString("BibliotecaHorarioApertura"));
		        row.put("BibliotecaHorarioCierre", rs.getString("BibliotecaHorarioCierre"));
		        row.put("BibliotecaEstado", rs.getString("BibliotecaEstado"));
		        row.put("IdGimnasio", rs.getInt("IdGimnasio"));
		        row.put("GimnasioAreasDisponibles", rs.getString("GimnasioAreasDisponibles"));
		        row.put("GimnasioHorarioApertura", rs.getString("GimnasioHorarioApertura"));
		        row.put("GimnasioHorarioCierre", rs.getString("GimnasioHorarioCierre"));
		        row.put("GimnasioEstado", rs.getString("GimnasioEstado"));
		        row.put("IdSpa", rs.getInt("IdSpa"));
		        row.put("SpaNombre", rs.getString("SpaNombre"));
		        row.put("SpaServicios", rs.getString("SpaServicios"));
		        row.put("SpaEstado", rs.getString("SpaEstado"));
		        row.put("IdTransporte", rs.getInt("IdTransporte"));
		        row.put("TransporteTipo", rs.getString("TransporteTipo"));
		        row.put("TransporteCosto", rs.getDouble("TransporteCosto"));
		        row.put("TransporteEstado", rs.getString("TransporteEstado"));
		        row.put("IdPiscina", rs.getInt("IdPiscina"));
		        row.put("PiscinaNombre", rs.getString("PiscinaNombre"));
		        row.put("PiscinaAltitud", rs.getDouble("PiscinaAltitud"));
		        row.put("PiscinaHorarioApertura", rs.getString("PiscinaHorarioApertura"));
		        row.put("PiscinaHorarioCierre", rs.getString("PiscinaHorarioCierre"));
		        row.put("PiscinaEstado", rs.getString("PiscinaEstado"));
		        row.put("IdSalaReunion", rs.getInt("IdSalaReunion"));
		        row.put("SalaNombre", rs.getString("SalaNombre"));
		        row.put("SalaCapacidad", rs.getDouble("SalaCapacidad"));
		        
		        
		        return row;
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
	            // Manejo de la excepción, puedes registrar el error o lanzarlo
	            throw new RuntimeException("Error al insertar comentario", e);
	        }
	    }

	  public void insertarReservacion(int idReservacion, String estadoReservacion, String fechaReservacion, 
              String estado, int idHotel, int idCliente, int idHabitacion) {
			String sql = "{call InsertarReservacion(?, ?, ?, ?, ?, ?, ?)}";
			
			try {
			jdbcTemplate.execute(sql, (CallableStatementCallback<Void>) cs -> {
			cs.setInt(1, idReservacion);
			cs.setString(2, estadoReservacion);
			cs.setDate(3, java.sql.Date.valueOf(fechaReservacion)); 
			cs.setString(4, estado);
			cs.setInt(5, idHotel);
			cs.setInt(6, idCliente);
			cs.setInt(7, idHabitacion);
			cs.execute();
			return null;
			});
			} catch (Exception e) {
			// Manejo de la excepción, puedes registrar el error o lanzarlo
			throw new RuntimeException("Error al insertar reservación", e);
			}
	  }

}
