//
//  ExtensionUIView.swift
//  LazaPhincon
//
//  Created by Valdo Parlinggoman on 26/07/23.
//

import UIKit

extension UIView{
    @IBInspectable var cornerRadius: CGFloat{
        get{ return cornerRadius }
        set{
            self.layer.cornerRadius = newValue
        }
    }
    @IBInspectable var borderWidth: CGFloat{
        get{ return borderWidth }
        set{
            self.layer.borderWidth = newValue
        }
    }
}
