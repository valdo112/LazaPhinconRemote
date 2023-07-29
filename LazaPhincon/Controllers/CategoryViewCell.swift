//
//  CategoryViewCell.swift
//  LazaPhincon
//
//  Created by Valdo Parlinggoman on 26/07/23.
//

import UIKit



class CategoryViewCell: UICollectionViewCell {
    
    @IBOutlet weak var categorylabel: UILabel!{
        didSet{
            categorylabel.font = UIFont(name: "Inter-Medium", size: 15)
        }
    }
    
}
