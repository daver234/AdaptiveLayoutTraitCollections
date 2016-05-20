/*
* Copyright (c) 2015 Razeware LLC
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
*/

import UIKit

struct Panorama {
  let title: String
  let imageName: String
}

class ImagesTableViewController: UITableViewController {
  let panoramas = [
    Panorama(title: "Felipe's vista", imageName: "felipe.jpg"),
    Panorama(title: "Greg on the roof", imageName: "greg.jpg"),
    Panorama(title: "Jamie's balcony", imageName: "jamie.jpg"),
    Panorama(title: "Marin's balcony", imageName: "marin.jpg"),
    Panorama(title: "Matt at the coast", imageName: "matt.jpg"),
  ]

  // MARK: - Table view data source

  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return panoramas.count
  }

  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell

    cell.textLabel?.text = panoramas[indexPath.row].title

    return cell
  }

  // MARK: - Navigation

  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if let destination = segue.destinationViewController as? ContainerViewController,
      let selectedIndexPath = tableView.indexPathForSelectedRow {
        let panorama = panoramas[selectedIndexPath.row]
        destination.panorama = panorama
    }
  }
}
