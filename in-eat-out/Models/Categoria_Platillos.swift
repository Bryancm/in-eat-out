//
//  Categorias_Platillos.swift
//  in-eat-out
//
//  Created by brauliop on 2/11/18.
//  Copyright © 2018 BryanMtz. All rights reserved.
//

import Foundation
class Categoria_Platillos{
    
    private var _id: Int!
    private var _nombre: String!
    private var _imagen: String!
    
    
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
    
    init(id: Int, nombre: String,imagen: String) {
        self._id = id
        self._nombre = nombre
        self._imagen = imagen
    }
}
