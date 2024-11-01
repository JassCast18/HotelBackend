package com.umg.springboot.Inicio.controllers;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.umg.springboot.Inicio.Services.InicioServices;

@RestController
@RequestMapping("/api")
public class InicioControlador {
    @Autowired
    private InicioServices inicioService;

    @GetMapping("/hoteles")
    public List<Object[]> obtenerHoteles() {
        return inicioService.obtenerHoteles();
    }

    @GetMapping("/checkin")
    public List<Object[]> obtenerCheckIn(@RequestParam(required = false) Integer idCheckIn) {
        return inicioService.obtenerCheckIn(idCheckIn);
    }

    @GetMapping("/checkout")
    public List<Object[]> obtenerCheckOut(@RequestParam(required = false) Integer idCheckOut) {
        return inicioService.obtenerCheckOut(idCheckOut);
    }
}
