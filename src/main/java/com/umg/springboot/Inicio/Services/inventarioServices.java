package com.umg.springboot.Inicio.Services;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.umg.springboot.Inicio.Repositorio.InventarioRepositorio;

@Service
public class inventarioServices {

	@Autowired
    private InventarioRepositorio inventarioRepository;
	
	
	public List<Map<String, Object>> obtenerProductosProveedoresCompras() {
        return inventarioRepository.obtenerProductosProveedoresCompras();
    }
	
	 @Transactional
	    public void insertarCompra(int idCompra, String descripcionCompras, double total, String estado, int idHotel) {
		 inventarioRepository.insertarCompra( idCompra, descripcionCompras, total, estado, idHotel);
	    }
	
	
	 public List<Object[]> obtenerInventario(Integer idInventario) {
	     return inventarioRepository.obtenerInventario( idInventario);
	 }
	 
	 @Transactional
	    public void eliminarCompra(int idCompra) {
		 	inventarioRepository.eliminarCompra(idCompra);
	    }
}
