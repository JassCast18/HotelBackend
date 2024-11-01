package com.umg.springboot.Inicio.controllers;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.umg.springboot.Inicio.Services.inventarioServices;

@RestController
@RequestMapping("/api/inventario")
public class InventarioControlador {
	
	@Autowired
    private inventarioServices inventarioServicios;
	
	 @GetMapping("/ProductosProveedores") 
	    public List<Map<String, Object>> obtenerProductosProveedoresCompras() {
	        return inventarioServicios.obtenerProductosProveedoresCompras(); // Llama al método del servicio
	    }
	 
	 @PostMapping("/compra")
	    public void insertarCompra(
	            @RequestParam int idCompra, 
	            @RequestParam String descripcionCompras, 
	            @RequestParam double total, 
	            @RequestParam String estado, 
	            @RequestParam int idHotel) {
		 inventarioServicios.insertarCompra( idCompra, descripcionCompras, total, estado, idHotel);
	    }
	 
	 @GetMapping("/obtenerInventario")
	    public List<Object[]> obtenerInventario(@RequestParam(required = false) Integer idInventario) {
	        return inventarioServicios.obtenerInventario( idInventario);
	    }
	    
	    @DeleteMapping("/compra/{idCompra}")
	    public void eliminarCompra(@PathVariable int idCompra) {
	    	inventarioServicios.eliminarCompra(idCompra);
	    }
	 
}
