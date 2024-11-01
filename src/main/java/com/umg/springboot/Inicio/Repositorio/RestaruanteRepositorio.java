package com.umg.springboot.Inicio.Repositorio;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.CallableStatementCallback;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class RestaruanteRepositorio {

	@Autowired
    private JdbcTemplate jdbcTemplate;
	
	public List<Map<String, Object>> obtenerRestaurantesYMenu() {
	    String sql = "SELECT * FROM VistaRestaurantesYMenu";

	    return jdbcTemplate.query(sql, (rs, rowNum) -> {
	        Map<String, Object> row = new HashMap<>();
	        row.put("IdHotel", rs.getInt("IdHotel"));
	        row.put("NombreHotel", rs.getString("NombreHotel"));
	        row.put("DireccionHotel", rs.getString("DireccionHotel"));
	        row.put("RankingHotel", rs.getString("RankingHotel"));
	        row.put("HotelEstado", rs.getString("HotelEstado"));
	        row.put("IdRestaurante", rs.getInt("IdRestaurante"));
	        row.put("NombreRestaurante", rs.getString("NombreRestaurante"));
	        row.put("UbicacionRestaurante", rs.getString("UbicacionRestaurante"));
	        row.put("RestauranteHorarioApertura", rs.getString("RestauranteHorarioApertura"));
	        row.put("RestauranteHorarioCierre", rs.getString("RestauranteHorarioCierre"));
	        row.put("RestauranteEstado", rs.getString("RestauranteEstado"));
	        row.put("IdMenu", rs.getInt("IdMenu"));
	        row.put("NombrePlatillo", rs.getString("NombrePlatillo"));
	        row.put("DescripcionPlatillo", rs.getString("DescripcionPlatillo"));
	        row.put("PrecioPlatillo", rs.getDouble("PrecioPlatillo"));
	        row.put("MenuEstado", rs.getString("MenuEstado"));

	        return row;
	    });
	}
	public void insertarServiciosReservaciones(int idServiciosReservaciones, int cantidad, 
            String estado, int idReservacion, int idServicio) {
			String sql = "{call InsertarServiciosReservaciones(?, ?, ?, ?, ?)}";
			
			try {
				jdbcTemplate.execute(sql, (CallableStatementCallback<Void>) cs -> {
				cs.setInt(1, idServiciosReservaciones);
				cs.setInt(2, cantidad);
				cs.setString(3, estado);
				cs.setInt(4, idReservacion);
				cs.setInt(5, idServicio);
				cs.execute();
				return null;
			});
			} catch (Exception e) {
				// Manejo de la excepción, puedes registrar el error o lanzarlo
				throw new RuntimeException("Error al insertar servicios de reservación", e);
			}
	}

	

}
