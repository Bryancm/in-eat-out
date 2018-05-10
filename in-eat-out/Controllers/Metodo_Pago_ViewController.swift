//
//  Metodo_Pago_ViewController.swift
//  in-eat-out
//
//  Created by brauliop on 2/20/18.
//  Copyright © 2018 BryanMtz. All rights reserved.
//

import UIKit
import PassKit


class Metodo_Pago_ViewController: UIViewController {

//    @IBOutlet weak var applePayView: UIView!
    public var total: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Metodo"

    }
    
    @IBAction func pagoEfectivo(_ sender: Any) {
        alertMessage(titleMessage: "", m: "Mesero en camino", titleAction:"Entendido")
    }
    @IBAction func pagoTarjeta(_ sender: Any) {
        
        
    }
    
    func alertMessage(titleMessage:String, m:String, titleAction:String){
        let alert = UIAlertController(title: titleMessage , message: m , preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: titleAction, style: .default) { action in })
        alert.view.tintColor = UIColor.black
        alert.setValue(NSAttributedString(string: alert.message!, attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.medium), NSAttributedStringKey.foregroundColor : UIColor.darkGray]), forKey: "attributedMessage")
        self.present(alert, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? Confirmar_PagoViewController {
            destination.totalOrden = total
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
