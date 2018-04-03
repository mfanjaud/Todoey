//
//  ViewController.swift
//  Todoey
//
//  Created by Marion FANJAUD on 28/03/2018.
//  Copyright © 2018 Marion FANJAUD. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = [ItemDataModel]()
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = ItemDataModel()
        newItem.title = "Find Geoff"
        itemArray.append(newItem)
        
        let newItem2 = ItemDataModel()
        newItem2.title = "Hug Leo"
        itemArray.append(newItem2)
        
        let newItem3 = ItemDataModel()
        newItem3.title = "Kiss goodnight Sacha"
        itemArray.append(newItem3)
        
        if let items = defaults.array(forKey: "TodoListArray") as? [ItemDataModel] {
            itemArray = items
        }
      
    }

    // MARK - TableView DataSource Methods
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        cell.accessoryType = item.done ? .checkmark : .none
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    // MARK - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
        
        
    }
    
    // MARK - Add New items section
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textfield = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add item", style: .default){ (action) in
            
            let newItem = ItemDataModel()
            newItem.title = textfield.text!
            
            self.itemArray.append(newItem)
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            self.tableView.reloadData()
            
        }
        
        alert.addTextField{(alertTextField) in
            alertTextField.placeholder = "Create New Item"
            textfield = alertTextField
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    

}

