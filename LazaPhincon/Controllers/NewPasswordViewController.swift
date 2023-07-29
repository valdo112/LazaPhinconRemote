//
//  NewPasswordViewController.swift
//  LazaPhincon
//
//  Created by Valdo Parlinggoman on 29/07/23.
//

import UIKit

class NewPasswordViewController: UIViewController {

    @IBOutlet weak var resetPassword: UIButton!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    @IBOutlet weak var newPasswordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
//        tabBarController?.tabBar.isHidden = true
    }
    @IBAction private func resetButtonPressed(_ sender: UIButton){
        //notes: ini aku nangkepnya si reset password ini nyocokin password dia sama yang ada di API-nya kalo dari notesnya agnest, dari notesnya putut aku kurang paham maksudnya kayak gimana
        let user = UserDefaults.standard.string(forKey: "USERSPASSWORD")
        if newPasswordTextField.text != user{
            print("Password is not correct")
        } else if repeatPasswordTextField.text != newPasswordTextField.text{
            print("Password are not matching")
        } else {
            print("Password is correct")
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
            self.navigationController?.pushViewController(vc, animated: true)

        }
    }

}
