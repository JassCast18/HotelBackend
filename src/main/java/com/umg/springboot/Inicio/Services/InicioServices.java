package com.umg.springboot.Inicio.Services;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.umg.springboot.Inicio.Repositorio.InicioRepositorio;

@Service
public class InicioServices {
    @Autowired
    private InicioRepositorio inicioRepositorio;

    public List<Object[]> obtenerHoteles() {
        return inicioRepositorio.obtenerHoteles();
    }

    public List<Object[]> obtenerCheckIn(Integer idCheckIn) {
        return inicioRepositorio.obtenerCheckIn(idCheckIn);
    }

    public List<Object[]> obtenerCheckOut(Integer idCheckOut) {
        return inicioRepositorio.obtenerCheckOut(idCheckOut);
    }
}
