//
//  Categoria_Platillos_ViewController.swift
//  in-eat-out
//
//  Created by brauliop on 2/11/18.
//  Copyright © 2018 BryanMtz. All rights reserved.
//
import UIKit


class Categoria_Platillos_ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var table_Categoria_Platillos: UITableView!
    
    var Categoria_Platillos_Array = [Categoria_Platillos]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table_Categoria_Platillos.dataSource = self
        table_Categoria_Platillos.delegate = self
        
        
        let nuevaCategoria = Categoria_Platillos(id: 1, nombre: "Entradas", imagen: "http://taconazo.com.ec/wp-content/uploads/2012/07/Botanas-1-900x444.jpg")
        let nuevaCategoria2 = Categoria_Platillos(id: 2, nombre: "Platillos Principales", imagen: "http://cdn2.cocinadelirante.com/sites/default/files/styles/gallerie/public/images/2017/07/hamburguesahawaiana.jpg")
        let nuevaCategoria3 = Categoria_Platillos(id: 3, nombre: "Postres", imagen: "http://cdn2.cocinadelirante.com/sites/default/files/images/2017/07/10postresconlechecondensada.jpg")
        Categoria_Platillos_Array.append(nuevaCategoria)
        Categoria_Platillos_Array.append(nuevaCategoria2)
        Categoria_Platillos_Array.append(nuevaCategoria3)
        Categoria_Platillos_Array.append(nuevaCategoria)
        Categoria_Platillos_Array.append(nuevaCategoria2)
        Categoria_Platillos_Array.append(nuevaCategoria3)

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Categoria_Platillos_Array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_Categoria_Platillos", for: indexPath) as! Categoria_Platillos_TableViewCell
        cell.configureCell(Categoria_Platillos: Categoria_Platillos_Array[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let id_platillo_cat = Categoria_Platillos_Array[indexPath.row]
        self.performSegue(withIdentifier: "Platillos", sender: id_platillo_cat)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? Lista_Platillos_ViewController {
            if let selectedCategoriaPlatillos = sender as? Categoria_Platillos{
                destination.CategoriaPlatillos = selectedCategoriaPlatillos
            }
        }
    }
    
    
    
    
}
