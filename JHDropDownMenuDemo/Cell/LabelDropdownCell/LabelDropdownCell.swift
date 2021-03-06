//
//  LabelDropdownCell.swift
//  JHDropDownMenuDemo
//
//  Created by tokijh on 2018. 4. 24..
//  Copyright © 2018년 윤중현. All rights reserved.
//

import UIKit
import JHDropDownMenu

class LabelDropdownCell: UITableViewCell {

    static let Identifier = "LabelDropdownCell"
    static let IdentifierMultiSection = "LabelDropdownCellMultiSection"
    
    @IBOutlet weak var selectedLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func setup<T>(items: [T], cellView: @escaping ((T) -> UIView), placeHolder: String, selectedIndex: Int?, selectIndexHandler: ((Int) -> String?)? = nil) {
        selectedLabel.text = placeHolder
        let dropdown = selectedLabel.getDropDown(T.self)
        dropdown.set(items: items, cellView: cellView)
        if let selectIndexHandler = selectIndexHandler {
            dropdown.selectIndexHandler = { [weak self] in
                self?.selectedLabel.text = selectIndexHandler($0)
            }
        } else {
            dropdown.selectIndexHandler = { [weak self] in
                self?.selectedLabel.text = "\(items[$0])"
            }
        }
        dropdown.contentMode = .left
        dropdown.verticalOffset = 11
        dropdown.select(selectedIndex)
        if let selectedIndex = selectedIndex {
            dropdown.selectIndexHandler?(selectedIndex)
        }
    }
    
    func setup<T>(items: [[T]], cellView: @escaping ((T) -> UIView), sectionView: @escaping ((Int) -> UIView?), placeHolder: String, selectedIndexPath: IndexPath?, selectIndexPathHandler: ((IndexPath) -> String?)? = nil) {
        selectedLabel.text = placeHolder
        let dropdown = selectedLabel.getDropDown(T.self)
        dropdown.set(items: items, cellView: cellView, sectionView: sectionView)
        if let selectIndexPathHandler = selectIndexPathHandler {
            dropdown.selectIndexPathHandler = { [weak self] in
                self?.selectedLabel.text = selectIndexPathHandler($0)
            }
        } else {
            dropdown.selectIndexPathHandler = { [weak self] in
                self?.selectedLabel.text = "\(items[$0.section][$0.row])"
            }
        }
        dropdown.contentMode = .left
        dropdown.verticalOffset = 11
        dropdown.select(indexPath: selectedIndexPath)
        if let selectedIndexPath = selectedIndexPath {
            dropdown.selectIndexPathHandler?(selectedIndexPath)
        }
    }
}
