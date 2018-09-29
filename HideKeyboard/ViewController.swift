//
//  ViewController.swift
//  HideKeyboard
//
//  Created by cis290 on 9/24/18.
//  Copyright © 2018 Rock Valley College. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var txtView: UITextView!
    @IBOutlet weak var ScrollView: UIScrollView!
    @IBOutlet weak var txtFirst: UITextField!
    @IBOutlet weak var txtLast: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBAction func btnBack(_ sender: UIButton) {
        //Set ScrollPoint and Go to ZERO location (Top) of ScrollView - animated
        ScrollView.setContentOffset(CGPoint.zero, animated: true)

        //set txtFirst as firstresponder
        txtFirst.becomeFirstResponder()
    }

    @IBAction func btnSave(_ sender: UIButton) {
        //hide keyboard
        DismissKeyboard()
        
        //validation that all fields are entered
        if (txtFirst.text=="" || txtLast.text=="" || txtEmail.text=="")
        {
            //Call MessageBox if any fields are empty
            MsgBox("All fields required, please correct")
        }
        else
        {
            
            //Check if txtView (UITextView) is empty
            if (txtView.text=="")
            {
                //if empty then add text and newline
                txtView.text = "MyContacts \n"
            }
            //format text
            
            //existing contents of txtView, newline, txtFirst, newline, txtLast, newline, txtEmail, newline
            txtView.text = "\(txtView.text!) \n\(txtFirst.text!) \n\(txtLast.text!) \n\(txtEmail.text!)\n"
            //clear textboxes
            txtFirst.text = ""
            txtLast.text = ""
            txtEmail.text = ""

            //load scrollview
            
            //declare CGPoint scrollPoint
            var scrollPoint:CGPoint
            
            //X = from Left, Y = from Top
            //get X = 0, Y = location of btnBack Y
            scrollPoint = CGPoint(x:0, y:btnBack.frame.origin.y)
            //Set ScrollPoint and Go to animated
            ScrollView.setContentOffset(scrollPoint, animated: true)
            
        }
    }
    
    @IBAction func btnView(_ sender: UIButton) {
        //hide keyboard
        DismissKeyboard()
        
        //declare CGPoint scrollPoint
        var scrollPoint:CGPoint
        
        //X = from Left, Y = from Top
        //get X = 0, Y = location of btnBack Y
        scrollPoint = CGPoint(x: 0, y: btnBack.frame.origin.y)
        
        //Set ScrollPoint and Go to animated
        ScrollView.setContentOffset(scrollPoint, animated: true)
    }
    
    // 4) Add MessageBox function using AlertView
    func MsgBox(_ message:String)
    {
        //Create Alert
        let alert = UIAlertView()
        alert.title = "Alert"
        alert.message = message
        alert.addButton(withTitle: "OK")
        alert.show()
        
    }
    
    // 5) Add touchesBegan function to catch screen tap and resign keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //Add Below Code from "Code for Steps.txt". Read Comments
        
        //forces resign first responder and hides keyboard
        txtFirst.endEditing(true)
        txtLast.endEditing(true)
        txtEmail.endEditing(true)
        
        
    }
    
    // 6) Add DismissKeyboard function to resign keyboard on all textboxes
    @objc func DismissKeyboard(){
        //Add Below Code from "Code for Steps.txt". Read Comments
        
        //forces resign first responder and hides keyboard
        txtFirst.endEditing(true)
        txtLast.endEditing(true)
        txtEmail.endEditing(true)
        
        
    }
    
    //  7) Add textFieldShouldReturn function. This is called when 'return' key pressed on any UITextField. return NO to ignore.
    func textFieldShouldReturn(_ textField: UITextField!) -> Bool     {
        //Add Below Code from "Code for Steps.txt". Read Comments
        
        textField.resignFirstResponder()
        return true;
    }
    
    //  8) Add textFieldDidBeginEditing function. ScrollPoint when entering UItextfied
    func textFieldDidBeginEditing(_ textField:UITextField){
        //Add Below Code from "Code for Steps.txt". Read Comments
        var scrollPoint:CGPoint
        scrollPoint = CGPoint(x:0, y:textField.frame.origin.y)
        ScrollView.setContentOffset(scrollPoint, animated: true)
        
    }
    
    // 9) Add textFieldDidEndEditing function. ScrollPoint when done editing UItextfied
    func textFieldDidEndEditing(_ textField:UITextField){
        //Add Below Code from "Code for Steps.txt". Read Comments
        
        ScrollView.setContentOffset(CGPoint.zero, animated: true)
    }
    
    // 10) Add textViewDidBeginEditing function. ScrollPoint when entering UItextView
    func textViewDidBeginEditing(_ textField:UITextView){
        //Add Below Code from "Code for Steps.txt". Read Comments
        var scrollPoint:CGPoint
        scrollPoint = CGPoint(x:0, y:textField.frame.origin.y)
        
        ScrollView.setContentOffset(scrollPoint, animated: true)
        
    }
    
    // 11) Add textViewDidEndEditing function. ScrollPoint when done ending UItextView
    func textViewDidEndEditing(_ textField:UITextView){
        //Add Below Code from "Code for Steps.txt". Read Comments
        ScrollView.setContentOffset(CGPoint.zero, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //Looks for single or multiple taps
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.DismissKeyboard))
        //Adds tap gesture to ScrollView which will call DismissKeyboard and hide keyboard
        ScrollView.addGestureRecognizer(tap)
        //gets ScreenSize of current device
        let size: CGRect = UIScreen.main.bounds
        //Go to left  = 0 pixels, top = 50 pixels, width of device in pixels, height of device in pixels
        ScrollView.frame = CGRect(x:0, y:50, width:size.width, height:size.height)
        //Set focus on txtFirst
        txtFirst.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

