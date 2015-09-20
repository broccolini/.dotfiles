# .dotfiles

These are my `.dotfiles` - *The files that live in my home directory which set configuration on my machine.* Suggestions welcome read over the [contributing](/CONTRIBUTING.md) guidelines.

The format and organization was heavily borrowed from [Zach Holman](https://github.com/holman/dotfiles). I've made changes to include some front end things that I tend to use a lot.

- Editor
  - Atom setup and install
  - Dash.app settings
  - All my linting configuration
- Setup node, and install npm packages I use.

## Install

If you want your dotfiles to be like mine, here's how you install them.

```sh
git clone https://github.com/jonrohan/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
script/bootstrap
script/install
```

`script/bootstrap` will symlink all the `*.symlink` files and folders to links in `~/.*`.

`script/install` will run every `*/install.sh` file in each folder. These are usually used to install packages or move things into place.

## Related

* [Zach Holman's dotfiles](http://github.com/holman/dotfiles)
* [Node.js open source software template](https://github.com/jonrohan/nodejs-oss-template)

## License

Originally forked from [@holman](http://github.com/holman/dotfiles).

MIT &copy; [Jon Rohan](http://jonrohan.codes)
