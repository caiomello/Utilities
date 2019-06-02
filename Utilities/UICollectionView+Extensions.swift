//
//  UICollectionView+Extensions.swift
//  Utilities
//
//  Created by Caio Mello on 6/2/19.
//  Copyright © 2019 Caio Mello. All rights reserved.
//

import UIKit

extension UICollectionView {
    func registerCell<T: UICollectionViewCell>(_ cellClass: T.Type) {
        register(UINib(nibName: "\(T.self)", bundle: nil), forCellWithReuseIdentifier: "\(T.self)")
    }

    func dequeueCell<T: UICollectionViewCell>(forItemAt indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: "\(T.self)", for: indexPath) as! T
    }
}