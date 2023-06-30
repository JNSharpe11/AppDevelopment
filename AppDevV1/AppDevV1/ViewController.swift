//
//  ViewController.swift
//  AppDevV1
//
//  Created by John Sharpe on 4/23/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    //may need to implement collectionView.datasource = self
    
    //MARK: Section Definition
    
    enum Section: Hashable {
        case promoted
        case standard(String)
        
    }
    
    enum SupplementaryViewKind {
        static let header = "header"
        static let topLine = "topLine"
        static let bottomLine = "bottomLine"
        
    }
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    
    var sections = [Section]()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Mark: Collection View Setup
        
        collectionView.collectionViewLayout = createLayout()
        
        collectionView.register(FuturesCollectionViewCell.self, forCellWithReuseIdentifier: FuturesCollectionViewCell.reuseIdentifier)
        
        collectionView.register(StandardAppCollectionViewCell.self, forCellWithReuseIdentifier: StandardAppCollectionViewCell.reuseIdentifer)
        
        configureDataSource()
        
        collectionView.register(SectionHeaderView.self, forSupplementaryViewOfKind: SupplementaryViewKind.header, withReuseIdentifier: SectionHeaderView.reuseIdentifier)
        
        collectionView.register(LineView.self, forSupplementaryViewOfKind: SupplementaryViewKind.topLine, withReuseIdentifier: LineView.reuseIdentifier)
        
        collectionView.register(LineView.self, forSupplementaryViewOfKind: SupplementaryViewKind.bottomLine, withReuseIdentifier: LineView.reuseIdentifier)
        
        collectionView.delegate = self
        
    }
    
    func createLayout() -> UICollectionViewLayout {
        
        let layout = UICollectionViewCompositionalLayout
        { (sectionIndex, layoutEnvironment) ->
            NSCollectionLayoutSection? in
            let section = self.sections[sectionIndex]
            
            let headerItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.92), heightDimension: .estimated(44))
            
            let headerItem = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerItemSize, elementKind: SupplementaryViewKind.header, alignment: .top)
            headerItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 4, bottom: 0, trailing: 4)
            
            let lineItemHeight = 1/layoutEnvironment.traitCollection.displayScale
            
            let lineItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.92), heightDimension: .absolute(lineItemHeight))
            
            let topLineItem = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: lineItemSize, elementKind: SupplementaryViewKind.topLine, alignment: .top)
            
            let bottomLineItem = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: lineItemSize, elementKind: SupplementaryViewKind.bottomLine, alignment: .bottom)
            
            let supplementaryItemContentInsets = NSDirectionalEdgeInsets(top: 0, leading: 4, bottom: 0, trailing: 4)
            
            headerItem.contentInsets = supplementaryItemContentInsets
            topLineItem.contentInsets = supplementaryItemContentInsets
            bottomLineItem.contentInsets = supplementaryItemContentInsets
            
            switch section {
                
            case .promoted:
                
                // MARK: PROMOTED SECTION LAYOUT
                
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 4, bottom: 0, trailing: 4)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .estimated(200))
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .groupPagingCentered
                
                section.boundarySupplementaryItems = [topLineItem, bottomLineItem]
                
                section.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 0, bottom: 20, trailing: 0)
                
                return section
                
                
            case .standard:
                
                //MARK: STANDARD SECTION LAYOUT
                
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/2))
                
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 4, bottom: 0, trailing: 4)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.92), heightDimension: .estimated(250))
                
                let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 2)
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .groupPagingCentered
                section.boundarySupplementaryItems = [headerItem]
                
                section.boundarySupplementaryItems = [headerItem, bottomLineItem]
                
                section.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 0, bottom: 20, trailing: 0)
                
                return section
                /*
            case .categories:
                
                //MARK: CATEGORIES SECTION LAYOUT
                
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let availableLayoutWidth = layoutEnvironment.container.effectiveContentSize.width
                let groupWidth = availableLayoutWidth * 0.92
                let remainingWidth = availableLayoutWidth - groupWidth
                let halfOfRemainingWidth = remainingWidth / 2.0
                let nonCategorySectionItemInset = CGFloat(4)
                let itemLeadingAndTrailingInset = halfOfRemainingWidth + nonCategorySectionItemInset
                
                item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: itemLeadingAndTrailingInset, bottom: 0, trailing: itemLeadingAndTrailingInset)
                
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(44))
                
                let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
                
                
                let section = NSCollectionLayoutSection(group: group)
                
                return section
                */
            //default:
                //fatalError("something went wrong")
                
            }
        }
        return layout
        
    }
    
    
    func configureDataSource() {
        
        
        // MARK: Data Source Initialization
        
        dataSource = .init(collectionView: collectionView, cellProvider: {
            (collectionView, indexPath, item) ->
            UICollectionViewCell? in
            
            let section = self.sections[indexPath.section]
            
            self.dataSource.supplementaryViewProvider = { collectionView, kind, indexPath -> UICollectionReusableView? in
                
                switch kind {
                case SupplementaryViewKind.header:
                    
                    let section = self.sections[indexPath.section]
                    let sectionName: String
                    
                    //let sectionName: String
                    
                    switch section {
                        
                    case .promoted:
                        return nil
                        
                    case .standard(let name):
                        sectionName = name
                        
                    }
                    
                    
                    

                    
                    let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: SupplementaryViewKind.header, withReuseIdentifier: SectionHeaderView.reuseIdentifier, for: indexPath) as!
                    SectionHeaderView
                    headerView.setTitle(sectionName)
                    
                    return headerView
                    
                case SupplementaryViewKind.topLine, SupplementaryViewKind.bottomLine:
                    let lineView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: LineView.reuseIdentifier, for: indexPath) as! LineView
                    
                    return lineView
                    
                    
                default:
                    return nil
                    
                }
                
            }
            
            switch section {
                
            case .promoted:
                
                let stockDataSource: [String] = ["DOW", "S&P", "NASDAQ"]
                
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FuturesCollectionViewCell.reuseIdentifier, for: indexPath) as!
                FuturesCollectionViewCell
                
                cell.configureCell(item.app!)
                
                //This is from the video to include labels
                
                return cell
                
            case .standard:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StandardAppCollectionViewCell.reuseIdentifer, for: indexPath) as! StandardAppCollectionViewCell
                
                let isThirdItem = (indexPath.row + 1).isMultiple(of: 3)
                cell.configureCell(item.app!, hideBottomLine: isThirdItem)
                
                return cell
                
            }
            
            
        })
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.promoted])
        snapshot.appendItems(Item.futuresApps, toSection: .promoted)
        
        let ShortAndLongPosition = Section.standard("Shorts and Longs")
        let BitCoinPosition = Section.standard("BitCoin")
        
        snapshot.appendSections([ShortAndLongPosition, BitCoinPosition])
        
        snapshot.appendItems(Item.ShortsAndLongsApps, toSection: ShortAndLongPosition)
        snapshot.appendItems(Item.BitCoinApps, toSection: BitCoinPosition)
        
        
        
        sections = snapshot.sectionIdentifiers
        dataSource.apply(snapshot)
        
    }
    
    
    //applying from the second video source
    
    //may not need numberOfItemsInSection bc we declare the number of items in Item doc
    /*
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return dataSource.accessibilityElementCount()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) {
        
        var FuturesCollectionViewCell = UICollectionViewCell()
        
        if let stockCell = collectionView.dequeueReusableCell(withReuseIdentifier: "FuturesCollectionViewCell", for: indexPath) as? UICollectionViewCell {
            
            stockCell.configure(with: stockDataSource[indexPath.row])
            
            FuturesCollectionViewCell = stockCell
            
        }
        
        return FuturesCollectionViewCell
        
    }
    */


}

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let layout = UICollectionViewFlowLayout()
        let controller = CollectionViewController(collectionViewLayout: layout)
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
