## [1.1.1] - [Septemper 15, 2019]
- allow us to make custom Radius [@Saifallak](http://github.com/saifallak/).
* BREAKING-CHANGE : borderRadious now takes BorderRadiusGeometry instead of double, so you have to change your implementations to something like this:
```dart
borderRadius: BorderRadius.all(Radius.circular(20)),
```

## [1.1.0] - [July 2, 2019]
* Added showBadge parameter to hide or show badge with animation

## [1.0.3] - [June 5, 2019]
* Fixed a bug when all the badges on the screen are animated if one of them is updated. Fixed only for badges that have Text or Icon in badge content. 

## [1.0.2] - [June 5, 2019]
* Updated versions in readme.

## [1.0.1] - [June 4, 2019]
* Updated readme images and lib description.

## [1.0.0] - [June 4, 2019]
* Badge class for creating badges for every widget.
