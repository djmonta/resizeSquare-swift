//
//  UIImage+Cropping.swift
//  resizeSquare
//
//  Created by 宮本幸子 on 2014/09/24.
//  Copyright (c) 2014年 Sachiko Miyamoto. All rights reserved.
//

import UIKit

extension UIImage {
    
    func resizeSquare(resizeX: CGFloat = 260) -> UIImage {
        
        let srcW = self.size.width
        let srcH = self.size.height
        
        var dstW = CGFloat()
        var dstH = CGFloat()
        
        var srcX = CGFloat()
        var srcY = CGFloat()
        
        var magnify = CGFloat()
        
        if (srcH > resizeX && srcH > resizeX) {
            println("LargeImage")
            magnify = (srcH > srcW) ? (resizeX / srcW) : (resizeX / srcH)
            dstW = srcW * magnify
            dstH = srcH * magnify
//            println(dstW)
//            println(dstH)
        } else if (srcW <= resizeX && srcH <= resizeX) {
            println("SmallImage")
            magnify = (srcH > srcW) ? (resizeX / srcW) : (resizeX / srcH)
            dstW = srcW * magnify
            dstH = srcH * magnify
        } else {
            println("Your thumbnail options are set incorrectly.")
        }
        
        var resizedImage = self.resizeImage(dstW, height: dstH)
        
        srcX = -((dstW / 2) - (resizeX / 2))
        srcY = -((dstH / 2) - (resizeX / 2))
        
        var mainScreen = UIScreen()
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(resizeX, resizeX), false, mainScreen.scale)
        var context = UIGraphicsGetCurrentContext()
        
        resizedImage.drawAtPoint(CGPointMake(srcX, srcY))
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        
        //CGContextRelease(context)
        UIGraphicsEndImageContext()
        
        return newImage
    }

    func resizeImage(width: CGFloat, height: CGFloat) -> UIImage {
        var oldWidth: CGFloat = self.size.width
        var oldHeight: CGFloat = self.size.height
        
        var scaleFactor = (oldWidth > oldHeight) ? width / oldWidth : height / oldHeight
        
        var newHeight: CGFloat = oldHeight * scaleFactor
        var newWidth: CGFloat = oldWidth * scaleFactor
        
        var mainScreen = UIScreen()
        if (mainScreen.scale >= 2.0){
            UIGraphicsBeginImageContextWithOptions(CGSizeMake(newWidth, newHeight), false, mainScreen.scale)
        } else {
            UIGraphicsBeginImageContext(CGSizeMake(newWidth, newHeight))
        }

        self.drawInRect(CGRectMake(0, 0, newWidth, newHeight))
        
        var newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    
    }
    
}
