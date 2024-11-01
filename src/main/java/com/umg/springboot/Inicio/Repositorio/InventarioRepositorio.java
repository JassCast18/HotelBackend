package com.umg.springboot.Inicio.Repositorio;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.CallableStatementCallback;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class InventarioRepositorio {

	@Autowired
    private JdbcTemplate jdbcTemplate;
	
	public List<Map<String, Object>> obtenerProductosProveedoresCompras() {
        String sql = "SELECT * FROM VistaProductosProveedoresCompras";

        return jdbcTemplate.query(sql, (rs, rowNum) -> {
            Map<String, Object> row = new HashMap<>();
            row.put("IdProducto", rs.getInt("IdProducto"));
            row.put("NombreProducto", rs.getString("NombreProducto"));
            row.put("PrecioProducto", rs.getDouble("PrecioProducto"));
            row.put("ProductoEstado", rs.getString("ProductoEstado"));
            row.put("IdProveedor", rs.getInt("IdProveedor"));
            row.put("NombreProveedor", rs.getString("NombreProveedor"));
            row.put("ContactoProveedor", rs.getString("ContactoProveedor"));
            row.put("TelefonoProveedor", rs.getString("TelefonoProveedor"));
            row.put("ProveedorEstado", rs.getString("ProveedorEstado"));
            row.put("IdCompra", rs.getInt("IdCompra"));
            row.put("CompraDescripcion", rs.getString("CompraDescripcion"));
            row.put("CompraTotal", rs.getDouble("CompraTotal"));
            row.put("CompraEstado", rs.getString("CompraEstado"));
            row.put("IdHotel", rs.getInt("IdHotel"));
            row.put("NombreHotel", rs.getString("NombreHotel"));

            return row;
        });
    }
	
	// Método para insertar compra
    public void insertarCompra(int idCompra, String descripcionCompras, double total, String estado, int idHotel) {
        String sql = "{call InsertarCompra(?, ?, ?, ?, ?)}";

        try {
            jdbcTemplate.execute(sql, (CallableStatementCallback<Void>) cs -> {
                cs.setInt(1, idCompra);
                cs.setString(2, descripcionCompras);
                cs.setDouble(3, total);
                cs.setString(4, estado);
                cs.setInt(5, idHotel);
                cs.execute();
                return null;
            });
        } catch (Exception e) {
            throw new RuntimeException("Error al insertar compra", e);
        }
    }
    
    // Método para obtener inventario
    public List<Object[]> obtenerInventario(Integer idInventario) {
        return jdbcTemplate.execute("{call ObtenerInventario(?, ?)}", (CallableStatement stmt) -> {
            stmt.setObject(1, idInventario);
            stmt.registerOutParameter(2, oracle.jdbc.OracleTypes.CURSOR);

            stmt.execute();
            ResultSet rs = (ResultSet) stmt.getObject(2);

            List<Object[]> inventarioList = new ArrayList<>();
            while (rs.next()) {
                Object[] row = new Object[4]; // Ajustamos el tamaño a 4 columnas
                row[0] = rs.getInt("IdInventario");
                row[1] = rs.getDate("FechaModificacion");
                row[2] = rs.getString("Estado");
                row[3] = rs.getInt("IdCompra");
                inventarioList.add(row);
            }
            return inventarioList;
        });
    }
    
    // Método para eliminar compra
    public void eliminarCompra(int idCompra) {
        String sql = "{call EliminarCompra(?)}";

        try {
            jdbcTemplate.execute(sql, (CallableStatementCallback<Void>) cs -> {
                cs.setInt(1, idCompra);
                cs.execute();
                return null;
            });
        } catch (Exception e) {
            throw new RuntimeException("Error al eliminar compra", e);
        }
    }
}
