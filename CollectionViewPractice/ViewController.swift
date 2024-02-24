//
//  ViewController.swift
//  CollectionViewPractice
//
//  Created by 권정근 on 2/23/24.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Variables
    private var images: [UIImage] = []
    
    
    // MARK: - UI Components
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        // frame: .zero 의미는 origin and size 둘 다 0으로 준다 (= 초기화)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        
        // View와의 거리를 나타냄
        // view의 프레임 안에 특정 view의 레이아웃을 맞추도록 사용 
        
        // collectionView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        
        collectionView.alwaysBounceVertical = false
        
        collectionView.showsVerticalScrollIndicator = true

        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray
        
        for _ in 0...20 {
            images.append(UIImage(named: "avocado")!)
            images.append(UIImage(named: "banana")!)
            images.append(UIImage(named: "blueberry")!)
            images.append(UIImage(named: "cherry")!)
            images.append(UIImage(named: "kiwi")!)
            images.append(UIImage(named: "orange")!)
        }
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        view.addSubview(collectionView)
        configureConstraints()
    }
    
    private func configureConstraints() {
        
        let collectionViewConstraints = [
            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: self.view.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(collectionViewConstraints)
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell else { fatalError("ERROR")}
        
        cell.myImageView.image = self.images[indexPath.row]
        
        return cell
    }
}


extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size = (self.view.frame.width / 3) - 1.35
        return CGSize(width: size, height: size)
    }
    
    // Vertical Spacing
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    // Horizontail Spacing
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
}
