//
//  Orden_ViewController.swift
//  in-eat-out
//
//  Created by brauliop on 2/11/18.
//  Copyright © 2018 BryanMtz. All rights reserved.
//
import Alamofire
import SwiftyJSON
import UIKit
var orderArray = [orden]()
class Orden_Controller: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var table_order: UITableView!
    
    @IBOutlet weak var total_order: UILabel!
    var carrito = [[:]] as [[String:Any]]
    override func viewDidLoad() {
        super.viewDidLoad()
        table_order.dataSource = self
        table_order.delegate = self
        
//        let newOrder = orden(id: 0, cantidad: 2, nombre_platillo: "Hamburguesa", precio: 100.00, total: 0)
//        orderArray.append(newOrder)
//        orderArray.append(newOrder)
//        orderArray.append(newOrder)
//        orderArray.append(newOrder)
//        orderArray.append(newOrder)
//        orderArray.append(newOrder)
//        orderArray.append(newOrder)
    }
    override func viewWillAppear(_ animated: Bool) {
        table_order.reloadData()
        totalOrder()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_order", for: indexPath) as! Order_TableViewCell
        cell.configureCell(order: orderArray[indexPath.row])
        return cell
    }
    
    func totalOrder(){
        var t:Double = 0
        
        for p in orderArray{
            t = t + (p.precio * Double(p.cantidad))
        }
        
        total_order.text = String(t)
    }
    
    
    func alertMessage(titleMessage:String, m:String, titleAction:String){
        let alert = UIAlertController(title: titleMessage , message: m , preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: titleAction, style: .default) { action in })
        alert.view.tintColor = UIColor.black
        alert.setValue(NSAttributedString(string: alert.message!, attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.medium), NSAttributedStringKey.foregroundColor : UIColor.darkGray]), forKey: "attributedMessage")
        self.present(alert, animated: true)
    }
    
    @IBAction func enviarOrden(_ sender: Any) {
//        alertMessage(titleMessage: "", m: "Orden enviada ", titleAction:"Entendido")
        if orderArray.count > 0 {
            enviarOrdenJson()
            total_order.text = "0"
        }else{
            alertMessage(titleMessage: "", m: "Por favor agregue un platillo para enviar orden", titleAction:"Entendido")
        }
        
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            orderArray.remove(at: indexPath.row)
            table_order.deleteRows(at: [indexPath], with: .automatic)
            totalOrder()
        }
    }
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Eliminar"
    }
    func enviarOrdenJson(){
        
        for o in  orderArray {
            let t = Double(o.cantidad) * o.precio
            let p = ["id":0,"idproductos":o.idPlatillo,"cantidad":o.cantidad,"precio":o.precio,"total":t] as [String:Any]
            carrito.append(p)
        }
        
        carrito.removeFirst()
        
        let dataSend = ["idventas":0,"estado":0,"cliente":"Mesa 15","direccion":"","telefono":"","comentarios":"","carrito":carrito] as [String:Any]
        Alamofire.request("http://192.168.43.93/InEatOut/php/pedido_agregar.php",method: .post, parameters: dataSend, encoding: JSONEncoding(options: [])).responseString { response in
            switch response.result {
            case .success:
                print("Validation Successful")
                self.alertMessage(titleMessage: "", m: "Orden enviada ", titleAction:"Entendido")
                self.carrito = [[:]]
                orderArray = []
                self.table_order.reloadData()
            case .failure(let error):
                print(error)
                self.alertMessage(titleMessage: "", m: "ERROR", titleAction:"Entendido")
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? Metodo_Pago_ViewController {
            destination.total = total_order.text!
        }
    }
    
    
}
