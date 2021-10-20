//
//  PostsTableViewController.swift
//  Persistence
//
//  Created by Sean Jones on 10/18/21.
//

import UIKit

class PostsTableViewController: UITableViewController {

    //MARK: - PROPERTIES
    
    var posts: [Post] = []
    static let postsKey = "posts"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkCache(using: PostsTableViewController.postsKey)

        
    }
    
    func fetchPosts() {
        PostController.fetchPosts(){ (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let posts):
                    self.posts = posts
                    self.tableView.reloadData()
                    self.savePosts(posts: posts)
                case .failure(let error):
                    print(error.localizedDescription)
                        
                }
            }
        }
    
        
    }
    
    func savePosts(posts: [Post]) {
        try? DiskStorage.save(withKey: PostsTableViewController.postsKey, value: posts)
        
    }
    
    func checkCache(using key: String) {
        guard let posts: [Post] = try? DiskStorage.read(fromKey:key, using: FileManager.default) else {
            fetchPosts()
            return
        }
        for post in posts {
            self.posts.append(post)
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return posts.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath)
        let post = posts[indexPath.row]
        cell.textLabel?.text = post.title
        return cell
    }
   

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
