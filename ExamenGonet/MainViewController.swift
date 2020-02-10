//
//  MainViewController.swift
//  ExamenGonet
//
//  Created by Victor Hugo Vargas Astorga on 09/02/20.
//  Copyright © 2020 Victor Hugo Vargas Astorga. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var scSegment: UISegmentedControl!
    @IBOutlet weak var vwContainer: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateView()
        // Do any additional setup after loading the view.
    }
    
    private lazy var firstViewController: ViewController = {
           let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
           var viewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            self.addChild(viewController)
           return viewController
       }()
    
    private lazy var secondViewController: ThreadsViewController = {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        var viewController = storyboard.instantiateViewController(withIdentifier: "ThreadsViewController") as! ThreadsViewController
         self.addChild(viewController)
        return viewController
    }()
    
    static func viewController() -> MainViewController {
        return UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
    }
    @IBAction func segmentValueChanged(_ sender: UISegmentedControl) {
           updateView()
       }
    
    private func add(asChildViewController viewController: UIViewController) {

        addChild(viewController)
        vwContainer.addSubview(viewController.view)
        viewController.view.frame = vwContainer.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        viewController.didMove(toParent: self)
    }
    
    private func remove(asChildViewController viewController: UIViewController) {
        
        viewController.willMove(toParent: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParent()
    }
    
    private func updateView() {
        if scSegment.selectedSegmentIndex == 0 {
            remove(asChildViewController: secondViewController)
            add(asChildViewController: firstViewController)
        } else {
            remove(asChildViewController: firstViewController)
            add(asChildViewController: secondViewController)
        }
    }
}
