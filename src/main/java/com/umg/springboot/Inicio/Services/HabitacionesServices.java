package com.umg.springboot.Inicio.Services;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.umg.springboot.Inicio.Repositorio.HabitacionesRepositorio;

@Service
public class HabitacionesServices {

	 @Autowired
	    private HabitacionesRepositorio habitacionRepository;
	 
	 public List<Map<String, Object>> obtenerServiciosHotel() {
	        return habitacionRepository.obtenerServiciosHotel();
	    }
	    
	 @Transactional
	    public void insertarReservacion(int idReservacion, String estadoReservacion, String fechaReservacion, 
	              String estado, int idHotel, int idCliente, int idHabitacion){
		 habitacionRepository.insertarReservacion( idReservacion, estadoReservacion, fechaReservacion, estado, idHotel, idCliente, idHabitacion);
	    }
}
