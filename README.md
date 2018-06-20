# mypage
Source files of my personal page

### new post
```
hugo new <parent>/<entry-title>.md
```

### check draft
```
hugo server -D
```
then connect to `localhost:1313` from browser.

### rewrite draft
```
./rewrite.sh [--all]
```

### before deploy (for me...)
```
./predep.sh
```

### deploy
```
./Deploy.sh
```
:exclamation: `Deploy.sh` automatically `git push` the contents of `public/` to `https://github.com/<ID>/<ID>.github.io`
