//
//  DScrollView.swift
//  DScrollView
//
//  Created by Apple on 3/10/22.
//

import Foundation
public class DScrollView: UIScrollView {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        keyboardDismissMode = .interactive
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
