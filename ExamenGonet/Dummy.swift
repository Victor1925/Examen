//
//  Dummy.swift
//  ExamenGonet
//
//  Created by Victor Hugo Vargas Astorga on 09/02/20.
//  Copyright © 2020 Victor Hugo Vargas Astorga. All rights reserved.
//

import Foundation
import UIKit

class Dummy {
    func createAndFillList() -> [testModel]{
        var lstTest = [testModel]()
        let test1 = testModel(strTitle: "title", imgImage: UIImage(named: "imageTable")!, strText: "Dynamic subtitlke content content content content content content content content content content content content content content content content content content content content content content content content content content content content content content content content content content content content content content content content content content content content content content content content content content content content")
        let test2 = testModel(strTitle: "title now multiline , multiline", imgImage: UIImage(named: "imageTable")!, strText: "Dynamic subtitlke content content content content content content content content content content content content content content content content content content content content content content content content content content content content content content content content content")
        
        for _ in 1...10{
            lstTest.append(test1)
            lstTest.append(test2)
        }
        
        return lstTest
    }
}
