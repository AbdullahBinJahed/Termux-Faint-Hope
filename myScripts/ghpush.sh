echo "Last commit: $(git log --format=%B -n 1 $(git log -1 --pretty=format:"%h"))"
git add .
echo -e "commit message: \c"
read commit_message
git commit -m "$commit_message"
git push -u origin main
