//
//  HomeVC.swift
//  Intuitive Health Profiler
//
//  Created by prabhat gaurav on 04/04/22.
//


import UIKit

class HomeVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{

    
    
    @IBOutlet weak var diseasePicker: UIPickerView!
    
    
    var homeData = home()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        diseasePicker.delegate = self
        diseasePicker.dataSource = self
        navigationController?.navigationBar.barTintColor = UIColor.darkGray
        navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
    }
     
    @IBAction func submitPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: homeData.disease, sender: self)
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return homeData.pickerData.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return homeData.pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        homeData.disease = homeData.pickerData[row]

    }
    
}

