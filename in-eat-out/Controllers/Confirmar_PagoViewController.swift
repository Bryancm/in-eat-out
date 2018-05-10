//
//  Confirmar_PagoViewController.swift
//  in-eat-out
//
//  Created by brauliop on 2/25/18.
//  Copyright © 2018 BryanMtz. All rights reserved.
//

import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

class Confirmar_PagoViewController: UIViewController {

    @IBOutlet weak var total: UILabel!
    var totalOrden : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
         self.hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view.
        self.title = "Confirmar pago"
        total.text = totalOrden
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func alertMessage(titleMessage:String, m:String, titleAction:String){
        let alert = UIAlertController(title: titleMessage , message: m , preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: titleAction, style: .default) { action in })
        alert.view.tintColor = UIColor.black
        alert.setValue(NSAttributedString(string: alert.message!, attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.medium), NSAttributedStringKey.foregroundColor : UIColor.darkGray]), forKey: "attributedMessage")
        self.present(alert, animated: true)
    }
    
    @IBAction func confirmarPago(_ sender: Any) {
        alertMessage(titleMessage: "", m: "Por el momento, No esta disponible", titleAction: "Entendido")
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
