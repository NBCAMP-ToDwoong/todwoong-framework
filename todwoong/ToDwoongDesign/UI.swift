//
//  UI.swift
//  todwoong
//
//  Created by yen on 2/28/24.
//

import UIKit

public class TDStyle {
    public static let font: Font = Font()
    public static let color: Color = Color()
}

public class TDButton {
    public static func chip(
        frame: CGRect = .zero,
        title: String,
        backgroundColor: UIColor
    ) -> CustomButton {
        return CustomButton(frame: frame, type: .chip, title: title, backgroundColor: backgroundColor)
    }
    
    public static func medium(
        frame: CGRect = .zero,
        title: String,
        backgroundColor: UIColor
    ) -> CustomButton {
        return CustomButton(frame: frame, type: .medium, title: title, backgroundColor: backgroundColor)
    }
    
    public static func full(
        frame: CGRect = .zero,
        title: String,
        backgroundColor: UIColor
    ) -> CustomButton {
        return CustomButton(frame: frame, type: .full, title: title, backgroundColor: backgroundColor)
    }
}
