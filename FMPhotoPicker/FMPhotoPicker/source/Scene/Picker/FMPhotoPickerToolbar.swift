//
//  FMPhotoPickerToolbar.swift
//  FMPhotoPicker
//
//  Created by Anto-Yang on 3/7/24.
//  Copyright © 2024 Cong Nguyen. All rights reserved.
//

import UIKit

class FMPhotoPickerToolbar: UIToolbar {
    lazy var deleteBtn: UIBarButtonItem = {
        return UIBarButtonItem(barButtonSystemItem: .trash,
                               target: self,
                               action: nil)
    }()
    
    lazy var shareBtn: UIBarButtonItem = {
        return UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"),
                               style: .plain,
                               target: self, action: nil)
    }()
    
    var deleteBtnAction: (() -> Void)?
    var shareBtnAction: (() -> Void)?
    
    
    /// 사진 지우기, 공유하기를 제공할 Toolbar를 init한다.
    /// - Parameters:
    ///   - deleteBtnAction: 삭제 버튼 클릭시 수행할 클로저
    ///   - shareBtnAction: 공유 버튼 클릭시 수행할 클로저
    convenience init(deleteBtnAction: (() -> Void), shareBtnAction: () -> Void) {
        self.init()
        initView()
    }
    
    private init() {
        super.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    func initView() {
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let barItems = [deleteBtn, flexibleSpace, shareBtn]
        setItems(barItems, animated: false)
        updateConstraintsIfNeeded()
    }
    
    @objc func didTapDeleteBtn() {
        deleteBtnAction?()
    }
    
    @objc func didTapShareBtn() {
        shareBtnAction?()
    }
}
