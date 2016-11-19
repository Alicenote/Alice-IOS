//
//  BaseCollectionViewWithContextMenu.swift
//  MyBaseProject
//
//  Created by Duong LD on 11/14/16.
//  Copyright © 2016 Duong LD. All rights reserved.
//

import UIKit

class BaseCollectionViewWithContextMenu:UIView {
    weak var delegate:BaseCollectionViewWithContextMenuDelegate?
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var backgroundScrollView:UIScrollView?
    func setupViews(){
        backgroundScrollView = {
            let s = UIScrollView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
            return s
        }()
        addSubview(backgroundScrollView!)
    }
    
    var listSubView:[UIView]?
    func reloadData(listSubView:[UIView]){
        self.listSubView = listSubView
        var yPositionItemCurrent:CGFloat = 0
        for index in 0...(listSubView.count - 1) {
            listSubView[index].frame = CGRect(x: 0, y: yPositionItemCurrent, width: listSubView[index].frame.width, height: listSubView[index].frame.height)
            yPositionItemCurrent = yPositionItemCurrent + listSubView[index].frame.height
            listSubView[index].tag = index
            listSubView[index].addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(BaseCollectionViewWithContextMenu.tapSubView)))
            backgroundScrollView!.addSubview(listSubView[index])
        }
        backgroundScrollView!.contentSize = CGSize(width: backgroundScrollView!.frame.width, height: yPositionItemCurrent)
    }
    
    var contextMenuView:UIView?
    func setupContextMenuView(contextMenuView:UIView){
        self.contextMenuView = contextMenuView
        contextMenuView.alpha = 0
        backgroundScrollView!.addSubview(contextMenuView)
    }
    
    var indexSelected = 0
    func tapSubView(sender:UITapGestureRecognizer) {
        let index:Int = sender.view!.tag
        if indexSelected == index{
            if isShowContextMenu {
                closeContextMenuAtIndex(index: index)
            }else {
                showContextMenuAtIndex(index: index)
            }
        }else {
            if isShowContextMenu {
                closeContextMenuAtIndex(index: indexSelected)
                showContextMenuAtIndex(index: index)
                
            }else {
                showContextMenuAtIndex(index: index)
            }
        }
        indexSelected = index
    }
    
    var isShowContextMenu = false
    func closeContextMenuAtIndex(index:Int){
        if index < listSubView!.count - 1 {
            for indexItem in (index+1)...(listSubView!.count - 1){
                listSubView![indexItem].frame.origin.y = listSubView![indexItem].frame.origin.y - contextMenuView!.frame.height + 5
            }
        }
        backgroundScrollView!.contentSize = CGSize(width: frame.width, height: backgroundScrollView!.contentSize.height - contextMenuView!.frame.height + 5)
        contextMenuView!.alpha = 0
        isShowContextMenu = false
    }
    
    func showContextMenuAtIndex(index:Int){
        var yPositionContextMenu:CGFloat = 0
        yPositionContextMenu = listSubView![index].frame.origin.y + listSubView![index].frame.height
        contextMenuView!.frame.origin.y = yPositionContextMenu - 5
        if index < listSubView!.count - 1{
            for indexItem in (index+1)...(listSubView!.count - 1){
                listSubView![indexItem].frame.origin.y = listSubView![indexItem].frame.origin.y + contextMenuView!.frame.height - 5
            }
        }
        backgroundScrollView!.contentSize = CGSize(width: frame.width, height: backgroundScrollView!.contentSize.height + contextMenuView!.frame.height - 5)
        if checkNeedScrollForContextMenu() {
            backgroundScrollView!.setContentOffset(CGPoint(x: 0, y: contextMenuView!.frame.origin.y - (frame.height - contextMenuView!.frame.height)), animated: true)
        }
        contextMenuView!.alpha = 1
        isShowContextMenu = true
    }
    
    func checkNeedScrollForContextMenu()->Bool{
        let yPositionAsSelf = contextMenuView!.frame.origin.y - backgroundScrollView!.contentOffset.y
        if (frame.height - yPositionAsSelf) < contextMenuView!.frame.height {
            return true
        }
        return false
    }
}

protocol BaseCollectionViewWithContextMenuDelegate:class {
    func viewAtIndexpath(indexPath:IndexPath) -> UIView
}
