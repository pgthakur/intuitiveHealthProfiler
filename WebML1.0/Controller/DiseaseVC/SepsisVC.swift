//
//  SepsisVC.swift
//  Intuitive Health Profiler
//
//  Created by prabhat gaurav on 04/04/22.
//


import UIKit
import CoreML

class SepsisVC : UIViewController {
    
    @IBOutlet var sepsisText: [UITextField]!
    var results : Int64 = 0
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func detect(){
           guard let output = try? Sepsis.model.prediction(HR: Sepsis.Variables[0], O2Sat: Sepsis.Variables[1], SBP: Sepsis.Variables[2], MAP: Sepsis.Variables[3], DBP: Sepsis.Variables[4], Resp: Sepsis.Variables[5], Age: Sepsis.Variables[6], Gender: Sepsis.Variables[7], Unit1: Sepsis.Variables[8], Unit2: Sepsis.Variables[9], HospAdmTime: Sepsis.Variables[10], ICULOS: Sepsis.Variables[11]) else{
               fatalError("Input")
           }
            results = output.SepsisLabel
//           self.navigationItem.title = "\(result)"
           performSegue(withIdentifier: "result", sender: self)
           print(results)
       }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let result = segue.destination as! ResultVC
        if results == 0 {
                   result.result = "Congrats!! Our algo has predicted you don't have Sepsis"
               }
               else if results == 1 {
                   result.result = "Our algo has predicted that you have a high chance of Sepsis"
          }
    }
    @IBAction func submitPressed(_ sender: UIButton) {
        var count = 0
        for textfields in sepsisText{
            Sepsis.Variables.append(Double(textfields.text!) ?? Sepsis.mean[count])
            
            count = count+1
        }
        detect()
        for textfields in sepsisText {
            textfields.text = " "
        }
    }
}
