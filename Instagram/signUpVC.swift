//
//  signUpVC.swift
//  Instagram
//
//  Created by Shao Kahn on 9/13/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit

class signUpVC: UIViewController,UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
//Auto layout height
    @IBOutlet weak var scrollArea: NSLayoutConstraint!
    
//ImageView
    @IBOutlet weak var avaImg: UIImageView!
    
//TextFields
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var repeat_passwordTxt: UITextField!

    @IBOutlet weak var fullnameTxt: UITextField!
    @IBOutlet weak var bioTxt: UITextField!
    @IBOutlet weak var webTxt: UITextField!
 
//ScrollView
    @IBOutlet weak var scrollView: UIScrollView!

//Buttons
    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var cancelBtn: UIButton!


    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

    //round ava
    avaImg.layer.cornerRadius = avaImg.frame.size.width / 2
    avaImg.clipsToBounds = true
        
 //recognize textfileddelegate
usernameTxt.delegate = self
passwordTxt.delegate = self
repeat_passwordTxt.delegate = self
fullnameTxt.delegate = self
bioTxt.delegate = self
webTxt.delegate = self

//scrollview scroll area
 scrollArea.constant = 800
  
//declare select image image
        let avaTap = UITapGestureRecognizer(target: self, action: #selector(self.loadImg(recognizer:)))
avaTap.numberOfTapsRequired = 1
avaImg.isUserInteractionEnabled = true //user can click image
avaImg.addGestureRecognizer(avaTap)
        
        }
    
    
    
    
//the custom function
    func loadImg(recognizer:UITapGestureRecognizer){
    
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
        
    }//choose the photo from the phone library
  
    
    
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
 
    
    
    
//the delegate or datasource function
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        usernameTxt.resignFirstResponder()
        passwordTxt.resignFirstResponder()
        repeat_passwordTxt.resignFirstResponder()
        fullnameTxt.resignFirstResponder()
        bioTxt.resignFirstResponder()
        webTxt.resignFirstResponder()
        return true
    }//func make that user clicks return can tab keyboard true

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        avaImg.image = info[UIImagePickerControllerEditedImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }//func connect selected image to our ImageView
    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    //click sign up
    @IBAction func signUpBtn_click(_ sender: Any) {
   
    }
   
    //click cancel
    @IBAction func cancelBtn_click(_ sender: Any) {
   self.dismiss(animated: true, completion: nil)
    }

    
    
}
