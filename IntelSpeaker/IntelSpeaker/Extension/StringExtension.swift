//
//  StringExtension.swift
//  FYHLive
//
//  Created by xiongzhengrui on 2018/3/23.
//  Copyright © 2018年 xiongzhengrui. All rights reserved.
//

import UIKit

extension String {
    func trim() -> String {
        return trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    func width(font: UIFont) -> CGFloat {
        let boundingBox = self.boundingRect(with: CGSize.zero,
                                            options: [.usesLineFragmentOrigin, .usesFontLeading],
                                            attributes: [NSAttributedStringKey.font: font],
                                            context: nil)
        return ceil(boundingBox.width)
    }
    
    func heightWithConstrainedWidth(width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(
            with: constraintRect,
            options: [.usesLineFragmentOrigin, .usesFontLeading],
            attributes: [NSAttributedStringKey.font: font],
            context: nil)
        return ceil(boundingBox.height)
    }
    
}


extension NSAttributedString {
    
    func heightWithConstrainedWidth(width: CGFloat) -> CGFloat {
        let constraintRect = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(
            with: constraintRect,
            options: .usesLineFragmentOrigin,
            context: nil)
        return ceil(boundingBox.height)
    }
    

    var SHA256Str: String {
//        let str = self.
        return ""
    }
    
}
