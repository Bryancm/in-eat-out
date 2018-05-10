//
//  Platillos.swift
//  in-eat-out
//
//  Created by brauliop on 2/11/18.
//  Copyright © 2018 BryanMtz. All rights reserved.
//

import Foundation
class Platillos {
    
    private var _id: Int!
    private var _nombre: String!
    private var _imagen: String!
    private var _precio: Double!
    private var _descripcion: String!
    private var _idCategoria: Int!
    
    
    //getters and setters
    var id:Int {
        get {
            if _id == nil {
                return 0
            }
            return _id
        }
        set {
            _id = newValue
        }
    }
    
    var nombre:String {
        get {
            if _nombre == nil{
                return ""
            }
            return _nombre
        }
        set {
            _nombre = newValue
        }
        
    }
    
    var imagen:String {
        get {
            if _imagen == nil{
                return ""
            }
            return _imagen
        }
        set {
            _imagen = newValue
        }
    }
    
    var precio:Double {
        get {
            if _precio == nil{
                return 0.0
            }
            return _precio
        }
        set{
            _precio = newValue
        }
    }
    
    var descripcion:String {
        get {
            if _descripcion == nil{
                return ""
            }
            return _descripcion
        }
        set {
            _descripcion = newValue
        }
        
    }
    var idCategoria:Int {
        get {
            if _idCategoria == nil {
                return 0
            }
            return _idCategoria
        }
        set {
            _idCategoria = newValue
        }
    }
    
    init(id: Int, nombre: String,imagen: String, precio:Double, descripcion:String,idCategoria: Int) {
        self._id = id
        self._nombre = nombre
        self._imagen = imagen
        self._precio = precio
        self._descripcion = descripcion
        self._idCategoria = idCategoria
    }
}
