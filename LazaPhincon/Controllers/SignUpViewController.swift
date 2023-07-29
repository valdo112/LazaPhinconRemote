//
//  SignUpViewController.swift
//  LazaPhincon
//
//  Created by Valdo Parlinggoman on 26/07/23.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var signUpLabel: UILabel!{
        didSet{
            signUpLabel.text = "Sign Up"
            signUpLabel.font = UIFont(name: "Inter-SemiBold", size: 28)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.backIndicatorImage = nil
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = nil
        let backButton = UIBarButtonItem()
        backButton.image = UIImage(systemName: "arrow.backward.circle.fill")
        backButton.title = ""
        navigationItem.backBarButtonItem = backButton
    }
    @IBAction func signUpButtonPressed(_ sender: UIButton) {
        UserDefaults.standard.set(usernameTextField.text, forKey: "USERSNAME")
        UserDefaults.standard.set(passwordTextField.text, forKey: "USERSPASSWORD")
        UserDefaults.standard.set(emailTextField.text, forKey: "USERSEMAIL")
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
