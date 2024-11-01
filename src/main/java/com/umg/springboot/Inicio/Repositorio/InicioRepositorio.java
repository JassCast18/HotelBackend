package com.umg.springboot.Inicio.Repositorio;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.dialect.OracleTypes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.CallableStatementCallback;
import org.springframework.stereotype.Repository;

@Repository
public class InicioRepositorio {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<Object[]> obtenerHoteles() {
        String sql = "{CALL ObtenerHoteles(NULL, ?)}"; 

        return jdbcTemplate.execute(sql, (CallableStatementCallback<List<Object[]>>) cs -> {
            cs.registerOutParameter(1, OracleTypes.CURSOR); 
            cs.execute();

            try (ResultSet rs = (ResultSet) cs.getObject(1)) {
                List<Object[]> hoteles = new ArrayList<>();
                while (rs.next()) {
                    hoteles.add(new Object[]{
                        rs.getInt("IdHotel"),
                        rs.getString("Nombre"),
                        rs.getString("Direccion"),
                        rs.getString("Ranking")
                    });
                }
                return hoteles;
            }
        });
    }

    public List<Object[]> obtenerCheckIn(Integer idCheckIn) {
        String sql = "{CALL ObtenerCheckIn(?, ?)}";

        return jdbcTemplate.execute(sql, (CallableStatementCallback<List<Object[]>>) cs -> {
            cs.setObject(1, idCheckIn);  // Parámetro opcional
            cs.registerOutParameter(2, OracleTypes.CURSOR); 
            cs.execute();

            try (ResultSet rs = (ResultSet) cs.getObject(2)) {
                List<Object[]> checkIns = new ArrayList<>();
                while (rs.next()) {
                    checkIns.add(new Object[]{
                        rs.getInt("IdCheckIn"),
                        rs.getDate("Fecha"),
                        rs.getString("Cliente")
                    });
                }
                return checkIns;
            }
        });
    }

    public List<Object[]> obtenerCheckOut(Integer idCheckOut) {
        String sql = "{CALL ObtenerCheckOuts(?, ?)}";

        return jdbcTemplate.execute(sql, (CallableStatementCallback<List<Object[]>>) cs -> {
            cs.setObject(1, idCheckOut);  // Parámetro opcional
            cs.registerOutParameter(2, OracleTypes.CURSOR); 
            cs.execute();

            try (ResultSet rs = (ResultSet) cs.getObject(2)) {
                List<Object[]> checkOuts = new ArrayList<>();
                while (rs.next()) {
                    checkOuts.add(new Object[]{
                        rs.getInt("IdCheckOut"),
                        rs.getDate("Fecha"),
                        rs.getString("Cliente")
                    });
                }
                return checkOuts;
            }
        });
    }
}
