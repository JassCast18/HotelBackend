package com.umg.springboot.Inicio.controllers;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.umg.springboot.Inicio.Services.HabitacionesServices;

@RestController
@RequestMapping("/api/Habitaciones")
public class HabitacionesControlador {
	 
	@Autowired
	    private HabitacionesServices habitacionesServicios;
	
	  @GetMapping("/servicios-hotel") // Endpoint para obtener los servicios de hotel
	    public List<Map<String, Object>> getServiciosHotel() {
	        return habitacionesServicios.obtenerServiciosHotel(); // Llama al método del servicio
	    }
	  
	  @PostMapping("/reservacion")
	    public void insertarReservacion(
	            @RequestParam int idReservacion, 
	            @RequestParam String estadoReservacion, 
	            @RequestParam String fechaReservacion, 
	            @RequestParam String estado, 
	            @RequestParam int idHotel, 
	            @RequestParam int idCliente, 
	            @RequestParam int idHabitacion) {
		  habitacionesServicios.insertarReservacion( idReservacion, estadoReservacion, fechaReservacion, estado, idHotel, idCliente, idHabitacion);
	    }
}
