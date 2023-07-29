//
//  HomeViewController.swift
//  LazaPhincon
//
//  Created by Valdo Parlinggoman on 26/07/23.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    private var category = Categories()
    private var network = Network()
    private var products: Products?
    private var allProducts = AllProducts()
    
    
    @IBOutlet weak var collectionView2: UICollectionView!
    @IBOutlet weak var collectionView1: UICollectionView!
    @IBOutlet weak var subtitleLabel: UILabel!{
        didSet{
            subtitleLabel.text = "Welcome to Laza."
            subtitleLabel.font = UIFont(name: "Inter-Regular", size: 15)
        }
    }
    @IBOutlet weak var headLabel: UILabel!{
        didSet{
            headLabel.text = "Hello"
            headLabel.font = UIFont(name: "Inter-SemiBold", size: 28)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "CategoryViewCell", bundle: nil)
        collectionView1.register(nib, forCellWithReuseIdentifier: "CategoryViewCell")
        collectionView1.delegate = self
        collectionView1.dataSource = self
        
        let nib2 = UINib(nibName: "ProductsViewCell", bundle: nil)
        collectionView2.register(nib2, forCellWithReuseIdentifier: "ProductsViewCell")
        collectionView2.delegate = self
        collectionView2.dataSource = self
        
//        UserDefaults.standard.set(false, forKey: "USERISLOGGEDIN")
//        self.navigationController?.popToRootViewController(animated: true)
        
        network.fetchAPICategory { category in
            self.category.append(contentsOf: category)
            self.collectionView1.reloadData()
        }
        network.fetchAPIProducts { products in
            self.allProducts.append(contentsOf: products)
            self.collectionView2.reloadData()
            print("DATA= ", products)
        }
        print(allProducts.count)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionView1{
            return category.count
        }
        return allProducts.count
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionView1{
            let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryViewCell", for: indexPath) as! CategoryViewCell
            cell1.categorylabel.text = self.category[indexPath.row]
            return cell1
        }
        let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductsViewCell", for: indexPath) as! ProductsViewCell
        cell2.productLabel.text = self.allProducts[indexPath.row].title
        cell2.productPrice.text = "\(self.allProducts[indexPath.row].price)"
        return cell2
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let flowayout = collectionViewLayout as? UICollectionViewFlowLayout
        let space: CGFloat = (flowayout?.minimumInteritemSpacing ?? 0.0) + (flowayout?.sectionInset.left ?? 0.0) + (flowayout?.sectionInset.right ?? 0.0)
        let size:CGFloat = (collectionView.frame.size.width - space) / 2.0
        return CGSize(width: size, height: size)
    }
    
    
}
