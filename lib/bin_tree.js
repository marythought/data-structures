var NullBinTree = function(){
  this.val = null;
}

NullBinTree.prototype.count = function(){
  return 0;
}

var BinTree = function(val, l, r){
  this.val = val;
  this.l = l || new NullBinTree();
  this.r = r || new NullBinTree();
};

BinTree.prototype.count = function(){
  // decendents
  return this.left.count() + this.right.count() + 1;
};

BinTree.prototype.push = function(val){
  if ( !this.left instanceof NullBinTree ){
    this.left = new BinTree(val);
  } else if (this.right instanceof NullBinTree){
    this.right = new BinTree(val);
  } else if (this.left.count() <= this.right.count()){
    this.l.push(val);
  } else
    this.r.push(val);
  };
};

// "i am root"

//bad count
  // var count = this.count();
  // if(count == 0){
  //   this.l = new BinTree(val)
  // };
  // if(count == 1){
  //   this.r new BinTree(val)
  // };
  // if(count == 2){
  //   if (this.left.count() == 2){
  //     this.right.push(val);
  //   }
  //   this.left.push(val);
  // };
