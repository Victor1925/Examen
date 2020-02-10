//
//  ViewController.swift
//  ExamenGonet
//
//  Created by Victor Hugo Vargas Astorga on 07/02/20.
//  Copyright © 2020 Victor Hugo Vargas Astorga. All rights reserved.
//
import Foundation
import UIKit

class ViewController: UIViewController , UITableViewDelegate,UITableViewDataSource {

    var lstObjects:[testModel] = []
    let dummyClass: Dummy = Dummy()
    @IBOutlet weak var tvTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.lstObjects = dummyClass.createAndFillList()
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.lstObjects.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL") as! cellTest
        
        cell.imgImage.image = self.lstObjects[indexPath.row].imgImage
        cell.lblTitle.text = self.lstObjects[indexPath.row].strTitle
        cell.lblText.text = self.lstObjects[indexPath.row].strText
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle:nil)
        let detailsViewController = storyBoard.instantiateViewController(identifier: "DetailsViewController") as! DetailsViewController
        detailsViewController.objectDetails = self.lstObjects[indexPath.row]
        detailsViewController.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(detailsViewController, animated: true)
    }
}

class cellTest: UITableViewCell{
    
    @IBOutlet weak var imgImage: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblText: UILabel!
}

