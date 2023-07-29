//
//  GetStartedViewController.swift
//  LazaPhincon
//
//  Created by Valdo Parlinggoman on 26/07/23.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit

class GetStartedViewController: UIViewController {
    
    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!{
        didSet{
            signInButton.setTitle("Sign In", for: .normal)
        }
    }
    @IBOutlet weak var signInLabel: UILabel!{
        didSet{
            signInLabel.text = "Already have an Account? "
            signInLabel.font = UIFont(name: "Inter-Regular", size: 15)
        }
    }
    @IBOutlet weak var googleButton: UIButton!
    @IBOutlet weak var twitterButton: UIButton!
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var getStartedLabel: UILabel!{
        didSet{
            getStartedLabel.text = "Let’s Get Started"
            getStartedLabel.font = UIFont(name: "Inter-SemiBold", size: 28)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.backIndicatorImage = nil
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = nil
        let backButton = UIBarButtonItem()
        backButton.title = ""
        backButton.image = UIImage(systemName: "arrow.backward.circle.fill")
        navigationItem.backBarButtonItem = backButton
        
        

    }
    
    
func loginButtonFacebookClicked() {
            let loginManager = LoginManager()
            loginManager.logIn(permissions: ["public_profile", "email"], from: self, handler: { result, error in
                if error != nil {
                    print("ERROR: Trying to get login results")
                } else if result?.isCancelled != nil {
                    print("The token is \(result?.token?.tokenString ?? "")")
                    if result?.token?.tokenString != nil {
                        print("Logged in")
                        //                        self.getUserProfile(token: result?.token, userId: result?.token?.userID)
                    } else {
                        print("Cancelled")
                    }
                }
            })
        }

    @IBAction func createAccountButtonPressed(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func signInButtonPressed(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func facebookButtonPressed(_ sender: UIButton) {
        loginButtonFacebookClicked()
    }
}
