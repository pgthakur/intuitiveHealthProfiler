//
//  ResultVC.swift
//  Intuitive Health Profiler
//
//  Created by prabhat gaurav on 04/04/22.
//


import UIKit

class ResultVC : UIViewController{
    @IBOutlet weak var resultsLabel: UILabel!
    @IBOutlet var hospButton: [UIButton]!
    @IBOutlet weak var hospLabel: UILabel!
    var result : String = ""
    var hospitalLabel = ""
    var url = [
        "" , "" , ""
    ]
    var hospName = [
      "" ,"" ,""
    ]
    var buttonState = UIControl.State.normal
    override func viewDidLoad() {
        super.viewDidLoad()
        resultsLabel.lineBreakMode = .byWordWrapping
        resultsLabel.numberOfLines = 0
        resultsLabel.text = result
        resultsLabel.textColor = .white
        hospLabel.text = hospitalLabel
        hospButton[0].setTitle(hospName[0], for: buttonState)
        hospButton[1].setTitle(hospName[1], for: buttonState)
        hospButton[2].setTitle(hospName[2], for: buttonState)
    }
    @IBAction func button1(_ sender: UIButton) {
        if let url = URL(string: url[0]) {
            UIApplication.shared.open(url)
        }
    }
    
}
