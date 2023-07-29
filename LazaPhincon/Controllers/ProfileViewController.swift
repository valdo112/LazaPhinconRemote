//
//  ProfileViewController.swift
//  LazaPhincon
//
//  Created by Valdo Parlinggoman on 29/07/23.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var emaillTextField:UITextField!{
        didSet{
            emaillTextField.text = UserDefaults.standard.string(forKey: "USERSEMAIL")
        }
    }
    @IBOutlet weak var usernameTextField: UITextField!{
        didSet{
            usernameTextField.text = UserDefaults.standard.string(forKey: "USERSNAME")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
    }

    @IBAction private func forgotPasswordPressed(_ sender: UIButton){
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NewPasswordViewController") as! NewPasswordViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction private func logoutPressed(_ sender: UIButton){
        UserDefaults.standard.set(false, forKey: "USERISLOGGEDIN")
        self.navigationController?.popToRootViewController(animated: true)
    }
}
