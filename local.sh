set -ex
rm -rf public/*
hugo server --buildDrafts --verbose --watch
#hugo server --verbose --watch
