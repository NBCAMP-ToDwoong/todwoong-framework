//
//  TDCollectionViewController.swift
//  Example Project
//
//  Created by yen on 2/28/24.
//

import UIKit

import ToDwoong

class TDCollectionViewController: UIViewController {
    
    // MARK: - Properties
    
    let dummyData = [
        TodoModel(id: "1", title: "프레임워크 마무리", place: nil, dueDate: nil, dueTime: nil, isCompleted: false, placeAlarm: false, timeAlarm: false, category: "식당"),
        TodoModel(id: "2", title: "프레임워크 마무리", place: nil, dueDate: Date(), dueTime: nil, isCompleted: false, placeAlarm: false, timeAlarm: false, category: nil),
        TodoModel(id: "3", title: "프레임워크 마무리", place: nil, dueDate: Date(), dueTime: Date(), isCompleted: false, placeAlarm: false, timeAlarm: true, category: "직장"),
        TodoModel(id: "4", title: "프레임워크 마무리", place: "경기도 수원시 팔달구 경수대로 420", dueDate: Date(), dueTime: Date(), isCompleted: false, placeAlarm: true, timeAlarm: false, category: nil),
        TodoModel(id: "5", title: "프레임워크 마무리", place: "경기도 수원시 팔달구 경수대로 420", dueDate: Date(), dueTime: Date(), isCompleted: false, placeAlarm: true, timeAlarm: true, category: "학교")
    ]
    
    // MARK: - UI Properties
    
    private var collectionView: UICollectionView?
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray2
        
        setCollectionView()
        setLayout()
    }
}

// MARK: - Extensions

extension TDCollectionViewController {
    func setCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize // 셀 크기 자동 조절 활성화
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView?.register(TDCollectionViewCell.self, forCellWithReuseIdentifier: TDCollectionViewCell.identifier)
        
        collectionView?.backgroundColor = .systemGray2
        
        collectionView?.dataSource = self
        collectionView?.delegate = self
    }
    
    func setLayout() {
        guard let collectionView = collectionView else {
            return
        }
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TDCollectionViewCell.identifier, for: indexPath) as? TDCollectionViewCell else {
            fatalError("Cannot create new cell")
        }
        
        cell.onCheckButtonTapped = {
            print("Check button tapped in row \(indexPath.row)")
        }
        
        cell.configure(data: dummyData[indexPath.row])
        
        return cell
    }
}

extension TDCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 100)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}


extension TDCollectionViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Section.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dummyData.count
    }
}

extension TDCollectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected item at \(indexPath.item)")
    }
}
