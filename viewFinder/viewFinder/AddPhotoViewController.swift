//
//  AddPhotoViewController.swift
//  viewFinder
//
//  Created by Daniya Z Ali on 8/13/19.
//  Copyright © 2019 Daniya Z Ali. All rights reserved.
//

import UIKit

class AddPhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
    }

    @IBAction func takeSelfieTApped(_ sender: UIButton) {
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
    }
    @IBAction func photoLibraryTapped(_ sender: UIButton) {
        
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    @IBOutlet weak var displayImage: UIImageView!
    
    func imagePickerController (_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            displayImage.image = selectedImage
        }
        imagePicker.dismiss(animated: true, completion: nil)
        // update our photo with the selected photo
        // go to back to our viewController so the user can see the update
    }
    @IBOutlet weak var captionText: UITextField!
    
    @IBAction func savePhotoTapped(_ sender: UIButton) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let photoToSave = Photos(entity: Photos.entity(), insertInto: context)
            photoToSave.caption = captionText.text
            if let userImage = displayImage.image{
            if let userImageData = userImage.pngData() {
                    photoToSave.imageData = userImageData
                }
            }
        }
    }
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


