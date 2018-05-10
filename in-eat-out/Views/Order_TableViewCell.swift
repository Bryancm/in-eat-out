//
//  Order_TableViewCell.swift
//  in-eat-out
//
//  Created by brauliop on 2/12/18.
//  Copyright © 2018 BryanMtz. All rights reserved.
//

import UIKit

class Order_TableViewCell: UITableViewCell {
    
    @IBOutlet weak var quantity: UILabel!
    @IBOutlet weak var name_product: UILabel!
    @IBOutlet weak var price: UILabel!
    
    func configureCell(order: orden){
        quantity.text = String(order.cantidad)
        name_product.text = order.nombre_platillo
        price.text = String(order.precio)
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
