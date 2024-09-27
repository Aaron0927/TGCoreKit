//
//  UIColor+Extension.swift
//  TGCoreKit
//
//  Created by kim on 2024/8/14.
//

import UIKit

// MARK: - 增加初始化方法
@objc public extension UIColor {
    // 16进制创建
    @objc(initWithHex:alpha:)
    convenience init(hex: UInt32, alpha: CGFloat = 1) {
        let components = (
            R: CGFloat((hex >> 16) & 0xFF) / 255.0,
            G: CGFloat((hex >> 08) & 0xFF) / 255.0,
            B: CGFloat((hex >> 00) & 0xFF) / 255.0
        )
        self.init(red: components.R, green: components.G, blue: components.B, alpha: alpha)
    }
    
    @objc(colorWithHex:alpha:)
    static func hex(_ hex: UInt32, alpha: CGFloat = 1) -> UIColor {
        return UIColor(hex: hex, alpha: alpha)
    }
    
    // 为方便起见，仅处理 6 位 和 8 位字符串形式
    @objc(initWithHex:)
    convenience init(hex: String) {
        var hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if hexString.hasPrefix("#") {
            hexString = String(hexString.dropFirst()) // 去掉 #
        }
        
        if hexString.hasPrefix("0x") {
            hexString = String(hexString.dropFirst(2)) // 去掉 0x
        }
        
        // 获取 alpha
        var alpha: UInt32 = 255
        if hexString.count == 8 {
            let lastTwo = String(hexString.suffix(2)) // 获取最后两位
            hexString = String(hexString.dropLast(2)) // 移除最后两位
            Scanner(string: lastTwo).scanHexInt32(&alpha)
        }
        
        
        // 获取 RGB
        var color: UInt32 = 0
        Scanner(string: hexString).scanHexInt32(&color)
        
        let components = (
            R: CGFloat((color >> 16) & 0xFF) / 255.0,
            G: CGFloat((color >> 08) & 0xFF) / 255.0,
            B: CGFloat((color >> 00) & 0xFF) / 255.0
        )
        
        self.init(red: components.R, green: components.G, blue: components.B, alpha: CGFloat(alpha) / 255.0)
    }
    
    @objc(colorWithHex:)
    static func hex(_ hex: String) -> UIColor {
        return UIColor(hex: hex)
    }
    
    // 使用 0～255 的 RGB 值创建
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1.0)
    }
    
    // 随机颜色
    static var randomColor: UIColor {
        UIColor(r: CGFloat.random(in: 0..<255), g: CGFloat.random(in: 0..<255), b: CGFloat.random(in: 0..<255))
    }
    
    // 从 UIColor 中获取 RGBA 色值
    @nonobjc func rgbaValue() -> (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        // 获取 RGB 分量
        if self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) {
            return (red * 255, green * 255, blue * 255, alpha)
        } else {
            // 返回默认值
            return (0, 0, 0, 1)
        }
    }
}
