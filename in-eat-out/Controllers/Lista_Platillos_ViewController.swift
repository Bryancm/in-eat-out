//
//  Lista_Platillos_ViewController.swift
//  in-eat-out
//
//  Created by brauliop on 2/11/18.
//  Copyright © 2018 BryanMtz. All rights reserved.
//

import UIKit




class Lista_Platillos_ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
 
    
    @IBOutlet weak var table_Platillos: UITableView!
    
    var PlatillosArray = [Platillos]()
    var CategoriaPlatillos: Categoria_Platillos?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table_Platillos.dataSource = self
        table_Platillos.delegate = self
        
        if CategoriaPlatillos?.id == 1 {
            self.title = "Entradas"
            let newPlatillo = Platillos(id: 10, nombre: "Ceviche de pulpo", imagen: "http://www.gourmet.cl/wp-content/uploads/2017/11/cevpul2.jpg-editada.jpg", precio: 90.00, descripcion: "sdsf", idCategoria: 1)
            let newPlatillo2 = Platillos(id: 11, nombre: "Huevos rellenos", imagen: "http://www.gourmet.cl/wp-content/uploads/2018/01/foto-editada-huevos-rellenos.jpg", precio: 90.00, descripcion: "sdfdsf", idCategoria: 1)
            let newPlatillo3 = Platillos(id: 12, nombre: "Dip de tomate", imagen: "http://www.gourmet.cl/wp-content/uploads/2016/12/DIP-TOMATES-570x458.jpg", precio: 100.00, descripcion: "dfdsf", idCategoria: 1)
            
            PlatillosArray.append(newPlatillo)
            PlatillosArray.append(newPlatillo2)
            PlatillosArray.append(newPlatillo3)
            PlatillosArray.append(newPlatillo)
            PlatillosArray.append(newPlatillo2)
            PlatillosArray.append(newPlatillo3)
            PlatillosArray.append(newPlatillo)
            PlatillosArray.append(newPlatillo2)
            PlatillosArray.append(newPlatillo3)
        }
        
        if CategoriaPlatillos?.id == 2 {
            self.title = "Principales"
            let newPlatillo = Platillos(id: 6, nombre: "Hamburguesa Con Papas", imagen: "http://www.curiosfera.com/wp-content/uploads/2017/06/Historia-de-la-hamburgesa.jpg", precio: 80.00, descripcion: "Hamburguesa con queso,mayonesa,lechuga, carne de res, y papas fritas", idCategoria: 1)
            let newPlatillo2 = Platillos(id: 1, nombre: "Club Sandwich", imagen: "http://scottysonthestrand.com/images/club%20sand.jpg", precio: 100.00, descripcion: "sdfdsf", idCategoria: 1)
            let newPlatillo3 = Platillos(id: 5, nombre: "Orden Navideña de pavo", imagen: "http://placeralplato.com/files/2015/12/Pavo-navideo-relleno-de-frutas-receta-paso-a-paso.jpg", precio: 300.00, descripcion: "dfdsf", idCategoria: 1)
        
            PlatillosArray.append(newPlatillo)
            PlatillosArray.append(newPlatillo2)
            PlatillosArray.append(newPlatillo3)
            PlatillosArray.append(newPlatillo)
            PlatillosArray.append(newPlatillo2)
            PlatillosArray.append(newPlatillo3)
            PlatillosArray.append(newPlatillo)
            PlatillosArray.append(newPlatillo2)
            PlatillosArray.append(newPlatillo3)
        }
        
        if CategoriaPlatillos?.id == 3 {
            self.title = "Postres"
            let newPlatillo = Platillos(id: 13, nombre: "Helado C&C", imagen: "http://www.gourmet.cl/wp-content/uploads/2015/01/Postre-Helado-de-Cookies-and-Cream.jpg", precio: 75.00, descripcion: "sdsf", idCategoria: 1)
            let newPlatillo2 = Platillos(id: 14, nombre: "Brownie Chocolate", imagen: "http://www.gourmet.cl/wp-content/uploads/2015/06/Postre-tibio-de-chocolate.jpg", precio: 60.00, descripcion: "sdfdsf", idCategoria: 1)
            let newPlatillo3 = Platillos(id: 15, nombre: "Mini gelatina de café", imagen: "http://www.gourmet.cl/wp-content/uploads/2015/10/vasitos-de-manjar-halloween.jpg", precio: 50.00, descripcion: "dfdsf", idCategoria: 1)
            
            PlatillosArray.append(newPlatillo)
            PlatillosArray.append(newPlatillo2)
            PlatillosArray.append(newPlatillo3)
            PlatillosArray.append(newPlatillo)
            PlatillosArray.append(newPlatillo2)
            PlatillosArray.append(newPlatillo3)
            PlatillosArray.append(newPlatillo)
            PlatillosArray.append(newPlatillo2)
            PlatillosArray.append(newPlatillo3)
        }
        
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PlatillosArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_Platillo", for: indexPath) as! Platillo_TableViewCell
        cell.configureCell(Platillo: PlatillosArray[indexPath.row])
        
        return cell
    }
    
    @IBAction func AddOrder(_ sender: Any) {
       
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newOrder = orden(id: 0, cantidad: 1, idPlatillo: PlatillosArray[indexPath.row].id, nombre_platillo: PlatillosArray[indexPath.row].nombre, precio: PlatillosArray[indexPath.row].precio, total: 0)
        if let index = orderArray.index(where: {$0.idPlatillo == newOrder.idPlatillo}){
            orderArray[index].cantidad = orderArray[index].cantidad + 1
        }else{
            orderArray.append(newOrder)
        }
        table_Platillos.reloadData()
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let destination = segue.destination as? Animal_Detail_ViewController {
//            if let selectedAnimal = sender as? Animal{
//                destination.Animal = selectedAnimal
//                destination.AnimalVideo = AnimalCategory!.video
//            }
//        }
//    }

}

