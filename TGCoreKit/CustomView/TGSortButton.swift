//
//  TGSortButton.swift
//  Module_Base
//
//  Created by kim on 2024/9/24.
//

import UIKit

// 排序按钮
public class TGSortButton: UIButton {
    public enum Sort {
        case normal
        case descend
        case ascend
        
        var imageName: String {
            switch self {
            case .normal:
                "icon_lunzheng_paixu_moren"
            case .descend:
                "icon_lunzheng_paixu_die"
            case .ascend:
                "icon_lunzheng_paixu_zhang"
            }
        }
    }
    
    public private(set) var sort: Sort = .normal {
        didSet {
            setImage(UIImage(named: sort.imageName), for: .normal)
        }
    }
    
    public convenience init(with sort: Sort) {
        self.init(frame: .zero)
        self.sort = sort
        setImage(UIImage(named: sort.imageName), for: .normal)
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        changeState()
        super.touchesEnded(touches, with: event)
    }
    
    private func changeState() {
        switch sort {
        case .normal:
            self.sort = .descend
        case .descend:
            self.sort = .ascend
        case .ascend:
            self.sort = .descend
        }
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        let imageWidth = imageView?.bounds.width ?? .zero
        let titleWidth = titleLabel?.bounds.width ?? .zero

        imageEdgeInsets = UIEdgeInsets(top: 0, left: 2.5 + titleWidth, bottom: 0, right: -(titleWidth + 2.5))
        titleEdgeInsets = UIEdgeInsets(top: 0, left: -(imageWidth + 2.5), bottom: 0, right: imageWidth + 2.5)
    }
}
