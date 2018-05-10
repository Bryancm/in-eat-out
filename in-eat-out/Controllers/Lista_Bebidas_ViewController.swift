//
//  Lista_Bebidas_ViewController.swift
//  in-eat-out
//
//  Created by brauliop on 2/12/18.
//  Copyright © 2018 BryanMtz. All rights reserved.
//
import UIKit



class Lista_Bebidas_ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var table_Bebidas: UITableView!
    
    var BebidasArray = [Bebidas]()
    var CategoriaBebidas: Categoria_Bebidas?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        table_Bebidas.dataSource = self
        table_Bebidas.delegate = self
        
        if CategoriaBebidas?.id == 1 {
            self.title = "Cervezas"
            let newBebida = Bebidas(id: 7, nombre: "Michelob Ultra", imagen: "http://www.cocinayvino.com/wp-content/uploads/2017/08/ultra.jpg", precio: 60.00, descripcion: "sdsf", idCategoria: 1)
            let newBebida2 = Bebidas(id: 8, nombre: "Bud light", imagen: "http://www.thebeerstore.ca/sites/default/files/styles/brand_hero/public/sbs/brand/0574H.jpg?itok=5anlVfWi", precio: 50.00, descripcion: "sdfdsf", idCategoria: 1)
            let newBebida3 = Bebidas(id: 9, nombre: "Corona", imagen: "https://images.ssstatic.com/cerveza-corona-355-ml-27323753z0-22485967.jpg", precio: 50.00, descripcion: "dfdsf", idCategoria: 1)
            
            BebidasArray.append(newBebida)
            BebidasArray.append(newBebida2)
            BebidasArray.append(newBebida3)
            BebidasArray.append(newBebida)
            BebidasArray.append(newBebida2)
            BebidasArray.append(newBebida3)
            BebidasArray.append(newBebida)
            BebidasArray.append(newBebida2)
            BebidasArray.append(newBebida3)
        }
        
        if CategoriaBebidas?.id == 2 {
            self.title = "Sodas"
            let newBebida = Bebidas(id: 16, nombre: "Coca Cola", imagen: "https://www.myjewishlearning.com/wp-content/uploads/2009/05/coke-resized.jpg", precio: 30.00, descripcion: "sdsf", idCategoria: 1)
            let newBebida2 = Bebidas(id: 17, nombre: "Sprite", imagen: "https://i.ytimg.com/vi/xznpV2TXecE/maxresdefault.jpg", precio: 30.00, descripcion: "sdfdsf", idCategoria: 1)
            let newBebida3 = Bebidas(id: 18, nombre: "Fanta", imagen: "https://i.pinimg.com/originals/2f/85/a6/2f85a668b4c980ef2247a13ffd7cddc9.jpg", precio: 30.00, descripcion: "dfdsf", idCategoria: 1)
            
            BebidasArray.append(newBebida)
            BebidasArray.append(newBebida2)
            BebidasArray.append(newBebida3)
            BebidasArray.append(newBebida)
            BebidasArray.append(newBebida2)
            BebidasArray.append(newBebida3)
            BebidasArray.append(newBebida)
            BebidasArray.append(newBebida2)
            BebidasArray.append(newBebida3)
        }
        
        if CategoriaBebidas?.id == 3 {
            self.title = "Aguas Frescas"
            let newBebida = Bebidas(id: 19, nombre: "Limonada", imagen: "https://mejorconsalud.com/wp-content/uploads/2017/10/Limonada.jpg", precio: 30.00, descripcion: "sdsf", idCategoria: 1)
            let newBebida2 = Bebidas(id: 20, nombre: "Agua de jamaica", imagen: "http://www.1001consejos.com/wp-content/uploads/2014/08/beneficios-de-agua-de-jamaica.jpg", precio: 30.00, descripcion: "sdfdsf", idCategoria: 1)
            let newBebida3 = Bebidas(id: 21, nombre: "Agua de horchata", imagen: "http://cdn2.cocinadelirante.com/sites/default/files/styles/gallerie/public/images/2017/03/aguadehorchatadelamichoacana.jpg", precio: 30.00, descripcion: "dfdsf", idCategoria: 1)
            
            BebidasArray.append(newBebida)
            BebidasArray.append(newBebida2)
            BebidasArray.append(newBebida3)
            BebidasArray.append(newBebida)
            BebidasArray.append(newBebida2)
            BebidasArray.append(newBebida3)
            BebidasArray.append(newBebida)
            BebidasArray.append(newBebida2)
            BebidasArray.append(newBebida3)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return BebidasArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_Bebidas", for: indexPath) as! Bebidas_TableViewCell
        cell.configureCell(Bebida: BebidasArray[indexPath.row])
        
        return cell
    }
    
    @IBAction func AddOrder(_ sender: Any) {
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newOrder = orden(id: 0, cantidad: 1, idPlatillo: BebidasArray[indexPath.row].id, nombre_platillo: BebidasArray[indexPath.row].nombre, precio: BebidasArray[indexPath.row].precio, total: 0)
        if let index = orderArray.index(where: {$0.idPlatillo == newOrder.idPlatillo}){
            orderArray[index].cantidad = orderArray[index].cantidad + 1
        }else{
            orderArray.append(newOrder)
        }
        table_Bebidas.reloadData()
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


