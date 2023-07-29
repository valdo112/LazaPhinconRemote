//
//  ViewController.swift
//  LazaPhincon
//
//  Created by Valdo Parlinggoman on 26/07/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var womenButton: UIButton!
    @IBOutlet weak var menButton: UIButton!
    @IBOutlet weak var subtitleLabel: UILabel!{
        didSet{
            subtitleLabel.text = "Create your individual & unique style and look amazing everyday."
            subtitleLabel.font = UIFont(name: "Inter-Regular", size: 15)
        }
    }
    @IBOutlet weak var titleLabel: UILabel!{
        didSet{
            titleLabel.text = "Look Good, Feel Good"
            titleLabel.font = UIFont(name: "Inter-SemiBold", size: 25)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //Buat liat user udah login apa belom
        if UserDefaults.standard.bool(forKey: "USERISLOGGEDIN") == true{
            //langsung pindahin user ke home
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TabBarController")
//            self.navigationController?.isNavigationBarHidden = true
            self.navigationController!.pushViewController(vc, animated: false)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
        self.navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.backIndicatorImage = nil
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = nil
        let backButton = UIBarButtonItem()
        backButton.title = ""
        backButton.image = UIImage(systemName: "arrow.backward.circle.fill")
        navigationItem.backBarButtonItem = backButton
    }
    
    func setupUI(){
        menButton.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.98, alpha: 1)
        menButton.setTitleColor(UIColor(red: 0.56, green: 0.58, blue: 0.62, alpha: 1), for: .normal)
        
        womenButton.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.98, alpha: 1)
        womenButton.setTitleColor(UIColor(red: 0.56, green: 0.58, blue: 0.62, alpha: 1), for: .normal)
    }
    
    @IBAction func womenButtonPressed(_ sender: UIButton) {
        womenButton.backgroundColor = UIColor(red: 0.59, green: 0.46, blue: 0.98, alpha: 1)
        womenButton.setTitleColor(.white, for: .normal)
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GetStartedViewController") as! GetStartedViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func menButtonPressed(_ sender: UIButton) {
        menButton.backgroundColor = UIColor(red: 0.59, green: 0.46, blue: 0.98, alpha: 1)
        menButton.setTitleColor(.white, for: .normal)
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GetStartedViewController") as! GetStartedViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func skipButton(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GetStartedViewController") as! GetStartedViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
