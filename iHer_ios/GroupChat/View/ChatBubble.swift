//
//  ChatBubble.swift
//  iHer_ios
//
//  Created by Dustin yang on 6/19/21.
//

import SwiftUI

struct ChatBubble: Shape {

    var corners: UIRectCorner
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: 13, height: 13))
        
        return Path(path.cgPath)
    }
}
