//
//  ThreadsViewController.swift
//  ExamenGonet
//
//  Created by Victor Hugo Vargas Astorga on 09/02/20.
//  Copyright © 2020 Victor Hugo Vargas Astorga. All rights reserved.
//

import UIKit

class ThreadsViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    
    var lstThreads:[String] = []
    @IBOutlet weak var tvTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lstThreads.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL_THREADS") as! cellThreads
        cell.lblTitle.text = lstThreads[indexPath.row]
        return cell
    }
    @IBAction func didTapClear(_ sender: Any) {
        self.lstThreads.removeAll()
        self.tvTable.reloadData()
    }
    @IBAction func didTapStart(_ sender: Any) {
        
        DispatchQueue.global(qos: .background).async {
            self.lstThreads.append("Hilo A|prioridad baja|valor 1")
            DispatchQueue.main.async {
                self.tvTable.reloadData()
            }
        }
        DispatchQueue.global(qos: .background).async {
            self.lstThreads.append("Hilo B|prioridad media|valor 2")
            
            DispatchQueue.global(qos: .background).async {
                self.lstThreads.append("Hilo C|prioridad Alta|valor 3")
                DispatchQueue.main.async {
                    self.tvTable.reloadData()
                }
            }
        }
        
    }
}

class cellThreads: UITableViewCell {
     @IBOutlet weak var lblTitle: UILabel!
}
