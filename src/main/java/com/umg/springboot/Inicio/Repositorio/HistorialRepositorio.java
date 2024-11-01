package com.umg.springboot.Inicio.Repositorio;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class HistorialRepositorio {

	@Autowired
    private JdbcTemplate jdbcTemplate;
	
	
    public int totalReservasPorCliente(int idCliente) {
        String sql = "SELECT TotalReservasPorCliente(?)";
        return jdbcTemplate.query(sql, new PreparedStatementSetter() {
            @Override
            public void setValues(PreparedStatement ps) throws SQLException {
                ps.setInt(1, idCliente);
            }
        }, new RowMapper<Integer>() {
            @Override
            public Integer mapRow(ResultSet rs, int rowNum) throws SQLException {
                return rs.getInt(1);
            }
        }).get(0); // Obtiene el primer (y único) resultado
    }
    

    public double totalComprasPorProveedor(int idProveedor) {
        String sql = "SELECT TotalComprasPorProveedor(?)";
        return jdbcTemplate.query(sql, new PreparedStatementSetter() {
            @Override
            public void setValues(PreparedStatement ps) throws SQLException {
                ps.setInt(1, idProveedor);
            }
        }, new RowMapper<Double>() {
            @Override
            public Double mapRow(ResultSet rs, int rowNum) throws SQLException {
                return rs.getDouble(1);
            }
        }).get(0);
    }


    public String verificarDisponibilidadHabitaciones(int idHotel) {
        String sql = "SELECT VerificarDisponibilidadHabitaciones(?)";
        return jdbcTemplate.query(sql, new PreparedStatementSetter() {
            @Override
            public void setValues(PreparedStatement ps) throws SQLException {
                ps.setInt(1, idHotel);
            }
        }, new RowMapper<String>() {
            @Override
            public String mapRow(ResultSet rs, int rowNum) throws SQLException {
                return rs.getString(1);
            }
        }).get(0);
    }

  
    public double calcularVentasPeriodo(Date fechaInicio, Date fechaFin) {
        String sql = "SELECT CalcularVentasPeriodo(?, ?)";
        return jdbcTemplate.query(sql, new PreparedStatementSetter() {
            @Override
            public void setValues(PreparedStatement ps) throws SQLException {
                ps.setDate(1, new java.sql.Date(fechaInicio.getTime()));
                ps.setDate(2, new java.sql.Date(fechaFin.getTime()));
            }
        }, new RowMapper<Double>() {
            @Override
            public Double mapRow(ResultSet rs, int rowNum) throws SQLException {
                return rs.getDouble(1);
            }
        }).get(0);
    }


    public double totalServiciosCliente(int idCliente) {
        String sql = "SELECT TotalServiciosCliente(?)";
        return jdbcTemplate.query(sql, new PreparedStatementSetter() {
            @Override
            public void setValues(PreparedStatement ps) throws SQLException {
                ps.setInt(1, idCliente);
            }
        }, new RowMapper<Double>() {
            @Override
            public Double mapRow(ResultSet rs, int rowNum) throws SQLException {
                return rs.getDouble(1);
            }
        }).get(0);
    }


    public String estadoReservacion(int idReservacion) {
        String sql = "SELECT EstadoReservacion(?)";
        return jdbcTemplate.query(sql, new PreparedStatementSetter() {
            @Override
            public void setValues(PreparedStatement ps) throws SQLException {
                ps.setInt(1, idReservacion);
            }
        }, new RowMapper<String>() {
            @Override
            public String mapRow(ResultSet rs, int rowNum) throws SQLException {
                return rs.getString(1);
            }
        }).get(0);
    }

  
    public int contarClientesHotel(int idHotel) {
        String sql = "SELECT ContarClientesHotel(?)";
        return jdbcTemplate.query(sql, new PreparedStatementSetter() {
            @Override
            public void setValues(PreparedStatement ps) throws SQLException {
                ps.setInt(1, idHotel);
            }
        }, new RowMapper<Integer>() {
            @Override
            public Integer mapRow(ResultSet rs, int rowNum) throws SQLException {
                return rs.getInt(1);
            }
        }).get(0);
    }

    
    public int contarComentariosCliente(int idCliente) {
        String sql = "SELECT ContarComentariosCliente(?)";
        return jdbcTemplate.query(sql, new PreparedStatementSetter() {
            @Override
            public void setValues(PreparedStatement ps) throws SQLException {
                ps.setInt(1, idCliente);
            }
        }, new RowMapper<Integer>() {
            @Override
            public Integer mapRow(ResultSet rs, int rowNum) throws SQLException {
                return rs.getInt(1);
            }
        }).get(0);
    }
}
