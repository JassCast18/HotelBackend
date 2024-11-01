package com.umg.springboot.Inicio.Services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.umg.springboot.Inicio.Repositorio.PagoRepositorio;

@Service
public class PagoServices {

	 @Autowired
	 private PagoRepositorio pagoRepository;
	 
	 @Transactional
	 public void insertarPago(int idPago, String metodoPago, String estado, int idReservacion) {
		 pagoRepository.insertarPago(idPago, metodoPago, estado, idReservacion);
	 }
	 
	 @Transactional
	 public void insertarFactura(int idFactura, String fechaEmision, double montoTotal, String estado, int idPago) {
		 pagoRepository.insertarFactura(idFactura, fechaEmision, montoTotal, estado, idPago);
	 }
	 
	 public List<Object[]> obtenerFacturas(Integer idFactura) {
	        return pagoRepository.obtenerFacturas(idFactura);
	 }
	 
	 
}
