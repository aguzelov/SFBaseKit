//
//  UIStackView+ShowAndHideArrangedSubview.swift
//  SFBaseKit
//
//  Created by Aleksandar Gyuzelov on 15.02.21.
//  Copyright © 2021 Upnetix. All rights reserved.
//

import UIKit

extension UIStackView {
    
    func addAndShowArrangedSubview(_ view: UIView) {
        addArrangedSubview(view)
        view.isHidden = false
    }
    
    func removeAndHideArrangedSubview(_ view: UIView) {
        removeArrangedSubview(view)
        view.isHidden = true
    }
    
}
