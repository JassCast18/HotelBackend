package com.umg.springboot.Inicio.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.umg.springboot.Inicio.Services.InicioSesionServices;

@RestController
@RequestMapping("/api/inicio-sesion")
public class InicioSesionControlador {

    @Autowired
    private InicioSesionServices inicioSesionServices;

    // Endpoint para obtener datos del usuario por email y contraseña
    @GetMapping("/usuario")
    public List<Object[]> obtenerDatosUsuario(@RequestParam String email, @RequestParam String contraseña) {
        return inicioSesionServices.obtenerDatosUsuario(email, contraseña);
    }

    // Endpoint para insertar un nuevo usuario
    @PostMapping("/usuario")
    public void insertarUsuario(
            @RequestParam int idUsuario, 
            @RequestParam int codigoUsuario, 
            @RequestParam String nombreUsuario, 
            @RequestParam String email, 
            @RequestParam String contraseña, 
            @RequestParam String estado) {
        inicioSesionServices.insertarUsuario(idUsuario, codigoUsuario, nombreUsuario, email, contraseña, estado);
    }

    // Endpoint para insertar un nuevo cliente
    @PostMapping("/cliente")
    public void insertarCliente(
            @RequestParam int idCliente, 
            @RequestParam String nombreCliente, 
            @RequestParam String email, 
            @RequestParam String telefono, 
            @RequestParam String estado, 
            @RequestParam int idUsuario) {
        inicioSesionServices.insertarCliente(idCliente, nombreCliente, email, telefono, estado, idUsuario);
    }
}
