//
//  Orden.swift
//  in-eat-out
//
//  Created by brauliop on 2/11/18.
//  Copyright © 2018 BryanMtz. All rights reserved.
//

import Foundation
class orden{
    
    private var _id: Int!
    private var _idPlatillo:Int!
    private var _nombre_platillo: String!
    private var _cantidad: Int!
    private var _precio: Double!
    private var _total: Double!
    
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

    var nombre_platillo:String {
        get {
            if _nombre_platillo == nil {
                return ""
            }
            return _nombre_platillo
        }
        set {
            _nombre_platillo = newValue
        }
    }
    
    var cantidad:Int {
        get {
            if _cantidad == nil {
                return 0
            }
            return _cantidad
        }
        set {
            _cantidad = newValue
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
    
    var total:Double {
        get {
            if _total == nil{
                return 0.0
            }
            return _total
        }
        set{
            _total = newValue
        }
    }
    
    var idPlatillo:Int {
        get {
            if _idPlatillo == nil {
                return 0
            }
            return _idPlatillo
        }
        set {
            _idPlatillo = newValue
        }
    }
    
    init(id:Int, cantidad:Int,idPlatillo:Int, nombre_platillo: String, precio:Double,total:Double) {
        self._id = id
        self._cantidad = cantidad
        self._idPlatillo = idPlatillo
        self._nombre_platillo = nombre_platillo
        self._precio = precio
        self._total = total
    }
}
