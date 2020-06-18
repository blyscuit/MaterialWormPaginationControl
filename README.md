# MaterialWormPaginationControl
Pagination Control With Bar, Line, Worm, or whatever this called.

![](ezgif-2-3ac41bd66595.gif)

## Installation
Download and drag to project. [Download](https://github.com/blyscuit/MaterialWormPaginationControl/MaterialWormPaginationControl.swift)

## Usage
Subclass UIView on Storyboard or insert programmatically.
```
var paginationControl: MaterialWormPaginationControl! = MaterialWormPaginationControl()
///
addSubview()
```

## Customization
Customize like it's UIPageControl
```
paginationControl.numberOfPages = model.count
paginationControl.currentPage = 1
paginationControl.pageIndicatorTintColor = UIColor.red.withAlphaComponent(0.4)
paginationControl.currentPageIndicatorTintColor = UIColor.red
```
