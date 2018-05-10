//
//  MenuViewController.swift
//  in-eat-out
//
//  Created by brauliop on 2/10/18.
//  Copyright © 2018 BryanMtz. All rights reserved.
//

import UIKit

class MenuViewController: UITabBarController {

    var mesa: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated:true);
        // Do any additional setup after loading the view.
        self.title = "Mesa 15"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
