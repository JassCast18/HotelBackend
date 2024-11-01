package com.umg.springboot.Inicio.Repositorio;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.CallableStatementCallback;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class PagoRepositorio {

	@Autowired
    private JdbcTemplate jdbcTemplate;
	
	public void insertarPago(int idPago, String metodoPago, String estado, int idReservacion) {
        String sql = "{call InsertarPago(?, ?, ?, ?)}";

        try {
            jdbcTemplate.execute(sql, (CallableStatementCallback<Void>) cs -> {
                cs.setInt(1, idPago);
                cs.setString(2, metodoPago);
                cs.setString(3, estado);
                cs.setInt(4, idReservacion);
                cs.execute();
                return null;
            });
        } catch (Exception e) {
            throw new RuntimeException("Error al insertar pago", e);
        }
    }
	
	public void insertarFactura(int idFactura, String fechaEmision, double montoTotal, String estado, int idPago) {
        String sql = "{call InsertarFactura(?, ?, ?, ?, ?)}";

        try {
            jdbcTemplate.execute(sql, (CallableStatementCallback<Void>) cs -> {
                cs.setInt(1, idFactura);
                cs.setDate(2, java.sql.Date.valueOf(fechaEmision));
                cs.setDouble(3, montoTotal);
                cs.setString(4, estado);
                cs.setInt(5, idPago);
                cs.execute();
                return null;
            });
        } catch (Exception e) {
            throw new RuntimeException("Error al insertar factura", e);
        }
    }
	
    // Método para obtener facturas
    public List<Object[]> obtenerFacturas(Integer idFactura) {
        return jdbcTemplate.execute("{call ObtenerFacturas(?, ?)}", (CallableStatement stmt) -> {
            stmt.setObject(1, idFactura);
            stmt.registerOutParameter(2, oracle.jdbc.OracleTypes.CURSOR);

            stmt.execute();
            ResultSet rs = (ResultSet) stmt.getObject(2);

            List<Object[]> facturasList = new ArrayList<>();
            while (rs.next()) {
                Object[] row = new Object[5]; // Ajusta según el número de columnas que quieres devolver
                row[0] = rs.getInt("IdFactura");
                row[1] = rs.getDate("FechaEmision");
                row[2] = rs.getDouble("MontoTotal");
                row[3] = rs.getString("Estado");
                row[4] = rs.getInt("IdPago");
                facturasList.add(row);
            }
            return facturasList;
        });
    }
}
