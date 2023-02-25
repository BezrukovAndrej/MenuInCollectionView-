//
//  ViewController.swift
//  MenuInCollectionView
//
//  Created by Andrey Bezrukov on 25.02.2023.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let imageNames: [String] = Array(0...14).map{ "\($0)"}
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.backgroundColor = .systemBackground
        collectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: ImageCollectionViewCell.indetifir)
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
    
    // MARK: - Collection View
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.indetifir, for: indexPath) as? ImageCollectionViewCell else {
            fatalError()
        }
        cell.imageView.image = UIImage(named: imageNames[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.size.width/2)-4, height: (view.frame.size.width/2)-5)
    }
    
    func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemsAt indexPaths: [IndexPath], point: CGPoint) -> UIContextMenuConfiguration? {
        
        let config = UIContextMenuConfiguration(
            identifier: nil, previewProvider: nil)
        { _ in
            
            let open = UIAction(title: "Open", image: UIImage(systemName: "link"), identifier: nil , discoverabilityTitle: nil, state: .off) { _ in
                print("Tapped open")
            }
            let copy = UIAction(title: "Copy", image: UIImage(systemName: "doc.on.doc"), identifier: nil , discoverabilityTitle: nil, state: .off) { _ in
                print("Tapped open")
            }
            let send = UIAction(title: "Send", image: UIImage(systemName: "paperplane"), identifier: nil , discoverabilityTitle: nil, state: .off) { _ in
                print("Tapped open")
            }
            let save = UIAction(title: "Seve", image: UIImage(systemName: "square.and.arrow.down"), identifier: nil , discoverabilityTitle: nil, state: .off) { _ in
                print("Tapped open")
            }
            let favorite = UIAction(title: "Favorite", image: UIImage(systemName: "star"), identifier: nil , discoverabilityTitle: nil, state: .off) { _ in
                print("Tapped open")
            }
                
                return UIMenu(
                title: "",
                image: nil,
                identifier: nil,
                options: UIMenu.Options.displayInline,
                children: [open, copy, send, save, favorite]
                )
            }
        return config
    }
}

class ImageCollectionViewCell: UICollectionViewCell {
    static let indetifir = "ImageCollectionViewCell"
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
}
