package com.umg.springboot.Inicio.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.umg.springboot.Inicio.Services.PagoServices;

@RestController
@RequestMapping("/api/pago")
public class PagoControlador {

	 @Autowired
	 private PagoServices pagoServicios;
	 
	 @PostMapping("/usuario")
	    public void insertarUsuario(
	            @RequestParam int idPago, 
	            @RequestParam String metodoPago,  
	            @RequestParam String estado, 
	            @RequestParam int idReservacion) {
		 	pagoServicios.insertarPago(idPago, metodoPago, estado, idReservacion);
	    }
	 
	 @PostMapping("/factura")
	    public void insertarFactura(
	            @RequestParam int idFactura, 
	            @RequestParam String fechaEmision,  
	            @RequestParam double montoTotal,
	            @RequestParam String estado,
	            @RequestParam int idPago) {
		 	pagoServicios.insertarFactura(idFactura, fechaEmision, montoTotal, estado, idPago);
	    }
	 
	 @GetMapping("/factura")
	    public List<Object[]> obtenerFacturas(@RequestParam(required = false) Integer idFactura) {
	        return pagoServicios.obtenerFacturas(idFactura);
	    }

}
