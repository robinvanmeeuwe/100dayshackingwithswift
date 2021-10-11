//
//  ViewController.swift
//  challenge_day90
//
//  Created by Robin van Meeuwen on 11/10/2021.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var currentImage: UIImage!
    var toptTextImage: String?
    var bottomText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "MEME Collector"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(importPicture))
        // Do any additional setup after loading the view.
    }
    
    @objc func importPicture() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        
        dismiss(animated: true)
        
        currentImage = image
    }
    
   
    
}

