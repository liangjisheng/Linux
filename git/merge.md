# merge

git merge默认使用的时“快进”（fast-forward）模式合并，所以 git merge <=> git merge -ff
--no-ff指的是强行关闭fast-forward方式

Git 合并两个分支时，如果顺着一个分支走下去可以到达另一个分支的话，那么 Git 在合并两者时，只会简单地把指针右移，叫做“快进”（fast-forward），比如下面

```conf
          A---B---C feature
         /
D---E---F master
```

要把 feature 合并到 master 中，执行以下命令

```shell
git checkout master
git merge feature
```

结果就会变成

```conf
          A---B---C feature
         /         master
D---E---F
```

git merge --no-ff(强制关闭快进模式)

因为 feature 就在 master 的下游，所以直接移动了 master 的指针，master 和 feature 都指向了 C。而如果执行了 git merge --no-ff feature 的话，是下面的结果

```conf
          A---B---C feature
         /         \
D---E---F-----------G master
```

由于 --no-ff 禁止了快进，所以会生成一个新的提交，master 指向 G

从合并后的代码来看，结果其实是一样的，区别就在于 --no-ff 会让 Git 生成一个新的提交对象。为什么要这样？通常我们把 master 作为主分支，上面存放的都是比较稳定的代码，提交频率也很低，而 feature 是用来开发特性的，上面会存在许多零碎的提交，快进式合并会把 feature 的提交历史混入到 master 中，搅乱 master 的提交历史。所以如果你根本不在意提交历史，也不爱管 master 干不干净，那么 --no-ff 其实没什么用。不过，如果某一次 master 出现了问题，你需要回退到上个版本的时候，比如上例，你就会发现退一个版本到了 B，而不是想要的 F，因为 feature 的历史合并进了 master 里

git merge --squash

git merge --squash 是用来把一些不必要commit进行压缩，比如说，你的feature在开发的时候写的commit很乱，那么我们合并的时候不希望把这些历史commit带过来，于是使用--squash进行合并，此时文件已经同合并后一样了，但不移动HEAD，不提交。需要进行一次额外的commit来“总结”一下，然后完成最终的合并

合并时 A,B,C 会压缩成一个 commit D 完成和 master 的合并

```conf
          A---B---C-->D feature
         /            \
D---E---F--------------G master
```
