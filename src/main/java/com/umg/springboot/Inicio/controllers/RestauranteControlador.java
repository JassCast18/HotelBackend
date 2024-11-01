package com.umg.springboot.Inicio.controllers;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.umg.springboot.Inicio.Services.RestauranteService;

@RestController
@RequestMapping("/api/Restaurante")
public class RestauranteControlador {

	 
		@Autowired
		private RestauranteService restauranteServicios;
		
		 @GetMapping("/menuRestaurante") 
		    public List<Map<String, Object>> obtenerRestaurantesYMenu() {
		        return restauranteServicios.obtenerRestaurantesYMenu(); // Llama al método del servicio
		    }
		 
		 @PostMapping("/reservacion")
		    public void insertarReservacion(
		            @RequestParam int idServiciosReservaciones, 
		            @RequestParam int cantidad, 
		            @RequestParam String estado, 
		            @RequestParam int idReservacion, 
		            @RequestParam int idServicio) {
			 restauranteServicios.insertarServiciosReservaciones( idServiciosReservaciones, cantidad, estado, idReservacion, idServicio);
		    }
		
}
