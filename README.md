A simple docker file that gives you a Ubuntu shell with volatility2 installed and configured.

To run and link the current dir to the container use: 

```bash
docker run -v $(pwd):/data --rm -it platinumxy/volatility2-shell
```

Or create a symlink to the vol2shell file and execute that in the target dir