//
//  DetailsViewController.swift
//  ExamenGonet
//
//  Created by Victor Hugo Vargas Astorga on 09/02/20.
//  Copyright © 2020 Victor Hugo Vargas Astorga. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imImage: UIImageView!
    @IBOutlet weak var lblText: UILabel!
    var objectDetails:testModel = testModel(strTitle: "", imgImage: UIImage(), strText: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.lblTitle.text = objectDetails.strTitle
        self.lblText.text = objectDetails.strText
        self.imImage.image = objectDetails.imgImage
    }
}
