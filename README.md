#Versio [![npm version](https://badge.fury.io/js/versio.svg)](http://badge.fury.io/js/versio)

Versio is simple lightweight version matching utility.

## Installation
```sh
$ npm install versio
```

## Usage

**Initialization**
```javascript
Versio = require("versio");
```

**Comparing**

```javascript
Versio.same("1.2.3", "1.2.3"); // => true
Versio.same("2.1.3", "1.2.3"); // => false
Versio.same("1.2.x", "1.2.9"); // => true

Versio.lower("1.2.3", "2.2.3"); // => true
Versio.lower("2.3.4", "2.3.3"); // => false

Versio.higher("1.2.3", "1.2.2"); // => true
Versio.higher("1.1.1", "1.1.1"); // => false
```

**Getting differences**
> delta basically returns whats the difference for every version segment

```javascript
Versio.delta("1.2.3", "2.5.1"); // => [1, 3, -2]
Versio.delta("2.2.2", "2.2.3"); // => [0, 0, -1]
Versio.delta("1.2.3", "2.3.4"); // => [1, 1, 1]

Versio.delta("1.2.8", "0.x.x"); // => [1, 0, 0]
```
