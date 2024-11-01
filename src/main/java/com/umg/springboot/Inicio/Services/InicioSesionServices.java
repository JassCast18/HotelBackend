package com.umg.springboot.Inicio.Services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.umg.springboot.Inicio.Repositorio.InicioSesionRepositorio;

@Service
public class InicioSesionServices {

    @Autowired
    private InicioSesionRepositorio inicioSesionRepositorio;

    // Llamar al procedimiento para obtener datos del usuario
    public List<Object[]> obtenerDatosUsuario(String email, String contrasena) {
        return inicioSesionRepositorio.obtenerDatosUsuario(email, contrasena);
    }

    // Llamar al procedimiento para insertar un nuevo usuario
    public void insertarUsuario(int idUsuario, int codigoUsuario, String nombreUsuario, String email, String contrasena, String estado) {
        inicioSesionRepositorio.insertarUsuario(idUsuario, codigoUsuario, nombreUsuario, email, contrasena, estado);
    }

    // Llamar al procedimiento para insertar un nuevo cliente
    public void insertarCliente(int idCliente, String nombreCliente, String email, String telefono, String estado, int idUsuario) {
        inicioSesionRepositorio.insertarCliente(idCliente, nombreCliente, email, telefono, estado, idUsuario);
    }
}
