package com.umg.springboot.Inicio.controllers;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.umg.springboot.Inicio.Services.HistorialServices;

@RestController
@RequestMapping("/api/historial")
public class HistorialControlador {
	
	  @Autowired
	    private HistorialServices historialServicios;


	    @GetMapping("/total-reservas/{idCliente}")
	    public int totalReservasPorCliente(@PathVariable int idCliente) {
	        return historialServicios.totalReservasPorCliente(idCliente);
	    }

	    @GetMapping("/total-compras/{idProveedor}")
	    public double totalComprasPorProveedor(@PathVariable int idProveedor) {
	        return historialServicios.totalComprasPorProveedor(idProveedor);
	    }

	    @GetMapping("/disponibilidad/{idHotel}")
	    public String verificarDisponibilidad(@PathVariable int idHotel) {
	        return historialServicios.verificarDisponibilidadHabitaciones(idHotel);
	    }

	    @GetMapping("/ventas-periodo")
	    public double calcularVentasPeriodo(@RequestParam Date fechaInicio, @RequestParam Date fechaFin) {
	        return historialServicios.calcularVentasPeriodo(fechaInicio, fechaFin);
	    }

	    @GetMapping("/total-servicios/{idCliente}")
	    public double totalServiciosCliente(@PathVariable int idCliente) {
	        return historialServicios.totalServiciosCliente(idCliente);
	    }

	    @GetMapping("/estado-reservacion/{idReservacion}")
	    public String estadoReservacion(@PathVariable int idReservacion) {
	        return historialServicios.estadoReservacion(idReservacion);
	    }

	    @GetMapping("/contar-clientes/{idHotel}")
	    public int contarClientesHotel(@PathVariable int idHotel) {
	        return historialServicios.contarClientesHotel(idHotel);
	    }

	    @GetMapping("/contar-comentarios/{idCliente}")
	    public int contarComentariosCliente(@PathVariable int idCliente) {
	        return historialServicios.contarComentariosCliente(idCliente);
	    }

}
