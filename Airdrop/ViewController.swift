//
//  ViewController.swift
//  Airdrop
//
//  Created by Andrew Belozerov on 02.01.17.
//  Copyright © 2017 Andrew Belozerov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var pictureView: UIImageView!
    
    @IBOutlet weak var camBtn: UIButton!
    @IBOutlet weak var galBtn: UIButton!
    @IBOutlet weak var sendBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureButton(btn: camBtn)
        configureButton(btn: galBtn)
        configureButton(btn: sendBtn)
        
        pictureView.image = UIImage(named: "proSwift_logo.jpg")
        
    }

    

    @IBAction func camButtonTapped(_ sender: UIButton) {
        let imagePicker = UIImagePickerController() // 1
        imagePicker.delegate = self // 2
        imagePicker.sourceType = UIImagePickerControllerSourceType.camera // 3
        
        // для выбора только фотокамеры, не для записи видео
        imagePicker.showsCameraControls = true // 4
        
        self.present(imagePicker, animated: true, completion: nil) // 5
    }
    
    @IBAction func galButtonTapped(_ sender: UIButton) {

        let imagePicker = UIImagePickerController() // 1
        imagePicker.delegate = self // 2
        self.present(imagePicker, animated: true, completion: nil) // 3
        
    }
 
    @IBAction func sendButtonTapped(_ sender: UIButton) {
        let activityItems = [pictureView.image!]
        let activityController = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        self.present(activityController, animated: true, completion: nil)
    }

    
    private func configureButton(btn: UIButton) {
        btn.backgroundColor = UIColor(red: 27/255, green: 89/255, blue: 147/255, alpha: 1.0)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.setTitleColor(UIColor.lightGray, for: .highlighted)
        
        btn.layer.cornerRadius = 4.0
        
        btn.layer.shadowOpacity = 0.6
        btn.layer.shadowOffset = CGSize(width: 2, height: 2)
        btn.layer.shadowRadius = 2
    }
}


extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // UIImagePickerControllerDelegate
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let imageFromPC = info[UIImagePickerControllerOriginalImage] as! UIImage // 1
        pictureView.image = imageFromPC // 2
        self.dismiss(animated: true, completion: nil) // 3
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }

    
}
