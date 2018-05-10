//
//  Categoria_Bebidas_ViewController.swift
//  in-eat-out
//
//  Created by brauliop on 2/12/18.
//  Copyright © 2018 BryanMtz. All rights reserved.
//
import UIKit


class Categoria_Bebidas_ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var table_Categoria_Bebidas: UITableView!
    
    var Categoria_Bebidas_Array = [Categoria_Bebidas]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table_Categoria_Bebidas.dataSource = self
        table_Categoria_Bebidas.delegate = self
        
        
        let nuevaCategoria = Categoria_Bebidas(id: 1, nombre: "Cerveza", imagen: "http://eltrochilero.com/wp-content/uploads/2017/08/20-tarro-istock.jpg")
        let nuevaCategoria2 = Categoria_Bebidas(id: 2, nombre: "Sodas", imagen: "https://www.planetacurioso.com/wp-content/uploads/2014/10/coca-fria.jpg")
        let nuevaCategoria3 = Categoria_Bebidas(id: 3, nombre: "Aguas Frescas", imagen: "http://servinox.com.mx/blog/wp-content/uploads/2014/05/aguas-frescas-2.jpg")
        Categoria_Bebidas_Array.append(nuevaCategoria)
        Categoria_Bebidas_Array.append(nuevaCategoria2)
        Categoria_Bebidas_Array.append(nuevaCategoria3)
        Categoria_Bebidas_Array.append(nuevaCategoria)
        Categoria_Bebidas_Array.append(nuevaCategoria2)
        Categoria_Bebidas_Array.append(nuevaCategoria3)

        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Categoria_Bebidas_Array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_Categoria_Bebidas", for: indexPath) as! Categoria_Bebidas_TableViewCell
        cell.configureCell(Categoria_Bebidas: Categoria_Bebidas_Array[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let id_Bebidas_cat = Categoria_Bebidas_Array[indexPath.row]
        self.performSegue(withIdentifier: "Bebidas", sender: id_Bebidas_cat)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? Lista_Bebidas_ViewController {
            if let selectedCategoriaPlatillos = sender as? Categoria_Bebidas{
                destination.CategoriaBebidas = selectedCategoriaPlatillos
            }
        }
    }
    
    
    
    
}

