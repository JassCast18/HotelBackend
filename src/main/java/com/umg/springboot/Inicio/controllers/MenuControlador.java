package com.umg.springboot.Inicio.controllers;

import com.umg.springboot.Inicio.Services.MenuServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/menu")
public class MenuControlador {

    @Autowired
    private MenuServices menuServicios;

    // Endpoint para obtener reservaciones
    @GetMapping("/reservaciones")
    public List<Object[]> obtenerReservaciones(@RequestParam(required = false) Integer idReservacion) {
        return menuServicios.obtenerReservaciones(idReservacion);
    }
    
    // Endpoint para insertar un nuevo usuario
    @PostMapping("/comentario")
    public void insertarUsuario(
            @RequestParam int idComentario, 
            @RequestParam String asunto, 
            @RequestParam String descripcion, 
            @RequestParam String estado, 
            @RequestParam int idReservacion, 
            @RequestParam int idCliente) {
    	menuServicios.insertarComentario(idComentario, asunto, descripcion, estado, idReservacion, idCliente);
    }
    
 // Endpoint para obtener reservaciones
    @GetMapping("/eventos")
    public List<Object[]> obtenerEventos(@RequestParam(required = false) Integer idEventos) {
        return menuServicios.obtenerReservaciones(idEventos);
    }
    
    @GetMapping("/promociones")
    public List<Object[]> obtenerPromociones(@RequestParam(required = false) Integer idPromocion) {
        return menuServicios.obtenerReservaciones(idPromocion);
    }
    
    @GetMapping("/historial")
    public List<Object[]> obtenerHistorialReservaciones(@RequestParam(required = false) Integer id) {
        return menuServicios.obtenerHistorialReservaciones(id);
    }
    
  
    @PostMapping("/hotel")
    public void insertarHotel(
            @RequestParam int IdHotel, 
            @RequestParam String Nombre, 
            @RequestParam String Direccion, 
            @RequestParam String Ranking, 
            @RequestParam String estado) {
    	menuServicios.insertarHotel( IdHotel,  Nombre,  Direccion,  Ranking,  estado);
    }
    
    @PostMapping("/comentarioPersonal")
    public void insertarComentarioPersonal(
            @RequestParam int IdComentario, 
            @RequestParam String Comentario, 
            @RequestParam String FechaComentario, 
            @RequestParam String Estado, 
            @RequestParam int IdPersonal,
            @RequestParam int IdCliente) {
    	menuServicios.insertarComentarioPersonal(IdComentario, Comentario, FechaComentario, Estado, IdPersonal, IdCliente);
    }
    
    @PutMapping("/comentarioPersonal/{idComentario}")
    public void actualizarComentarioPersonal(
            @PathVariable int idComentario, 
            @RequestParam String Comentario, 
            @RequestParam String FechaComentario, 
            @RequestParam String Estado,
            @RequestParam int IdPersonal,
            @RequestParam int IdCliente) {
        menuServicios.ActualizarComentarioPersonal(idComentario, Comentario, FechaComentario, Estado, IdPersonal, IdCliente);
    }
    
    @PutMapping("/hotel/{idHotel}")
    public void actualizarHotel(
            @RequestParam int IdHotel, 
            @RequestParam String Nombre, 
            @RequestParam String Direccion, 
            @RequestParam String Ranking) {
    	menuServicios.actualizarHotel( IdHotel,  Nombre,  Direccion,  Ranking);
    }
    
    @DeleteMapping("/hotel/{idHotel}")
    public void eliminarHotel(@PathVariable int idHotel) {
        menuServicios.eliminarHotel(idHotel);
    }

    @PutMapping("/Reservacion/{idReservacion}")
    public void actualizarHotel(
            @RequestParam int IdReservacion, 
            @RequestParam String EstadoReservacion, 
            @RequestParam String FechaReservacion, 
            @RequestParam int IdHotel,
            @RequestParam int IdCliente,
            @RequestParam int IdHabitacion) {
    	menuServicios.actualizarReservacion(IdReservacion, EstadoReservacion, FechaReservacion, IdHotel, IdCliente, IdHabitacion);
    }
    
    @PostMapping("/personal")
    public void insertarPersonal(
            @RequestParam int IdPersonal, 
            @RequestParam String Nombre, 
            @RequestParam String Puesto, 
            @RequestParam String Email, 
            @RequestParam String Telefono,
            @RequestParam String Estado,
            @RequestParam int IdHotel,
            @RequestParam int IdUsuario) {
    	menuServicios.insertarPersonal(IdPersonal, Nombre,Puesto, Email, Telefono, Estado, IdHotel, IdUsuario);
    }
    

}
