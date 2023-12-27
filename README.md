# dotfiles

Only macOS provisioning tool.

## Environments

- macOS 12.x and 13.x
- mitamae

## Run

```bash
git clone https://github.com/nnsnodnb/dotfiles.git && cd dotfiles
./setup.sh --node-json nodes/nnsnodnb.json
```

## Development

Require Ruby and bundler.

```bash
gem install bundler
bundle config set path './vendor/bundle'
bundle install
bundle exec itamae generate [cookbook|role] [NAME]
# more: bundle exec itamae help
```
