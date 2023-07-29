//
//  SignInViewController.swift
//  LazaPhincon
//
//  Created by Valdo Parlinggoman on 26/07/23.
//

import UIKit

class SignInViewController: UIViewController {

    var network = Network()
    var users = [UserData]()
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var subtitleLabel: UILabel!{
        didSet{
            subtitleLabel.text = "Please enter your data to continue"
            subtitleLabel.font = UIFont(name: "Inter-Regular", size: 15)
        }
    }
    @IBOutlet weak var headLabel: UILabel!{
        didSet{
            headLabel.text = "Welcome"
            headLabel.font = UIFont(name: "Inter-SemiBold", size: 28)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
    }
    
    @IBAction private func loginButtonPressed(_ sender: UIButton){
        
        network.fetchAPIUser { users in
            self.users = users
            for i in 0..<self.users.count{
                
                if self.usernameTextField.text == self.users[i].username && self.passwordTextField.text == self.users[i].password{
                    let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TabBarController")
                    self.navigationController!.pushViewController(vc, animated: true)
                    UserDefaults.standard.set(true, forKey: "USERISLOGGEDIN")
                    UserDefaults.standard.set(self.users[i].username, forKey: "USERSNAME")
                    UserDefaults.standard.set(self.users[i].password, forKey: "USERSPASSWORD")
                    self.navigationController?.isNavigationBarHidden = true
                } else {
                    print("user is false")
                }
                
                print(self.users[i].username)
            }
        }
    }
}
