# libgsf

A makefile for downloading and building [libgsf](https://www.leidos.com/products/ocean-marine#gsf) from source

## Quickstart

```bash
make
```

## Upgrading the version

In the makefile:
- Update the `VERSION` variable to the relevant version
- Check that the `C_FILES` and `H_FILES` variables are correct and match the contents of the zip that is downloaded

Once complete add a tag on master:
```bash
git checkout <commit to release>
git tag <version to release>
git push origin <version to release>
```

Then the publish action will pick up the tag and create a release
