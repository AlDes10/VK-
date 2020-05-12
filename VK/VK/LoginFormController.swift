//
//  LoginFormController.swift
//  Weather1
//
//  Created by Александр Десятчиков on 12/05/2020.
//  Copyright © 2020 AlDes. All rights reserved.
//

import UIKit;

class LoginFormController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad();
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard));
        scrollView?.addGestureRecognizer(hideKeyboardGesture);
    };
    
    @IBOutlet weak var scrollView: UIScrollView!;
    @IBOutlet weak var loginInput: UITextField!;
    
    @IBOutlet weak var passwordInput: UITextField!;
    @IBAction func singIn(_ sender: Any) {
        let login = loginInput.text!;
        let password = passwordInput.text!;
               if login == "admin" && password == "123" {
                print("Welcome");
               } else {
                print("Incorrect login or password");
        };
    };
    
    @objc func keyboardWasShown(notification: Notification) {
        let info = notification.userInfo! as NSDictionary;
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size;
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0);
        self.scrollView?.contentInset = contentInsets;
        scrollView?.scrollIndicatorInsets = contentInsets;
    };
      
       @objc func keyboardWillBeHidden(notification: Notification) {
        let contentInsets = UIEdgeInsets.zero;
        scrollView?.contentInset = contentInsets;
    };
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil);
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil);
    };
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated);
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil);
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil);
    };

    @objc func hideKeyboard() {
        self.scrollView?.endEditing(true);
    };

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

};
