//
//  BaseCollectionViewWithHeaderSelection.swift
//  MyBaseProject
//
//  Created by DuongLD on 11/17/16.
//  Copyright © 2016 Duong LD. All rights reserved.
//

import UIKit

class BaseCollectionViewWithHeaderSelection:UIView, UIScrollViewDelegate{
    weak var delegate:BaseCollectionViewHeaderSelectionDelegate?
    weak var dataSource:BaseCollectionViewHeaderSelectionDataSource?
    var listPositionYSection:[CGFloat]?
    var listSectionView:[UIView]?
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var background:UIScrollView?
    func setupViews(){
        background = UIScrollView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        background!.delegate = self
        addSubview(background!)
    }
    
    func reloadData(){
        guard let countSection = dataSource?.countSection() else{
            return
        }
        listPositionYSection = [CGFloat]()
        listSectionView = [UIView]()
        var positionYForViewCurrent:CGFloat = 0
        for index:Int in 0...(countSection - 1){
            guard let sectionViewCell = dataSource?.sectionViewAtIndex(index: index) else{
                break
            }
            sectionViewCell.frame.origin.y = positionYForViewCurrent
            sectionViewCell.frame.origin.x = 0
            sectionViewCell.tag = index
            sectionViewCell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(BaseCollectionViewWithHeaderSelection.tapSection)))
            if index == 0 {
                addSubview(sectionViewCell)
            } else{
                background!.addSubview(sectionViewCell)
            }
            
            listSectionView!.append(sectionViewCell)
            listPositionYSection!.append(positionYForViewCurrent)
            positionYForViewCurrent = positionYForViewCurrent + sectionViewCell.frame.height
            
            guard let countItem = dataSource?.countItemInSection(index: index) else{
                break
            }
            if countItem != 0 {
                for indexItem:Int in 0...(countItem - 1){
                    guard let itemViewCell = dataSource?.itemViewAtIndexPath(indexPath: IndexPath(row: indexItem, section: index)) else {
                        break
                    }
                    itemViewCell.frame.origin.y = positionYForViewCurrent
                    itemViewCell.frame.origin.x = 0
                    itemViewCell.tag = indexItem
                    if index == 0 {
                        itemViewCell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(BaseCollectionViewWithHeaderSelection.tapItemWithSectionZero)))
                    }else {
                        itemViewCell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(BaseCollectionViewWithHeaderSelection.tapItemWithSectionOne)))
                    }
                    background!.addSubview(itemViewCell)
                    positionYForViewCurrent = positionYForViewCurrent + itemViewCell.frame.height
                }

            }
        }
        if positionYForViewCurrent < frame.height {
            background!.contentSize = CGSize(width: frame.width, height: frame.height)
        } else{
            background!.contentSize = CGSize(width: frame.width, height: positionYForViewCurrent)
        }
    }
    
    func tapItemWithSectionZero(sender: UITapGestureRecognizer){
        let indexItem = sender.view!.tag
        delegate?.didItemSelected(indexPath: IndexPath(row: indexItem, section: 0))
    }
    
    func tapItemWithSectionOne(sender: UITapGestureRecognizer){
        let indexItem = sender.view!.tag
        delegate?.didItemSelected(indexPath: IndexPath(row: indexItem, section: 1))
    }
    
    func tapSection(sender:UITapGestureRecognizer){
        let indexSection = sender.view!.tag
        delegate?.didSectionSelected(index: indexSection)
        if indexSection == 0 {
            background!.setContentOffset(CGPoint(x: 0, y: listPositionYSection![indexSection]), animated: true)
        } else{
            background!.setContentOffset(CGPoint(x: 0, y: listPositionYSection![indexSection] - listSectionView![indexSection].frame.height), animated: true)
        }
    }
    
    var indexSectionOnTopCurrent = 0
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        DispatchQueue.main.async {
            () -> Void in
            if self.background!.contentOffset.y < 0 {
                self.listSectionView![0].frame.origin.y = -self.background!.contentOffset.y
            } else {
                if self.listSectionView![0].frame.origin.y != 0 {
                    self.listSectionView![0].frame.origin.y = 0
                }
            }
            if self.listPositionYSection![1] < self.background!.contentOffset.y + self.listSectionView![0].frame.height{
                if self.subviews.count != 3 {
                    self.listSectionView![1].removeFromSuperview()
                    self.listSectionView![1].frame = CGRect(x: 0, y: self.listSectionView![0].frame.height, width: self.listSectionView![1].frame.width, height: self.listSectionView![1].frame.height)
                    self.background!.contentSize = CGSize(width: self.frame.width, height: self.background!.contentSize.height + self.listSectionView![1].frame.height)
                    self.addSubview(self.listSectionView![1])
                }
            } else{
                if self.subviews.count != 2 {
                    self.listSectionView![1].removeFromSuperview()
                    self.listSectionView![1].frame = CGRect(x: 0, y: self.listPositionYSection![1], width: self.listSectionView![1].frame.width, height: self.listSectionView![1].frame.height)
                    self.background!.contentSize = CGSize(width: self.frame.width, height: self.background!.contentSize.height - self.listSectionView![1].frame.height)
                    self.background!.addSubview(self.listSectionView![1])
                }
            }
        }
    }
}

protocol BaseCollectionViewHeaderSelectionDelegate:class{
    func didSectionSelected(index:Int)
    func didItemSelected(indexPath:IndexPath)
}

protocol BaseCollectionViewHeaderSelectionDataSource:class{
    func sectionViewAtIndex(index:Int) -> UIView
    func itemViewAtIndexPath(indexPath:IndexPath) -> UIView
    func countItemInSection(index:Int) -> Int
    func countSection()-> Int
}
