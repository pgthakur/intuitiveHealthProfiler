//
//  SkinLesion.swift
//  Intuitive Health Profiler
//
//  Created by prabhat gaurav on 04/04/22.
//


import UIKit
import Vision
import CoreML

class SkinLesion : UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    @IBOutlet weak var image: UIImageView!
    let imagePicker = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        
        imagePicker.allowsEditing = false
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let userImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            image.image = userImage
            guard let clImage = CIImage(image: userImage) else {
                fatalError("Image not converted")
            }
            detect(image: clImage)
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    func convertCIImageToCGImage(inputImage: CIImage) -> CGImage! {
        let context = CIContext(options: nil)
        if context != nil {
            return context.createCGImage(inputImage, from: inputImage.extent)
        }
        return nil
    }
    
    func detect(image:CIImage){
        guard let model = try? VNCoreMLModel(for: ham10000().model) else {
            fatalError("Model Failed")
        }
        let request = VNCoreMLRequest(model: model) { (request, error) in
            let classification = request.results?.first as? VNClassificationObservation
            self.navigationItem.title = classification?.identifier.capitalized
            print(classification)
        }
        if let sendImage = convertCIImageToCGImage(inputImage: image){
        let handler = VNImageRequestHandler(cgImage: sendImage)
        do{
            try handler.perform([request])
        }
        catch {
            print(error)
        }
    }
    }
    
    @IBAction func cameraPressed(_ sender: UIButton) {
         present(imagePicker, animated: true, completion: nil)
    }
    
}
