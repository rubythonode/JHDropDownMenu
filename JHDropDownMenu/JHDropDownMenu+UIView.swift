//
//  JHDropDownMenu+UIView.swift
//  JHDropDownMenu
//
//  Created by tokijh on 2018. 4. 12..
//  Copyright © 2018년 tokijh. All rights reserved.
//

import UIKit

public extension UIView {
    private struct AssociatedKeys {
        static var dropdown: UInt8 = 0
    }
    
    public func getDropDown<T>(_ object: T.Type) -> JHDropDownMenu<T> {
        if let dropdown = objc_getAssociatedObject(self, &AssociatedKeys.dropdown) as? JHDropDownMenu<T> {
            return dropdown
        } else {
            let dropdown = JHDropDownMenu<T>(view: self)
            objc_setAssociatedObject(self, &AssociatedKeys.dropdown, dropdown, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            return dropdown
        }
    }
}
