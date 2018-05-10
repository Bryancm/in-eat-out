//
//  Platillo_TableViewCell.swift
//  in-eat-out
//
//  Created by brauliop on 2/11/18.
//  Copyright © 2018 BryanMtz. All rights reserved.
//

import UIKit

class Platillo_TableViewCell: UITableViewCell {
    
    @IBOutlet weak var nombre: UILabel!
    
    @IBOutlet weak var imagen: UIImageView!
    @IBOutlet weak var precio: UILabel!
    var cache = NSCache<AnyObject, AnyObject>()
    
    func configureCell(Platillo: Platillos){
        nombre.text = Platillo.nombre
        precio.text = String(Platillo.precio)
        if let image = cache.object(forKey: Platillo.imagen as AnyObject){
            imagen.image = image as? UIImage
        }else{
            DispatchQueue.global().async {
                let url = URL(string: Platillo.imagen)
                let data = try? Data(contentsOf: url!)
                DispatchQueue.main.async {
                    self.imagen.image = UIImage(data: data!)
                    self.cache.setObject(UIImage(data: data!)!, forKey: Platillo.imagen as AnyObject)
                }
            }
        }
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
