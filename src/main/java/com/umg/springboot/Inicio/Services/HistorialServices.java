package com.umg.springboot.Inicio.Services;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.umg.springboot.Inicio.Repositorio.HistorialRepositorio;

@Service
public class HistorialServices {

	@Autowired
    private HistorialRepositorio historialRepositorio;
	
    public int totalReservasPorCliente(int idCliente) {
        return historialRepositorio.totalReservasPorCliente(idCliente);
    }

    public double totalComprasPorProveedor(int idProveedor) {
        return historialRepositorio.totalComprasPorProveedor(idProveedor);
    }

    public String verificarDisponibilidadHabitaciones(int idHotel) {
        return historialRepositorio.verificarDisponibilidadHabitaciones(idHotel);
    }

    public double calcularVentasPeriodo(Date fechaInicio, Date fechaFin) {
        return historialRepositorio.calcularVentasPeriodo(fechaInicio, fechaFin);
    }

    public double totalServiciosCliente(int idCliente) {
        return historialRepositorio.totalServiciosCliente(idCliente);
    }

    public String estadoReservacion(int idReservacion) {
        return historialRepositorio.estadoReservacion(idReservacion);
    }

    public int contarClientesHotel(int idHotel) {
        return historialRepositorio.contarClientesHotel(idHotel);
    }

    public int contarComentariosCliente(int idCliente) {
        return historialRepositorio.contarComentariosCliente(idCliente);
    }
}
