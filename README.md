# Servo Demo

* Start local server

```
cd demo_pages
python -m SimpleHTTPServer # Use port 8000
```

* Have a working Servo repo

* Create a soft link (or copy) the `demo.sh` to the Servo repo
```
ln -s /path/to/demo.sh demo.sh
```

* Run 

```
cd /path/to/servo
chmod u+x demo.sh # make it executable
./demo.sh
```

## Credit: 
* [pcwalton](https://github.com/pcwalton/webrender-demos)
* [larsbergstrom](https://github.com/larsbergstrom/webrender-demos/tree/use_raf)
