//
//  Categoria_Platillos_TableViewCell.swift
//  in-eat-out
//
//  Created by brauliop on 2/11/18.
//  Copyright © 2018 BryanMtz. All rights reserved.
//

import UIKit

class Categoria_Platillos_TableViewCell: UITableViewCell {
    
    @IBOutlet weak var nombre: UILabel!
    
    @IBOutlet weak var imagen: UIImageView!
    var cache = NSCache<AnyObject, AnyObject>()
    func configureCell(Categoria_Platillos: Categoria_Platillos){
        nombre.text = Categoria_Platillos.nombre
        
        if let image = cache.object(forKey: Categoria_Platillos.imagen as AnyObject){
            imagen.image = image as? UIImage
        }else{
            DispatchQueue.global().async {
                let url = URL(string: Categoria_Platillos.imagen)
                let data = try? Data(contentsOf: url!)
                DispatchQueue.main.async {
                    self.imagen.image = UIImage(data: data!)
                    self.cache.setObject(UIImage(data: data!)!, forKey: Categoria_Platillos.imagen as AnyObject)
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

