import Foundation

class LeftViewController: UITableViewController {
    var menuData = ["Option1", "Option2"]
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.blueColor()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView!, titleForHeaderInSection section: Int) -> String! {
        return ""
    }
    
    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return self.menuData.count
    }
    
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cellId:NSString = self.menuData[indexPath.row]
        var oldCell:AnyObject? = tableView.dequeueReusableCellWithIdentifier(cellId)
        var cell:UITableViewCell
        if oldCell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: cellId)
        } else {
            cell = oldCell as UITableViewCell
        }
        cell.textLabel.text = self.menuData[indexPath.row]
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        return cell
    }
    
    override func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        
    }
}