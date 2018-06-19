# mypage
Source files of my personal page

### new post
```
./new.sh the-title-example [--note]
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

### deploy
```
./Deploy.sh
```
:exclamation: `Deploy.sh` automatically `git push` the contents of `public/` to `https://github.com/<ID>/<ID>.github.io`
