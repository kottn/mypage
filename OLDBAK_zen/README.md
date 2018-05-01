# mypage
Source files of my personal page

### new post
```
./new.sh title
```

### check draft
```
hugo server -D && firefox localhost:1313
```

### rewrite draft
```
./rewrite.sh
```

### deploy
```
./deploy.sh
```
:exclamation: `deploy.sh` automatically `git push` the contents of `public/` to `https://github.com/<ID>/<ID>.github.io`