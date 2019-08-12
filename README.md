# Requirements Generator

```bash
make generate DIRECTORY=<path to a directory containing a requirements.txt>
```

This will `pip install -r requirements.txt` in an empty `miniconda3` docker image,
and save the `pip freeze` to a file called `full-requirements.txt`

If there is no `requirements.txt`, this will also check for an `env.yaml` specifying
a `conda` environment, and save the full environment to `full-env.yaml`
