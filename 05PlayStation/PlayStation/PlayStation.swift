//
//  PlayStation.swift
//  PlayStation
//
//  Created by rave on 10/3/21.
//

import UIKit

class PlayStation: UIView {

    
    @IBOutlet weak var ProductName: UITextField!
    @IBOutlet var contentView: UIView!
    
    
     required init?(coder : NSCoder)
     {
         super.init(coder: coder)
         initSubviews()
     }
 
    override init( frame: CGRect)
    {
        super.init(frame: frame)
        initSubviews()
    }

    func initSubviews()
    {
        //standard initialization logic
        
        let nib = UINib(nibName:"PlayStation" , bundle: nil)
        nib.instantiate( withOwner: self, options: nil)
       contentView.frame = bounds
        addSubview(contentView)
    }
    
}
