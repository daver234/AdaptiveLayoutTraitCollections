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

class ImageViewController: UIViewController {

  @IBOutlet weak var scrollView: UIScrollView!
  var imageView: UIImageView!
  var imageName: String?

  override func viewDidLoad() {
    super.viewDidLoad()
    
    imageView = UIImageView()
    scrollView.addSubview(imageView)
  }

  override func viewWillAppear(animated: Bool) {
    super.viewDidAppear(animated)

    if imageView.image == nil {
      if let imageName = imageName, let image = UIImage(named: imageName) {
        imageView.image = image
        imageView.sizeToFit()
        scrollView.contentSize = image.size
      }
    }
  }

  override func viewDidLayoutSubviews() {
    resetZoomScale()
  }

  func resetZoomScale() {
    guard let image = imageView.image else { return }
    
    var zoomScale: CGFloat = 1.0
    var contentOffset = CGPoint.zero
    
    if traitCollection.verticalSizeClass == .Compact {
      zoomScale = CGRectGetWidth(view.frame) / image.size.width
      let verticalSpace = (CGRectGetHeight(view.frame) - (image.size.height * zoomScale)) / 2
      contentOffset = CGPoint(x: 0, y: -verticalSpace)
      scrollView.scrollEnabled = false
    } else {
      zoomScale = CGRectGetHeight(view.frame) / image.size.height
      scrollView.scrollEnabled = true
    }
    
    scrollView.minimumZoomScale = zoomScale
    scrollView.maximumZoomScale = zoomScale
    scrollView.zoomScale = zoomScale
    scrollView.contentOffset = contentOffset
  }
}

extension ImageViewController: UIScrollViewDelegate {
  func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
    return imageView
  }
}
