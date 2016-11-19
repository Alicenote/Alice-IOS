//
//  BaseCollectionView.swift
//  MyBaseProject
//
//  Created by Duong LD on 11/11/16.
//  Copyright © 2016 Duong LD. All rights reserved.
//

import UIKit

class BaseCollectionView: UIView {
    weak var delegate:BaseCollectionViewDelegate?
    lazy var collectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: CGRect(x: 0,y: 0,width: self.frame.width,height: self.frame.height), collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    
    var dataContentsForBaseCollectionView:[[AnyObject]]? {
        didSet{
            collectionView.reloadData()
        }
    }
    
    var registerClassForCell:[(nameClass: AnyClass, indentify: String)]? {
        didSet {
            for item:(nameClass: AnyClass,indentify: String) in (self.registerClassForCell)! {
                collectionView.register(item.nameClass, forCellWithReuseIdentifier: item.indentify)
            }
        }
    }
    
    var dataSizesForCell:[CGSize]?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(collectionView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func reload() {
        collectionView.reloadData()
    }
    
}

class BaseCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupData(data: AnyObject){}
}

protocol BaseCollectionViewDelegate:class {
    func didSelectedIndex(indexPath: IndexPath)
}

extension BaseCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectedIndex(indexPath: indexPath)
    }
}

extension BaseCollectionView: UICollectionViewDelegateFlowLayout {
    
}

extension BaseCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let infoClassForCell:(nameClass: AnyClass ,indentify: String) = registerClassForCell![indexPath.section]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: infoClassForCell.indentify, for: indexPath) as! BaseCollectionViewCell
        guard let data = dataContentsForBaseCollectionView?[indexPath.section][indexPath.row] else{
            return UICollectionViewCell()
        }
        cell.setupData(data: data as AnyObject)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView ,layout collectionViewLayout: UICollectionViewLayout ,sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let size = dataSizesForCell?[indexPath.section] else{
            return CGSize(width: 100, height: 100)
        }
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let count:Int = dataContentsForBaseCollectionView![section].count
        return count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        guard let count: Int = dataContentsForBaseCollectionView?.count else {
            return 0
        }
        return count
    }
}
