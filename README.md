# kontainer: a PySpark Dockerfile

```
kontainer = spark + container - spar - c
```

Get it?


This Dockerfile can be used with the accompanying Makefile to start developing in PySpark with ease.

It takes care of:

* installing Java 8,
* installing Scala,
* downloading Spark,
* creating the `SPARK_HOME` environment variable,
* installing Python 3, and 
* installing Jupyter Lab and its table of contents extension.

It assumes you have a `github` folder in your `HOME` directory.

Have fun!

