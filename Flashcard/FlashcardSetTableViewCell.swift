//
//  FlashcardSetTableViewCell.swift
//  Flashcard
//
//  Created by Vicki Yang on 12/8/20.
//

import UIKit

class FlashcardSetTableViewCell: UITableViewCell {
    
    private let containerView = UIView()
    private let term = UILabel()
    private let definition = UILabel()
    
    public var id : Int = 0

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        containerView.layer.backgroundColor = UIColor.white.cgColor
        containerView.clipsToBounds = true
        containerView.layer.masksToBounds = true
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .white
        contentView.addSubview(containerView)
        
        term.textColor = UIColor.black
        term.font = UIFont.systemFont(ofSize: 20)
        term.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(term)
        
        definition.textColor = UIColor.gray
        definition.font = UIFont.systemFont(ofSize: 18)
        definition.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(definition)
        
        setUpConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpConstraints(){
        
        let padding: CGFloat = 10
        
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo:contentView.centerXAnchor),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            term.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding),
            term.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding)
        ])
        
        NSLayoutConstraint.activate([
            definition.topAnchor.constraint(equalTo: term.bottomAnchor, constant: padding),
            definition.leadingAnchor.constraint(equalTo: term.leadingAnchor)
        ])
        
    }
    
    func configure(for set: FlashcardSet, index: Int){
        self.term.text = set.flashcards[index].term
        self.definition.text = set.flashcards[index].definition
        self.id = set.id
    }
    
}
