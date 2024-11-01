package com.umg.springboot.Inicio.Services;

import com.umg.springboot.Inicio.Repositorio.MenuRepositorio;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class MenuServices {

    @Autowired
    private MenuRepositorio menuRepository;

    // Método para obtener reservaciones
    public List<Object[]> obtenerReservaciones(Integer idReservacion) {
        return menuRepository.obtenerReservaciones(idReservacion);
    }
    
    @Transactional
    public void insertarComentario(int idComentario, String asunto, String descripcion, String estado, int idReservacion, int idCliente) {
    	menuRepository.insertarComentario(idComentario, asunto, descripcion, 
                 estado, idReservacion,  idCliente);
    }
    
    // Método para obtener eventos
    public List<Object[]> obtenerEventos(Integer idEvento) {
        return menuRepository.obtenerEventos(idEvento);
    }
 // Método para obtener eventos
    public List<Object[]> obtenerPromociones(Integer idPromocion) {
        return menuRepository.obtenerPromociones(idPromocion);
    }
    
    public List<Object[]> obtenerHistorialReservaciones(Integer id) {
        return menuRepository.ObtenerHistorialReservaciones(id);
    }
    
    @Transactional
    public void insertarHotel(int IdHotel, String Nombre, String Direccion, String Ranking, String estado){
    	menuRepository.insertarHotel( IdHotel,  Nombre,  Direccion,  Ranking,  estado);
    }
    
    @Transactional
    public void insertarComentarioPersonal(int IdComentario, String Comentario, String FechaComentario, String Estado, int IdPersonal, int IdCliente){
    	menuRepository.insertarComentarioPersonal(IdComentario, Comentario, FechaComentario, Estado, IdPersonal, IdCliente);
    }
    
    @Transactional
    public void ActualizarComentarioPersonal(int IdComentario, String Comentario, String FechaComentario, String Estado, int IdPersonal, int IdCliente){
    	menuRepository.actualizarComentarioPersonal(IdComentario, Comentario, FechaComentario, IdPersonal, IdCliente);
    }
    
    @Transactional
    public void actualizarHotel(int IdHotel, String Nombre, String Direccion, String Ranking){
    	menuRepository.actualizarHotel( IdHotel,  Nombre,  Direccion,  Ranking);
    }
    
    @Transactional
    public void eliminarHotel(int idHotel) {
    	  menuRepository.eliminarHotel(idHotel);
    }
    
    @Transactional
    public void actualizarReservacion(int IdReservacion, String EstadoReservacion, String FechaReservacion, int IdHotel, int IdCliente, int IdHabitacion) {
    	menuRepository.actualizarReservacion(IdReservacion, EstadoReservacion, FechaReservacion, IdHotel, IdCliente, IdHabitacion);
    }
    
    @Transactional
    public void insertarPersonal(int IdPersonal, String Nombre, String Puesto, String Email, 
            String Telefono, String Estado, int IdHotel, int IdUsuario) {
    	menuRepository.insertarPersonal(IdPersonal, Nombre,Puesto, Email, Telefono, Estado, IdHotel, IdUsuario);
    }
}
