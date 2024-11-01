package com.umg.springboot.Inicio.Services;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.umg.springboot.Inicio.Repositorio.RestaruanteRepositorio;

@Service
public class RestauranteService {

	@Autowired
    private RestaruanteRepositorio restauranteRepository;
	 
	 public List<Map<String, Object>> obtenerRestaurantesYMenu() {
	        return restauranteRepository.obtenerRestaurantesYMenu();
	    }
	 
	 @Transactional
	    public void insertarServiciosReservaciones(int idServiciosReservaciones, int cantidad, String estado, int idReservacion, int idServicio){
		 restauranteRepository.insertarServiciosReservaciones( idServiciosReservaciones, cantidad, estado, idReservacion, idServicio);
	    }
}
