//
//  ViewController.swift
//  MoviesList
//
//  Created by Kostiantyn Kaniuka on 31.08.2022.
//

import OrderedCollections
import UIKit

final class MoviesListViewController: UIViewController {
    //MARK: - Outlets
    @IBOutlet var titleTextField: UITextField! {
        didSet {
            titleTextField.delegate = self
        }
    }
    @IBOutlet var yearTextField: UITextField! {
        didSet {
            yearTextField.delegate = self
        }
    }
    @IBOutlet var moviesTableView: UITableView! {
        didSet {
            moviesTableView.dataSource = self
            moviesTableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil),
                                     forCellReuseIdentifier: idCell)
        }
    }
    
    //MARK: - Properties
    private let idCell = "MoviesCell"
    private var moviesSet = OrderedSet<Movies>()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Action
    @IBAction func addToList(_ sender: Any) {
        let model = Movies(name: titleTextField.text ?? "", releaseDate:
                            Int(yearTextField.text ?? "") ?? 0)
        if moviesSet._customContainsEquatableElement(model) == false {
            moviesSet.insert(model, at: 0)
            moviesTableView.beginUpdates()
            moviesTableView.insertRows(at: [IndexPath(row: moviesSet.count-1,
                                                      section: 0)], with: .automatic)
            moviesTableView.reloadSections(IndexSet(integer: 0), with: .automatic)
            moviesTableView.endUpdates()
        }
    }
}

//MARK: - TableViewDataSource
extension MoviesListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesSet.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idCell) as? CustomTableViewCell
        cell?.cellLabel?.text = "\(moviesSet[indexPath.row].name) \(moviesSet[indexPath.row].releaseDate)"
        return cell!
    }
}

//MARK: - Text Fields Delegate
extension MoviesListViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        textField.isSelected = false
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.isSelected = true
        if textField == titleTextField {
            titleTextField.text = ""
        }
        if textField == yearTextField {
            yearTextField.text = ""
        }
    }
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        if textField == yearTextField {
            let invalidCharacters =
            CharacterSet(charactersIn: "0123456789").inverted
            return (string.rangeOfCharacter(from: invalidCharacters) == nil)
        }
        return true
    }
}
