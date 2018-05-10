//
//  Categoria_Bebidas_TableViewCell.swift
//  in-eat-out
//
//  Created by brauliop on 2/12/18.
//  Copyright © 2018 BryanMtz. All rights reserved.
//

import UIKit

class Categoria_Bebidas_TableViewCell: UITableViewCell {
    
    @IBOutlet weak var nombre: UILabel!
    
    @IBOutlet weak var imagen: UIImageView!
    var cache = NSCache<AnyObject, AnyObject>()
    func configureCell(Categoria_Bebidas: Categoria_Bebidas){
        nombre.text = Categoria_Bebidas.nombre
        
        if let image = cache.object(forKey: Categoria_Bebidas.imagen as AnyObject){
            imagen.image = image as? UIImage
        }else{
            DispatchQueue.global().async {
                let url = URL(string: Categoria_Bebidas.imagen)
                let data = try? Data(contentsOf: url!)
                DispatchQueue.main.async {
                    self.imagen.image = UIImage(data: data!)
                    self.cache.setObject(UIImage(data: data!)!, forKey: Categoria_Bebidas.imagen as AnyObject)
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
