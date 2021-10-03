//
//  UITableView+Extension.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 20/07/2021.
//

import UIKit


protocol CellIdentifiable {
    static var cellIdentifier: String { get }
}

extension CellIdentifiable where Self: UITableViewCell {
    // 2
    static var cellIdentifier: String {
        return String(describing: self)
    }
}

extension UITableView {
    
    // 1
    func dequeueReusableCell<T: UITableViewCell>() -> T   {
        // 2
        guard let cell = dequeueReusableCell(withIdentifier: T.cellIdentifier) as? T else {
            // 3
            fatalError("Error dequeuing cell for identifier \(T.cellIdentifier)")
        }

        return cell
    }
    func registerCell<T: UITableViewCell>(cell:T) {
        register(UINib(nibName: T.cellIdentifier, bundle: nil), forCellReuseIdentifier:  T.cellIdentifier)
        
    }
}
